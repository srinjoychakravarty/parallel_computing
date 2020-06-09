#!/bin/bash

#SBATCH --job-name=mpi_matrix
#SBATCH --output=mpi_matrix_result.out
#SBATCH --error=mpi_matrix_fault.err
#SBATCH --partition express
#SBATCH --nodes=1
#SBATCH --time=0:05:00

cd /home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/matrix
srun --pty /bin/bash
module load openmpi
mpicc -o matrix_mpi matrix_multiplication_mpi.c
mpirun --mca btl_base_warn_component_unused 0 -np 2 -oversubscribe matrix_mpi
mpirun --mca btl_base_warn_component_unused 0 -np 4 -oversubscribe matrix_mpi
mpirun --mca btl_base_warn_component_unused 0 -np 8 -oversubscribe matrix_mpi
