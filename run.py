import math
import time
from pathlib import Path
import numpy as np
from Cycles import GraphCreator, MemoryZone
from scheduling import create_initial_sequence, create_starting_config, schedule
from partition import partition

show_plot = True
plot_filename = "plot.png"


def run_simulation_for_architecture(arch, seeds, max_timesteps, compilation=True):
    """
    Runs simulations for the given architecture and seeds, logs the results.

    Args:
        arch (list): Architecture parameters.
        seeds (list): List of seed values.
        max_timesteps (int): Maximum timesteps.
        compilation (bool): Compilation flag (Gate Selection Step).

    Returns:
        tuple: (timestep_arr, cpu_time_arr, number_of_registers, n_of_traps, seq_length)
    """
    timestep_arr = []
    cpu_time_arr = []
    start_time = time.time()

    for seed in seeds:
        m, n, v, h = arch
        graph = GraphCreator(m, n, v, h).get_graph()
        n_of_traps = len(
            [
                trap
                for trap in graph.edges()
                if graph.get_edge_data(trap[0], trap[1])["edge_type"] == "trap"
            ]
        )
        num_ion_chains = math.ceil(n_of_traps / 2)

        try:
            ion_chains, number_of_registers = create_starting_config(
                num_ion_chains, graph, seed=seed
            )
        except ValueError:
            continue

        directory = "QASM_files/full_register_access/"
        filename = f"{directory}full_register_access_{num_ion_chains}.qasm"
        print(f"arch: {arch}, seed: {seed}, registers: {number_of_registers}\n")

        time_2qubit_gate = 3
        time_1qubit_gate = 1
        max_chains_in_parking = 3

        memorygrid = MemoryZone(
            m,
            n,
            v,
            h,
            ion_chains,
            max_timesteps,
            max_chains_in_parking,
            time_2qubit_gate=time_2qubit_gate,
            time_1qubit_gate=time_1qubit_gate,
        )

        partition_for_scheduling = partition(filename, 2)
        print(partition_for_scheduling)
        # memorygrid.update_distance_map()
        seq, flat_seq = create_initial_sequence(filename)
        seq_length = len(seq)

        timestep = schedule(
            memorygrid,
            max_timesteps,
            partition_for_scheduling,
            show_plot,
            plot_filename,
        )

        timestep_arr.append(timestep)
        cpu_time = time.time() - start_time
        cpu_time_arr.append(cpu_time)

    return timestep_arr, cpu_time_arr, number_of_registers, n_of_traps, seq_length


def log_results(
    arch,
    timestep_arr,
    cpu_time_arr,
    number_of_registers,
    n_of_traps,
    seq_length,
    compilation=True,
):
    """
    Logs the results of the simulation to a file.

    Args:
        arch (list): Architecture parameters.
        timestep_arr (list): List of timesteps.
        cpu_time_arr (list): List of CPU times.
        number_of_registers (int): Number of registers.
        n_of_traps (int): Number of traps.
        seq_length (int): Sequence length.
        compilation (bool): Compilation flag (Gate Selection Step).
    """
    timestep_mean = np.mean(timestep_arr)
    np.var(timestep_arr)
    cpu_time_mean = np.mean(cpu_time_arr)

    file_path = Path("results.txt")
    try:
        with file_path.open("a") as file:
            line = (
                f"& {arch} & {number_of_registers}/{n_of_traps} & {seq_length} "
                f"& {timestep_mean} & {cpu_time_mean} s & Gate Sel={compilation} \\\\"
            )
            file.write(f"array ts: {timestep_arr}\n" + line + "\n\n")
    except FileNotFoundError:
        pass


def main():
    archs = [
        [4, 4, 2, 2],
    ]
    seeds = [0]  # , 1, 2, 3, 4]
    max_timesteps = 100000000

    for arch in archs:
        (
            timestep_arr,
            cpu_time_arr,
            number_of_registers,
            n_of_traps,
            seq_length,
        ) = run_simulation_for_architecture(
            arch, seeds, max_timesteps, compilation=True
        )
        log_results(
            arch,
            timestep_arr,
            cpu_time_arr,
            number_of_registers,
            n_of_traps,
            seq_length,
            compilation=True,
        )


if __name__ == "__main__":
    main()
