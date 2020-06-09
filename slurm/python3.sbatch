#!/bin/bash

#SBATCH --job-name=python3_slurm
#SBATCH --output=/home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/slurm/outputs/python3_result.out
#SBATCH --error=/home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/slurm/errors/python3_fault.err
#SBATCH --partition express
#SBATCH --nodes=1
#SBATCH --time=0:05:00
#SBATCH --begin=now+4 

srun --pty /bin/bash
module load python/3.8.1
cd /home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/python
sudo pip3 install pyexcel pyexcel-xlsx
python3 parallel_plot.py
