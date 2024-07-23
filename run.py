import numpy as np
import networkx as nx

from graph_utils import GraphCreator, create_idc_dictionary
from Cycles import create_starting_config
from scheduling import ProcessingZone
from shuttle import main

plot = False
number_of_chains = 8

# Create a grid graph with the specified parameters
m, n, ion_chain_size_vertical, ion_chain_size_horizontal = 3, 3, 2, 2
pz1 = ProcessingZone('pz1', ((0, 0), (1, 0)))
pz2 = ProcessingZone('pz2', ((3, 4), (4, 4)))
pz3 = ProcessingZone('pz3', ((2, 2), (2, 3)))

sequence = [1, 0, 4, 7, 6, 2, 3, 5]
partition = {'pz1': [0, 1, 7], 'pz2': [3, 4, 9, 6], 'pz3': [2, 8, 5]}

# Ensure all elements are in one of the partitions
all_partition_elements = []
for elements in partition.values():
    all_partition_elements.extend(elements)
assert all(element in all_partition_elements for element in sequence)
# and no element is in both partitions
pz_sets = {pz: set(elements) for pz, elements in partition.items()}
common_elements = set.intersection(*pz_sets.values())
assert not common_elements, f"There are overlapping elements in the partitions: {common_elements}"

# Create a reverse mapping from element to partition name
map_to_pz = {element: pz for pz, elements in partition.items() for element in elements}

graph_creator = GraphCreator(m, n, ion_chain_size_vertical, ion_chain_size_horizontal)
G = graph_creator.get_graph()
G.plot = plot
G.pzs = [pz1, pz2, pz3]
G.map_to_pz = map_to_pz

create_starting_config(G, number_of_chains, seed=0)
G.idc_dict = create_idc_dictionary(G)

main(G, sequence, partition)
