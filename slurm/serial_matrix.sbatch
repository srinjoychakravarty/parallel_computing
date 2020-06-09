#!/bin/bash

#SBATCH --job-name=serial_matrix
#SBATCH --output=serial_matrix_result.out
#SBATCH --error=serial_matrix_fault.err
#SBATCH --partition express
#SBATCH --nodes=1
#SBATCH --time=0:05:00

cd /home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/matrix
srun --pty /bin/bash
gcc -o matrix_serial matrix_multiplication_serial.c
./matrix_serial
