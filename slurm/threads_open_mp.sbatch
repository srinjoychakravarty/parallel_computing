#!/bin/bash

#SBATCH --job-name=threads_open_mp
#SBATCH --output=/home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/slurm/outputs/threads_open_mp_result.out
#SBATCH --error=/home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/slurm/errors/threads_open_mp_fault.err
#SBATCH --partition express
#SBATCH --nodes=1
#SBATCH --time=0:05:00

cd /home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/openmp/
gcc -o threads_open_mp -fopenmp threads_open_mp.c
./threads_open_mp

