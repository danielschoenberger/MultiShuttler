from graph_utils import GraphCreator, create_idc_dictionary
from Cycles import create_starting_config, find_path_edge_to_edge
from scheduling import ProcessingZone, get_ion_chains
from shuttle import main
from partition import get_partition
from compilation import compile
import math

plot = False

# Create a grid graph with the specified parameters
m, n, ion_chain_size_vertical, ion_chain_size_horizontal = 6, 6, 1, 1
graph_creator = GraphCreator(m, n, ion_chain_size_vertical, ion_chain_size_horizontal)
G = graph_creator.get_graph()
G.plot = plot

number_of_chains = math.ceil(len(G.edges()) / 2)
print(f"Number of chains: {number_of_chains}")
qasm_file_path = (
    "QASM_files/full_register_access/full_register_access_%s.qasm" % number_of_chains
)
pz1 = ProcessingZone("pz1", ((0, 0), (1, 0)))
pz2 = ProcessingZone(
    "pz2",
    (
        (math.ceil((m - 1) / 2), math.ceil((n - 1) / 2)),
        (math.ceil((m - 1) / 2), math.ceil((n - 1) / 2) + 1),
    ),
)
pz3 = ProcessingZone("pz3", ((m - 1, n - 2), (m - 1, n - 1)))
G.pzs = [pz1, pz2, pz3]
create_starting_config(G, number_of_chains, seed=0)
G.idc_dict = create_idc_dictionary(G)
G.state = get_ion_chains(G)

sequence = compile(qasm_file_path)

# if there is a tuple in sequence (2-qbuit gate) use partitioning
if any(isinstance(i, tuple) for i in sequence):
    part = get_partition(qasm_file_path, len(G.pzs))
    partition = {pz.name: part[i] for i, pz in enumerate(G.pzs)}
else:
    # else place them in the closest processing zone (equally distributed)
    # TODO double check
    partition = {pz.name: [] for pz in G.pzs}
    # Assign each ion to the closest processing zone
    for ion, position in G.state.items():
        closest_pz = None
        min_distance = float("inf")
        for pz in G.pzs:
            distance = len(find_path_edge_to_edge(G, position, pz.edge_idc))
            if distance < min_distance:
                min_distance = distance
                closest_pz = pz
        partition[closest_pz.name].append(ion)
    # Balance the ions among the processing zones
    all_ions = [ion for ions in partition.values() for ion in ions]
    all_ions.sort(key=lambda ion: G.state[ion])
    num_pzs = len(G.pzs)
    ions_per_pz = len(all_ions) // num_pzs
    for i, pz in enumerate(G.pzs):
        start_index = i * ions_per_pz
        end_index = start_index + ions_per_pz
        partition[pz.name] = all_ions[start_index:end_index]
    # Distribute any remaining ions
    remaining_ions = all_ions[num_pzs * ions_per_pz :]
    for i, ion in enumerate(remaining_ions):
        partition[G.pzs[i % num_pzs].name].append(ion)

# Create a reverse mapping from element to partition name
map_to_pz = {element: pz for pz, elements in partition.items() for element in elements}
G.map_to_pz = map_to_pz

# Ensure all elements are in one of the partitions
all_partition_elements = []
for elements in partition.values():
    all_partition_elements.extend(elements)

assert all(element in all_partition_elements for element in sequence)
# and no element is in both partitions
pz_sets = {pz: set(elements) for pz, elements in partition.items()}
common_elements = set.intersection(*pz_sets.values())
assert (
    not common_elements
), f"There are overlapping elements in the partitions: {common_elements}"

main(G, sequence, partition)
