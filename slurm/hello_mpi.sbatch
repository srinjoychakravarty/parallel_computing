#!/bin/bash

#SBATCH --job-name=hello_mpi_slurm
#SBATCH --output=/home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/slurm/outputs/hello_mpi_result.out
#SBATCH --error=/home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/slurm/errors/hello_mpi_fault.err
#SBATCH --partition express
#SBATCH --nodes=1
#SBATCH --time=0:05:00

module load openmpi
cd /home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/mpi/hello_mpi
mpicc -o hello_mpi hello_mpi.c
mpirun -np 8 -oversubscribe ./hello_mpi
