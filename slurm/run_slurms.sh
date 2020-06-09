#!/bin/bash

# sbatch scatter.sbatch
# sbatch hello_mpi.sbatch
# sbatch serial_matrix.sbatch
# sbatch open_mp_matrix.sbatch
sbatch mpi_matrix.sbatch

while true
do
	squeue -u $USER
	echo "Press [CTRL+C] to stop.."
	sleep 1
done
