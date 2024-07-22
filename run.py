import numpy as np
import networkx as nx

from graph_utils import GraphCreator, create_idc_dictionary
from Cycles import create_starting_config
from scheduling import ProcessingZone
from shuttle import main

plot = False

# Create a grid graph with the specified parameters
m, n, ion_chain_size_vertical, ion_chain_size_horizontal = 3, 3, 2, 2
pz1 = ProcessingZone('pz1', ((0, 0), (1, 0)))
pz2 = ProcessingZone('pz2', ((3, 4), (4, 4)))

sequence = [0, 3, 2, 1, 0, 3, 3, 3]
partition = {'pz1': [0, 3], 'pz2': [1, 2]}

# Create a reverse mapping from element to partition name
map_to_pz = {element: pz for pz, elements in partition.items() for element in elements}

graph_creator = GraphCreator(m, n, ion_chain_size_vertical, ion_chain_size_horizontal)
G = graph_creator.get_graph()
G.plot = plot
G.pzs = [pz1, pz2]
G.map_to_pz = map_to_pz

create_starting_config(G, 4, seed=0)
G.idc_dict = create_idc_dictionary(G)

main(G, sequence, partition)
