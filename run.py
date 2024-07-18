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
sequence = [0, 1, 2, 1, 0, 3, 3, 3]
partition = {'pz1': [0, 1, 2, 3], 'pz2': [2]}

graph_creator = GraphCreator(m, n, ion_chain_size_vertical, ion_chain_size_horizontal)
G = graph_creator.get_graph()
G.plot = plot

create_starting_config(G, 4, seed=0)
G.idc_dict = create_idc_dictionary(G)

main(G, sequence, partition, pz1)
