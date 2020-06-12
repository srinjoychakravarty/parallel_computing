#!/bin/bash

cd ../slurm

echo Switching to Conda Virtual Environment
source activate conda_env

sbatch mpi_matrix.sbatch
echo Submitted MPI matrix calculation...

sbatch open_mp_matrix.sbatch
echo Submitted Open MP matrix calculation...

sbatch serial_matrix.sbatch
echo Submitted Serial matrix calculation...

sbatch scatter.sbatch
echo Submitted MPI scatter code...

sbatch hello_mpi.sbatch
echo Submitted MPI hello world code...

sbatch hello_open_mp.sbatch
echo Submitted OpenMP hello world code...

echo Delaying sending Python script to Discover cluster by 9 seconds...
sleep 9

sbatch python3.sbatch
echo Scheduled Python3 Runtime Plot to run in 22 seconds...

while true
do
	squeue -u $USER
	echo "Press [CTRL+C] to stop.."
	sleep 0.5
done
