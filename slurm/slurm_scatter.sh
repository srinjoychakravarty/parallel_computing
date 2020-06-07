#!/bin/bash
#SBATCH --job-name=scatter_slurm_srinjoy
#SBATCH --output=scatter_result_slurm_srinjoy.out
#SBATCH --error=scatter_error_slurm_srinjoy.err
#SBATCH --partition express
#SBATCH --nodes=1
#SBATCH --time=0:05:00
srun --pty /bin/bash
module load openmpi
cd /home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/mpi/scatter
mpicc -o scatter scatter.c
mpirun -np 4 -oversubscribe ./scatter
