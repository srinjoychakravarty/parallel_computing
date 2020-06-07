#!/bin/bash

sbatch scatter.sbatch
sbatch hello_mpi.sbatch

while true
do
	squeue -u $USER
	echo "Press [CTRL+C] to stop.."
	sleep 1
done
