import os
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches

os.chdir("..")
os.chdir("slurm/outputs")
directory = os.getcwd()
matrix_files = []
runtimes_dict = {}

for filename in os.listdir(directory):
	if (filename.endswith('matrix.out')):
		matrix_files.append(filename) 

for filename in matrix_files:
	if(filename == "result_serial_matrix.out"):
		open_file = open(directory + "/" + filename, 'r')
		lines = open_file.readlines()
		wall_time = lines[5]
		millisecs = wall_time.split()[0]
		x_values = [int(2), int(4), int(8)]
		y_values = [millisecs, millisecs, millisecs]
		runtimes_dict['serial'] = (x_values, y_values)
	if(filename == "result_open_mp_matrix.out"):
		open_file = open(directory + "/" + filename, 'r')
		lines = open_file.readlines()
		wall_time_1 = lines[1]
		millisecs_1 = wall_time_1.split()[0]
		wall_time_2 = lines[3]
		millisecs_2 = wall_time_2.split()[0]
		wall_time_3 = lines[5]
		millisecs_3 = wall_time_3.split()[0]
		x_values = [int(2), int(4), int(8)]
		y_values = [millisecs_1, millisecs_2, millisecs_3]
		runtimes_dict['open_mp'] = (x_values, y_values)
	if(filename == "result_mpi_matrix.out"):
		open_file = open(directory + "/" + filename, 'r')
		lines = open_file.readlines()
		wall_time_1 = lines[1]
		millisecs_1 = wall_time_1.split()[0]
		wall_time_2 = lines[3]
		millisecs_2 = wall_time_2.split()[0]
		wall_time_3 = lines[5]
		millisecs_3 = wall_time_3.split()[0]
		x_values = [int(2), int(4), int(8)]
		y_values = [millisecs_1, millisecs_2, millisecs_3]
		runtimes_dict['mpi'] = (x_values, y_values)

red_patch = mpatches.Patch(color = 'red', label = 'Serial C Code')
green_patch = mpatches.Patch(color = 'green', label = 'OpenMP Shared Memory Threads')
blue_patch = mpatches.Patch(color = 'blue', label = 'MPI Distributed Memory Tasks')
plt.legend( handles = [red_patch, green_patch, blue_patch])
plt.plot(runtimes_dict.get('mpi')[0], runtimes_dict.get('mpi')[1], '-bs', runtimes_dict.get('open_mp')[0], runtimes_dict.get('open_mp')[1], '-g^', runtimes_dict.get('serial')[0], runtimes_dict.get('serial')[1], 'r--')
plt.ylabel('wall clock time [ms]')
plt.xlabel('cores')
os.chdir("..")
os.chdir("..")
os.chdir("python")
plt.savefig('runtimes_plot.png')