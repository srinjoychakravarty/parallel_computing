#!/bin/bash
#SBATCH --job-name=hello_mpi_slurm
#SBATCH --output=hello_mpi_result.out
#SBATCH --error=hello_mpi_fault.err
#SBATCH --partition express
#SBATCH --nodes=1
#SBATCH --time=0:05:00
srun --pty /bin/bash
module load openmpi
cd /home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/mpi/hello_mpi
mpicc -o hello_mpi hello_mpi.c
mpirun -np 8 -oversubscribe ./hello_mpi
