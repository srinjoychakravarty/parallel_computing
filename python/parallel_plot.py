import csv, glob, os, xlsxwriter
import matplotlib as mpl
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import pandas as pd
from pandas import DataFrame
from pyexcel.cookbook import merge_all_to_a_book

mpl.use('Agg')
os.chdir("..")
os.chdir("slurm/outputs")
directory = os.getcwd()
matrix_files = []
runtimes_dict = {}

for filename in os.listdir(directory):
	if (filename.endswith('matrix.out')):
		matrix_files.append(filename) 

print("Calculating Matrix Multiplication Runtimes...\n")
for filename in matrix_files:
	if(filename == "result_serial_matrix.out"):
		open_file = open(directory + "/" + filename, 'r')
		lines = open_file.readlines()
		wall_time = lines[5]
		millisecs = wall_time.split()[0]
		x_values = [1, 2, 4, 8, 12]
		y_values = [int(millisecs), int(millisecs), int(millisecs), int(millisecs), int(millisecs)]
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
		wall_time_4 = lines[7]
		millisecs_4 = wall_time_4.split()[0]
		wall_time_5 = lines[9]
		millisecs_5 = wall_time_5.split()[0]
		x_values = [1, 2, 4, 8, 12]
		y_values = [int(millisecs_1), int(millisecs_2), int(millisecs_3), int(millisecs_4), int(millisecs_5)]
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
		wall_time_4 = lines[7]
		millisecs_4 = wall_time_4.split()[0]
		x_values = [2, 4, 8, 12]
		y_values = [int(millisecs_1), int(millisecs_2), int(millisecs_3), int(millisecs_4)]
		runtimes_dict['mpi'] = (x_values, y_values)

print("Plotting Runtimes on Matplotlib Line Chart...\n")
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

print("Pushing Runtimes to a Comma Separated Value (.csv) File...\n")
column_headers = ['Technology','NumCores', 'Runtime']
csv_list = []
for each_key in list(runtimes_dict.keys()):
	rows_per_type = len(runtimes_dict.get(each_key)[0])
	for i in range(rows_per_type):
		temp_dict = {column_headers[0]: each_key, column_headers[1]: runtimes_dict.get(each_key)[0][i], column_headers[2]: runtimes_dict.get(each_key)[1][i]}
		csv_list.append(temp_dict)

currentPath = os.getcwd()
csv_file = currentPath + "/runtimes.csv"

print("Converting CSV File to a Microsoft Excel Spreadsheet...\n")
with open(csv_file, 'w') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames = column_headers)
        writer.writeheader()
        for data in csv_list:
            writer.writerow(data)
merge_all_to_a_book(glob.glob(csv_file), "runtimes.xlsx")

os.remove(csv_file) 

print("Importing Excel Results to Pandas Dataframe for Console Output...\n")
ms_excel_path = ('runtimes.xlsx')
excel_file = pd.ExcelFile(ms_excel_path)
sheet1_name = excel_file.sheet_names
xls_dataframe = excel_file.parse(sheet1_name)
print(xls_dataframe)