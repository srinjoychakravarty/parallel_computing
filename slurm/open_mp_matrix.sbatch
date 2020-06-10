#!/bin/bash

#SBATCH --job-name=open_mp_matrix
#SBATCH --output=/home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/slurm/outputs/result_open_mp_matrix.out
#SBATCH --error=/home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/slurm/errors/fault_open_mp_matrix.err
#SBATCH --partition express
#SBATCH --nodes=1
#SBATCH --time=0:05:00

cd /home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/matrix
gcc -o matrix_open_mp -fopenmp matrix_multiplication_omp.c
export OMP_NUM_THREADS=1
./matrix_open_mp
export OMP_NUM_THREADS=2
./matrix_open_mp
export OMP_NUM_THREADS=4
./matrix_open_mp
export OMP_NUM_THREADS=8
./matrix_open_mp
export OMP_NUM_THREADS=12
./matrix_open_mp

