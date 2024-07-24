import numpy as np
from more_itertools import pairwise, distinct_combinations
from Cycles import (
    get_ion_chains,
    get_edge_state,
    find_path_edge_to_edge,
    find_next_edge,
    find_ordered_edges,
    check_if_edge_is_filled,
    create_cycle,
    have_common_junction_node,
)
from graph_utils import get_idx_from_idc


class ProcessingZone:
    def __init__(self, name, edge_idc):
        self.name = name
        self.edge_idc = edge_idc


def preprocess(graph, priority_queue):
    need_rotate = [False] * len(priority_queue)
    while sum(need_rotate) < len(priority_queue):
        for i, rotate_chain in enumerate(priority_queue):
            pz_name = graph.map_to_pz[rotate_chain]
            pz_edge_idc = [pz.edge_idc for pz in graph.pzs if pz.name == pz_name][0]

            edge_idc = graph.state[rotate_chain]
            next_edge = find_next_edge(graph, edge_idc, pz_edge_idc)
            state_edges_idx = get_edge_state(graph)
            if (
                have_common_junction_node(graph, edge_idc, next_edge) is False
                and get_idx_from_idc(graph.idc_dict, next_edge) not in state_edges_idx
            ):
                graph.state[rotate_chain] = next_edge
            else:
                need_rotate[i] = True


def create_priority_queue(graph, sequence, max_length=10):
    """
    Generates a priority queue of ions that need to move to processing zones.

    Parameters:
        graph (Graph): Graph representing the QCCD architecture.
        sequence (list): Sequence of ions needed in a processing zone.
        max_length (int): The maximum length of the move list. Default is 10.

    Returns:
        list: list of which ions are moving in what order to the processing zones.
    """
    # TODO could take the circuit as input and calc dag dep and sequence from that

    # unique sequence: sequence without repeating elements
    # (for move_list and 2-qubit gates)
    unique_sequence = []
    for seq_elem in sequence:
        if seq_elem not in unique_sequence:
            unique_sequence.append(seq_elem)
            if len(unique_sequence) == max_length:
                break
    return unique_sequence


def get_partitioned_priority_queues(graph, priority_queue, partition):
    partitioned_priority_queues = {}
    for pz in graph.pzs:
        # use partition to find chains of priority queue that move to this pz
        partitioned_priority_queues[pz.name] = [
            elem for elem in priority_queue if elem in partition[pz.name]
        ]
    return partitioned_priority_queues


def create_move_list(graph, partitioned_priority_queue, pz):
    """
    Generates a move list for a specific processing zone edge.

    Parameters:
        graph (Graph): Graph representing the QCCD architecture.
        sequence (list): Sequence of ions needed in the particular processing zone.
        pz (str): Processing zone edge used to execute the gate (e.g. 'pz1').

    Returns:
        list: list of which ions are moving to a specific processing zone next
        (at a given time step).
    """
    # get location of chains
    ion_chains = get_ion_chains(graph)  # could calc outside of fct?

    # determine which of the pz-specific priority queue can move (=move_list)
    path_length_sequence = {}
    move_list = []
    for i, rotate_chain in enumerate(partitioned_priority_queue):
        edge_idc = ion_chains[rotate_chain]
        path_to_go = find_path_edge_to_edge(
            graph, edge_idc, pz.edge_idc
        )  # could calc outside of fct?
        path_length_sequence[rotate_chain] = len(path_to_go)

        # append to move list if further away than all needed before
        if i == 0 or sum(
            np.array([path_length_sequence[rotate_chain]] * len(move_list))
            > np.array([path_length_sequence[chain] for chain in move_list])
        ) == len(move_list):
            move_list.append(rotate_chain)

    return move_list


def create_cycles_for_moves(graph, move_list, pz):
    # create cycles for all chains in move_list
    # (dictionary with chain as key and cycle_idcs as value)
    all_cycles = {}
    ion_chains = graph.state  # was pre calc after preprocess

    for rotate_chain in move_list:
        edge_idc = ion_chains[rotate_chain]
        next_edge = find_next_edge(graph, edge_idc, pz.edge_idc)

        # make edge_idc and next_edge consistent
        edge_idc, next_edge = find_ordered_edges(graph, edge_idc, next_edge)

        # moves without cycle (if edge is free or stop move -> edge_idc == next_edge)
        if not check_if_edge_is_filled(graph, next_edge) or edge_idc == next_edge:
            all_cycles[rotate_chain] = [edge_idc, next_edge]

        # moves with cycle
        else:
            # create cycle
            all_cycles[rotate_chain] = create_cycle(graph, edge_idc, next_edge)

    return all_cycles


def find_conflict_cycle_idxs(graph, cycles_dict):
    combinations_of_cycles = list(distinct_combinations(cycles_dict.keys(), 2))

    def get_cycle_nodes(cycle):
        # if next edge is free -> cycle is just two edges
        # -> can skip first and last node
        if len(cycles_dict[cycle]) == 2:
            if cycles_dict[cycle][0] != cycles_dict[cycle][1]:
                cycle_or_path = [(cycles_dict[cycle][0][1], cycles_dict[cycle][1][0])]
                assert (
                    cycles_dict[cycle][0][1] == cycles_dict[cycle][1][0]
                ), "cycle is not two edges? Middle node should be the same"
            # else if path is same edge twice skip (but keep first node
            # -> no movement into this edge)
            else:
                cycle_or_path = [(cycles_dict[cycle][0][0], cycles_dict[cycle][0][0])]
        # if cycle is real cycle -> need to check all nodes
        elif cycles_dict[cycle][0] == cycles_dict[cycle][-1]:
            cycle_or_path = cycles_dict[cycle]

        else:
            raise ValueError("cycle is not two edges or a real cycle?")

        nodes = set()
        for edge in cycle_or_path:
            node1, node2 = edge
            if node1 == node2:
                nodes.add(node1)
            else:
                nodes.add(node1)
                nodes.add(node2)
        return nodes

    junction_shared_pairs = []
    for cycle1, cycle2 in combinations_of_cycles:
        nodes1 = get_cycle_nodes(cycle1)
        nodes2 = get_cycle_nodes(cycle2)

        # if cycles got common junction or end in same edge
        if (
            # len(nodes1.intersection(nodes2).intersection(graph.junction_nodes)) > 0
            len(nodes1.intersection(nodes2))
            > 0
        ) or (
            get_idx_from_idc(graph.idc_dict, cycles_dict[cycle1][-1])
            == (get_idx_from_idc(graph.idc_dict, cycles_dict[cycle2][-1]))
        ):
            junction_shared_pairs.append((cycle1, cycle2))

    return junction_shared_pairs


def find_movable_cycles(graph, all_cycles, priority_queue):
    # find cycles that can move while first seq ion is moving
    nonfree_cycles = find_conflict_cycle_idxs(graph, all_cycles)
    free_cycle_seq_idxs = [priority_queue[0]]
    for seq_cyc in priority_queue[1:]:
        nonfree = False
        for mov_cyc in free_cycle_seq_idxs:
            if (seq_cyc, mov_cyc) in nonfree_cycles or (
                mov_cyc,
                seq_cyc,
            ) in nonfree_cycles:
                nonfree = True
                break
        if nonfree is False:
            free_cycle_seq_idxs.append(seq_cyc)
    return free_cycle_seq_idxs


def rotate(graph, ion, cycle_idcs):
    """
    Rotates ions along their respective cycles

    Parameters:
        graph (Graph): Graph representing the QCCD architecture.
        ion (int): Ion to be rotated (for which the cycle was created).
        cycle_idcs (dict): ions as keys,
        their individual cycle (or next_edge move) as values.
    """
    state_dict = get_edge_state(graph)

    first = True
    for current_edge, new_edge in pairwise(cycle_idcs):
        # make current_edge and new_edge consistent
        current_edge = tuple(sorted(current_edge, key=sum))
        new_edge = tuple(sorted(new_edge, key=sum))

        # find current ion on edge
        # (ion could have already moved via a different cycle before)
        current_ion = state_dict.get(current_edge)

        # if current ion on first edge of cycle is different now
        # -> exit function (skip cycle)
        if first and current_ion != ion:
            print("ion already rotated via previous cycle")
            # TODO if rotated in wrong direction, could rotate back
            return
        first = False

        # otherwise rotate cycle
        if current_ion is not None:
            graph.edges[current_edge]["ions"].remove(current_ion)
            graph.edges[new_edge]["ions"].append(current_ion)


def rotate_free_cycles(graph, all_cycles, free_cycles_idxs):
    # collect all free cycles
    rotate_cycles_idcs = {}
    for cycle_ion in free_cycles_idxs:
        # need try clause here, since priority queue is used in find_movable_cycles()
        # -> could contain ions not in all_cycles
        # since create_cycles_for_moves() uses partitioned priority queue (move lists)
        # and in move lists some ions could have already been sorted out
        try:
            rotate_cycles_idcs[cycle_ion] = all_cycles[cycle_ion]
        except KeyError:
            pass
    for ion, indiv_cycle_idcs in rotate_cycles_idcs.items():
        rotate(graph, ion, indiv_cycle_idcs)
