from Cycles import get_ion_chains
from scheduling import create_move_list, create_priority_queue, find_movable_cycles, rotate_free_cycles, create_cycles_for_moves, preprocess
from plotting import plot_state

def shuttle(graph, sequence, partition, pz, timestep):
    priority_queue = create_priority_queue(graph, sequence)
    preprocess(graph, priority_queue, pz)

    # update ion chains after preprocesss
    graph.state = get_ion_chains(graph)

    move_list_1 = create_move_list(graph, priority_queue, partition, pz)

    all_cycles = create_cycles_for_moves(graph, move_list_1, pz)
    chains_to_rotate = find_movable_cycles(graph, all_cycles, move_list_1)
    gates_executed = rotate_free_cycles(graph, all_cycles, chains_to_rotate)

    labels = ("timestep %s" % timestep, None)
    plot_state(graph, labels, plot_ions=True, show_plot=graph.plot, save_plot=False, plot_cycle=False, filename="")

    return gates_executed

def main(graph, sequence, partition, pz):
    timestep = 0
    max_timesteps = 1e6
    graph.state = get_ion_chains(graph)

    while timestep < max_timesteps:
        shuttle(graph, sequence, partition, pz, timestep)
        graph.state = get_ion_chains(graph)
        if graph.state[sequence[0]] == pz.edge_idc:
            print("Ion %s at Processing Zone %s" % (sequence[0], pz.name))
            if len(sequence) == 1:
                print("All ions have arrived at their destination in %s timesteps" % timestep)
                break
            sequence.pop(0)

        timestep += 1
