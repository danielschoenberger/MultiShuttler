import networkx as nx
from more_itertools import distinct_combinations, pairwise

# create dictionary to swap from idx to idc and vice versa
def create_idc_dictionary(nx_g):
    edge_dict = {}
    for edge_idx, edge_idc in enumerate(nx_g.edges()):
        edge_dict[edge_idx] = tuple(sorted(edge_idc, key=sum))
    return edge_dict

def get_idx_from_idc(edge_dictionary, idc):
    idc = tuple(sorted(idc, key=sum))
    return list(edge_dictionary.values()).index(idc)

def get_idc_from_idx(edge_dictionary, idx):
    return edge_dictionary[idx]


def get_path_to_node(nx_g, src, tar, exclude_exit=False, exclude_first_entry_connection=True):
    edge_path = []
    if exclude_first_entry_connection is True:
        # lambda function to give path over processing zone huge weight -> doesn't take that path if not necessary - now only encludes entry edge -> can use exit (in MemGrid was != trap before and then to exit node -> not PZ node)
        node_path = nx.shortest_path(
            nx_g,
            src,
            tar,
            lambda _, __, edge_attr_dict: (edge_attr_dict["edge_type"] == "first_entry_connection") * 1e8 + 1,
        )
        # also exclude exit edge if necessary
        if exclude_exit is True:
            node_path = nx.shortest_path(
                nx_g,
                src,
                tar,
                lambda _, __, edge_attr_dict: (edge_attr_dict["edge_type"] in ("first_entry_connection", "exit")) * 1e8
                + 1,
            )

    # only exclude exit edge
    elif exclude_exit is True:
        node_path = nx.shortest_path(
            nx_g, src, tar, lambda _, __, edge_attr_dict: (edge_attr_dict["edge_type"] == "exit") * 1e8 + 1
        )

    else:
        node_path = nx.shortest_path(nx_g, src, tar)
    # shortest path should always be the correct path in a grid -> care for changes

    for edge in pairwise(node_path):
        edge_path.append(edge)

    return edge_path


def calc_dist_to_pz(nx_g_creator, edge_idx):
    edge_idc = get_idc_from_idx(nx_g_creator.idc_dict, edge_idx)
    node1, node2 = edge_idc[0], edge_idc[1]

    path1 = get_path_to_node(
        nx_g_creator.networkx_graph, node1, nx_g_creator.processing_zone, exclude_first_entry_connection=True
    )
    path2 = get_path_to_node(
        nx_g_creator.networkx_graph, node2, nx_g_creator.processing_zone, exclude_first_entry_connection=True
    )
    if edge_idx == get_idx_from_idc(nx_g_creator.idc_dict, nx_g_creator.parking_edge):
        return 0
    if edge_idx == get_idx_from_idc(nx_g_creator.idc_dict, nx_g_creator.first_entry_connection_from_pz):
        return max(len(path1), len(path2)) + 1
    return min(len(path1), len(path2)) + 1


class GraphCreator:
    def __init__(self, m, n, ion_chain_size_vertical, ion_chain_size_horizontal):
        self.m = m
        self.n = n
        self.ion_chain_size_vertical = ion_chain_size_vertical
        self.ion_chain_size_horizontal = ion_chain_size_horizontal

        self.networkx_graph = self.create_graph()
        self.idc_dict = create_idc_dictionary(self.networkx_graph)

    def create_graph(self):
        self.m_extended = self.m + (self.ion_chain_size_vertical - 1) * (self.m - 1)
        self.n_extended = self.n + (self.ion_chain_size_horizontal - 1) * (self.n - 1)

        networkx_graph = nx.grid_2d_graph(self.m_extended, self.n_extended)
        self._set_trap_nodes(networkx_graph)
        self._remove_horizontal_edges(networkx_graph)
        self._remove_vertical_edges(networkx_graph)
        self._remove_horizontal_nodes(networkx_graph)
        self._set_junction_nodes(networkx_graph)
        nx.set_edge_attributes(networkx_graph, "trap", "edge_type")

        return networkx_graph

    def _set_trap_nodes(self, networkx_graph):
        for node in networkx_graph.nodes():
            networkx_graph.add_node(node, node_type="trap_node", color="b")

    def _remove_horizontal_edges(self, networkx_graph):
        for i in range(0, self.m_extended - self.ion_chain_size_vertical, self.ion_chain_size_vertical):
            for k in range(1, self.ion_chain_size_vertical):
                for j in range(self.n_extended - 1):
                    networkx_graph.remove_edge((i + k, j), (i + k, j + 1))

    def _remove_vertical_edges(self, networkx_graph):
        for i in range(0, self.n_extended - self.ion_chain_size_horizontal, self.ion_chain_size_horizontal):
            for k in range(1, self.ion_chain_size_horizontal):
                for j in range(self.m_extended - 1):
                    networkx_graph.remove_edge((j, i + k), (j + 1, i + k))

    def _remove_horizontal_nodes(self, networkx_graph):
        for i in range(0, self.m_extended - self.ion_chain_size_vertical, self.ion_chain_size_vertical):
            for k in range(1, self.ion_chain_size_vertical):
                for j in range(0, self.n_extended - self.ion_chain_size_horizontal, self.ion_chain_size_horizontal):
                    for s in range(1, self.ion_chain_size_horizontal):
                        networkx_graph.remove_node((i + k, j + s))

    def _remove_mid_part(self, networkx_graph):
        for i in range(self.ion_chain_size_vertical):
            networkx_graph.remove_node((self.m_extended // 2, self.n_extended // 2 + i))
        for i in range(1, self.ion_chain_size_vertical):
            networkx_graph.remove_node((self.m_extended // 2, self.n_extended // 2 - i))
        for i in range(1, self.ion_chain_size_horizontal):
            networkx_graph.remove_node((self.m_extended // 2 + i, self.n_extended // 2))
        for i in range(1, self.ion_chain_size_horizontal):
            networkx_graph.remove_node((self.m_extended // 2 - i, self.n_extended // 2))

    def _set_junction_nodes(self, networkx_graph):
        for i in range(0, self.m_extended, self.ion_chain_size_vertical):
            for j in range(0, self.n_extended, self.ion_chain_size_horizontal):
                networkx_graph.add_node((i, j), node_type="junction_node", color="g")

    def get_graph(self):
        return self.networkx_graph

