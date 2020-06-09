#!/bin/bash

#SBATCH --job-name=serial_matrix
#SBATCH --output=/home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/slurm/outputs/result_serial_matrix.out
#SBATCH --error=/home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/slurm/errors/fault_serial_matrix.err
#SBATCH --partition express
#SBATCH --nodes=1
#SBATCH --time=0:05:00

cd /home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/matrix
srun --pty /bin/bash
gcc -o matrix_serial matrix_multiplication_serial.c
./matrix_serial
