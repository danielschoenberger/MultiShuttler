from Cycles import get_ion_chains
from scheduling import create_move_list, create_priority_queue, get_partitioned_priority_queues, find_movable_cycles, rotate_free_cycles, create_cycles_for_moves, preprocess
from plotting import plot_state

def shuttle(graph, sequence, partition, timestep):
    priority_queue = create_priority_queue(graph, sequence)
    preprocess(graph, priority_queue)

    # update ion chains after preprocesss
    graph.state = get_ion_chains(graph)

    part_prio_queues = get_partitioned_priority_queues(graph, priority_queue, partition)
    prio_queue_1 = part_prio_queues[graph.pzs[0].name]
    prio_queue_2 = part_prio_queues[graph.pzs[1].name]
    move_list_1 = create_move_list(graph, prio_queue_1, graph.pzs[0])
    move_list_2 = create_move_list(graph, prio_queue_2, graph.pzs[1])

    all_cycles_1 = create_cycles_for_moves(graph, move_list_1, graph.pzs[0])
    all_cycles_2 = create_cycles_for_moves(graph, move_list_2, graph.pzs[1])
    all_cycles = {**all_cycles_1, **all_cycles_2}

    chains_to_rotate = find_movable_cycles(graph, all_cycles, priority_queue)
    rotate_free_cycles(graph, all_cycles, chains_to_rotate)

    labels = ("timestep %s" % timestep, None)
    plot_state(graph, labels, plot_ions=True, show_plot=graph.plot, save_plot=False, plot_cycle=False, filename="")

def main(graph, sequence, partition):
    timestep = 0
    max_timesteps = 1e6
    graph.state = get_ion_chains(graph)

    while timestep < max_timesteps:
        shuttle(graph, sequence, partition, timestep)
        graph.state = get_ion_chains(graph)
        #if graph.state[sequence[0]] in [pz.edge_idc for pz in graph.pzs]:
        if graph.state[sequence[0]] == graph.pzs[0].edge_idc:
            print("Ion %s at Processing Zone %s" % (sequence[0], graph.pzs[0].name))
            if len(sequence) == 1:
                print("All ions have arrived at their destination in %s timesteps" % timestep)
                break
            sequence.pop(0)
        elif graph.state[sequence[0]] == graph.pzs[1].edge_idc:
            print("Ion %s at Processing Zone %s" % (sequence[0], graph.pzs[1].name))
            if len(sequence) == 1:
                print("All ions have arrived at their destination in %s timesteps" % timestep)
                break
            sequence.pop(0)

        timestep += 1
