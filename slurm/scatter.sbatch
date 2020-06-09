#!/bin/bash

#SBATCH --job-name=scatter_slurm
#SBATCH --output=/home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/slurm/outputs/scatter_result.out
#SBATCH --error=/home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/slurm/errors/scatter_fault.err
#SBATCH --partition express
#SBATCH --nodes=1
#SBATCH --time=0:05:00

srun --pty /bin/bash
module load openmpi
cd /home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/mpi/scatter
mpicc -o scatter scatter.c
mpirun -np 4 -oversubscribe ./scatter
