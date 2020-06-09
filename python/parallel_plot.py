import os
import matplotlib.pyplot as plt

directory = "/home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/slurm/outputs"
matrix_files = []

for filename in os.listdir(directory):
	if (filename.endswith('matrix.out')):
		matrix_files.append(filename) 
print(matrix_files)
for filename in matrix_files:
	if(filename == "result_serial_matrix.out"):
		open_file = open(directory + "/" + filename, 'r')
		lines = open_file.readlines()
		wall_time = lines[5]
		ms = wall_time[0:3]
		print(ms)
