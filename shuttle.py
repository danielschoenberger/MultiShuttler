from Cycles import get_ion_chains
from scheduling import (
    create_move_list,
    create_priority_queue,
    get_partitioned_priority_queues,
    find_movable_cycles,
    rotate_free_cycles,
    create_cycles_for_moves,
    preprocess,
    create_gate_info_list,
)
from plotting import plot_state
import os
from datetime import datetime


def shuttle(graph, priority_queue, partition, timestep, unique_folder):
    gate_info_list = create_gate_info_list(graph)
    # print(f"Gate info list: {gate_info_list}")

    # "swap" ions in the same processing zone if only one is needed
    for pz in graph.pzs:
        ions_at_pz = graph[pz.edge_idc[0]][pz.edge_idc[1]]["ions"]
        if len(ions_at_pz) == 2:
            ion1, ion2 = ions_at_pz
            if ion2 not in gate_info_list[pz.name]:
                graph[pz.edge_idc[0]][pz.edge_idc[1]]["ions"].remove(ion2)
                graph[pz.edge_idc[0]][pz.edge_idc[1]]["ions"].insert(0, ion2)
                # print('swapped, now: %s' % ions_at_pz)
            # TODO ion1 swap also necessary?
            if ion1 not in gate_info_list[pz.name]:
                graph[pz.edge_idc[0]][pz.edge_idc[1]]["ions"].remove(ion1)
                graph[pz.edge_idc[0]][pz.edge_idc[1]]["ions"].insert(0, ion1)
                # print('swap %s' % ions_at_pz)

    preprocess(graph, priority_queue)

    # Update ion chains after preprocess
    graph.state = get_ion_chains(graph)

    part_prio_queues = get_partitioned_priority_queues(graph, priority_queue, partition)

    all_cycles = {}
    # Iterate over all processing zones
    # create move list for each pz -> needed to get all cycles
    # priority queue later picks the cycles to rotate
    for pz in graph.pzs:
        prio_queue = part_prio_queues[pz.name]
        move_list = create_move_list(graph, prio_queue, pz)
        cycles = create_cycles_for_moves(graph, move_list, pz)
        # add cycles to all_cycles
        all_cycles = {**all_cycles, **cycles}
    # print(f"All cycles: {all_cycles}")

    # now general priority queue picks cycles to rotate
    chains_to_rotate = find_movable_cycles(graph, all_cycles, priority_queue)
    # print(f"Chains to rotate: {chains_to_rotate}")

    rotate_free_cycles(graph, all_cycles, chains_to_rotate)

    # new: postprocess?
    # -> ions can already move into processing zone if they pass a junction
    # Update ion chains after rotate
    graph.state = get_ion_chains(graph)
    preprocess(graph, priority_queue)

    labels = ("timestep %s" % timestep, "remaining sequence: %s" % graph.sequence)

    plot_state(
        graph,
        labels,
        plot_ions=True,
        show_plot=graph.plot,
        save_plot=graph.save,
        plot_cycle=False,
        plot_pzs=True,
        filename=os.path.join(
            unique_folder, "%s_timestep_%s.png" % (graph.arch, timestep)
        ),
    )


def main(graph, sequence, partition):
    timestep = 0
    max_timesteps = 1e6
    graph.state = get_ion_chains(graph)

    unique_folder = os.path.join("runs", datetime.now().strftime("%Y%m%d_%H%M%S"))
    os.makedirs(unique_folder, exist_ok=True)

    plot_state(
        graph,
        labels=("Initial state", None),
        plot_ions=True,
        show_plot=graph.plot,
        save_plot=graph.save,
        plot_cycle=False,
        plot_pzs=False,
        filename=os.path.join(
            unique_folder, "%s_timestep_%s.png" % (graph.arch, timestep)
        ),
    )

    graph.in_process = []
    while timestep < max_timesteps:
        print(f"\nStarting timestep {timestep}")
        print(f"Remaining sequence: {graph.sequence}")

        # priority queue is dict with ions as keys and pz as values
        # (for 2-qubit gates pz may not match the pz of the individual ion)
        priority_queue, next_gate_at_pz = create_priority_queue(graph, sequence)

        # check if ions are already in processing zone ->
        # important for 2-qubit gates
        # -> leave ion in processing zone if needed in a 2-qubit gate
        for i in range(min(len(graph.pzs), len(sequence))):
            # only continue if previous ion was processed
            gate = sequence[i]

            if len(gate) == 2:
                ion1, ion2 = gate
                for pz in graph.pzs:
                    state1 = graph.state[ion1]
                    state2 = graph.state[ion2]
                    # append ion to in_process if it is in the correct processing zone
                    if (
                        state1 == pz.edge_idc
                        and ion1 in next_gate_at_pz[pz.name]
                        and ion2 in next_gate_at_pz[pz.name]
                    ):
                        graph.in_process.append(ion1)
                        # print(f"Added ion {ion1} to in_process")
                    if (
                        state2 == pz.edge_idc
                        and ion1 in next_gate_at_pz[pz.name]
                        and ion2 in next_gate_at_pz[pz.name]
                    ):
                        graph.in_process.append(ion2)
                        # print(f"Added ion {ion2} to in_process")

        # print('in process before shuttling:', graph.in_process)

        # shuttle one timestep
        shuttle(graph, priority_queue, partition, timestep, unique_folder)

        # reset ions in process
        graph.in_process = []

        # Check the state of each ion in the sequence
        graph.state = get_ion_chains(graph)
        processed_ions = []
        previous_ion_processed = True
        pzs = graph.pzs.copy()
        # go through the first gates in the sequence (as many as pzs or sequence length)
        # for now, gates are processed in order
        # (can only be processed in parallel if previous gates are processed)
        for i in range(min(len(graph.pzs), len(sequence))):
            # only continue if previous ion was processed
            if not previous_ion_processed:
                break
            gate = sequence[i]
            ion_processed = False
            # wenn auf weg zu pz in anderer pz -> wird processed?
            # Problem nur für 2-qubit gate? -> TODO fix
            for pz in pzs:
                if len(gate) == 1:
                    ion = gate[0]
                    if graph.state[ion] == pz.edge_idc:
                        print(f"Ion {ion} at Processing Zone {pz.name}")
                        processed_ions.insert(0, (ion,))
                        ion_processed = True
                        # remove the processing zone from the list
                        # (it can only process one ion)
                        pzs.remove(pz)
                        # graph.in_process.append(ion)
                        break
                elif len(gate) == 2:
                    ion1, ion2 = gate
                    state1 = graph.state[ion1]
                    state2 = graph.state[ion2]

                    # The following is now done at the beginning of next timestep
                    # (otherwise would do it double
                    # -> would leave the ones from last time step in in_process
                    #  -> would not move even though
                    # they are move out of pz by preprocessing)
                    # append ion to in_process if it is in the correct processing zone
                    # if state1 == pz.edge_idc and ion1 in next_gate_at_pz[pz.name]
                    # and ion2 in next_gate_at_pz[pz.name]:
                    #     graph.in_process.append(ion1)
                    # if state2 == pz.edge_idc and ion1 in next_gate_at_pz[pz.name]
                    # and ion2 in next_gate_at_pz[pz.name]: # also 1 qubit gate?
                    #     graph.in_process.append(ion2)

                    # if both ions are in the processing zone, process the gate
                    if state1 == pz.edge_idc and state2 == pz.edge_idc:
                        print(f"Ions {ion1} and {ion2} at Processing Zone {pz.name}")
                        processed_ions.insert(0, (ion1, ion2))
                        ion_processed = True
                        # remove the processing zone from the list
                        # (it can only process one gate)
                        pzs.remove(pz)
                        break
                else:
                    raise ValueError("Invalid gate format")
            previous_ion_processed = ion_processed

        # Remove processed ions from the sequence
        for gate in processed_ions:
            sequence.remove(gate)

        if len(sequence) == 0:
            print(f"All ions have arrived at their destination in {timestep} timesteps")
            break

        timestep += 1

    return timestep
