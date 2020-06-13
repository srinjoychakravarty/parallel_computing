#!/bin/bash

#SBATCH --job-name=loop_open_mp
#SBATCH --output=/home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/slurm/outputs/loop_open_mp_result.out
#SBATCH --error=/home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/slurm/errors/loop_open_mp_fault.err
#SBATCH --partition express
#SBATCH --nodes=1
#SBATCH --time=0:05:00

cd /home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/openmp/
gcc -o loop_open_mp -fopenmp loop_open_mp.c
./loop_open_mp

