#!/bin/bash

#SBATCH --job-name=python3_slurm
#SBATCH --output=/home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/slurm/outputs/python3_result.out
#SBATCH --error=/home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/slurm/errors/python3_fault.err
#SBATCH --partition express
#SBATCH --nodes=1
#SBATCH --time=0:05:00
#SBATCH --begin=now+23

cd /home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/python
python3 parallel_plot.py
