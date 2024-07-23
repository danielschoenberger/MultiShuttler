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

sequence = [1, 0, 4, 7, 6, 2, 3, 5]
partition = {'pz1': [0, 1, 2], 'pz2': [3, 4, 5, 6, 7, 8, 9]}

# make sure all elements are in one of the partition
assert all(element in partition['pz1'] + partition['pz2'] for element in sequence)
# and no element is in both partitions
pz_sets = {pz: set(elements) for pz, elements in partition.items()}
common_elements = set.intersection(*pz_sets.values())
assert not common_elements, f"There are overlapping elements in the partitions: {common_elements}"

# Create a reverse mapping from element to partition name
map_to_pz = {element: pz for pz, elements in partition.items() for element in elements}

graph_creator = GraphCreator(m, n, ion_chain_size_vertical, ion_chain_size_horizontal)
G = graph_creator.get_graph()
G.plot = plot
G.pzs = [pz1, pz2]
G.map_to_pz = map_to_pz

create_starting_config(G, number_of_chains, seed=0)
G.idc_dict = create_idc_dictionary(G)

main(G, sequence, partition)
