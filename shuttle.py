from Cycles import get_ion_chains
from scheduling import (
    create_move_list,
    create_priority_queue,
    get_partitioned_priority_queues,
    find_movable_cycles,
    rotate_free_cycles,
    create_cycles_for_moves,
    preprocess,
)
from plotting import plot_state


def shuttle(graph, sequence, partition, timestep):
    priority_queue = create_priority_queue(graph, sequence)
    preprocess(graph, priority_queue)

    # Update ion chains after preprocess
    graph.state = get_ion_chains(graph)

    part_prio_queues = get_partitioned_priority_queues(graph, priority_queue, partition)
    all_cycles = {}

    # Iterate over all processing zones
    for pz in graph.pzs:
        prio_queue = part_prio_queues[pz.name]
        move_list = create_move_list(graph, prio_queue, pz)
        cycles = create_cycles_for_moves(graph, move_list, pz)
        all_cycles = {**all_cycles, **cycles}

    chains_to_rotate = find_movable_cycles(graph, all_cycles, priority_queue)
    rotate_free_cycles(graph, all_cycles, chains_to_rotate)

    labels = ("timestep %s" % timestep, None)
    plot_state(
        graph,
        labels,
        plot_ions=True,
        show_plot=graph.plot,
        save_plot=False,
        plot_cycle=False,
        plot_pzs=True,
        filename="",
    )


def main(graph, sequence, partition):
    timestep = 0
    max_timesteps = 1e6
    graph.state = get_ion_chains(graph)

    while timestep < max_timesteps:
        print("Timestep % s" % timestep)

        shuttle(graph, sequence, partition, timestep)
        graph.state = get_ion_chains(graph)

        processed_ions = []
        previous_ion_processed = True
        # Check the state of each ion in the sequence
        for i in range(min(len(graph.pzs), len(sequence))):
            if not previous_ion_processed:
                break
            ion = sequence[i]
            ion_processed = False
            for pz in graph.pzs:
                if graph.state[ion] == pz.edge_idc:
                    print(f"Ion {ion} at Processing Zone {pz.name}")
                    processed_ions.insert(0, ion)
                    ion_processed = True
                    break
            previous_ion_processed = ion_processed

        # Remove processed ions from the sequence
        for ion in processed_ions:
            sequence.remove(ion)

        if len(sequence) == 0:
            print(f"All ions have arrived at their destination in {timestep} timesteps")
            break

        timestep += 1
