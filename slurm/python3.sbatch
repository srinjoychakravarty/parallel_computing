#!/bin/bash

srun --pty /bin/bash
module load python/3.8.1
cd /home/chakravarty.s/csye7374-chakravarty.s/homework1/parallel_computing/python
python3 parallel_plot.py
