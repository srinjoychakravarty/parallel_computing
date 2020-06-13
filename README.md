# Parallel Computing using Shared GPUs 

[![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://nodesource.com/products/nsolid)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

OpenMP, MPI and SLURM on Northeastern's Discovery Cluster

### IDE 

C Code built and run using the Code Blocks IDE

### Prerequisites and Running on Discovery Cluster

1. Please switch to a Compute node 
    ```sh
    $ srun --pty /bin/bash
    ```

2. load the anaconda module on your profile type the following:
    ```sh
    $ module load anaconda3/3.7
    ```
3. To create your environment, type the following:
    ```sh
    $ conda create -n conda_env python=3.7 anaconda
    ```
Here _conda_env_ is the name you choose to give your environment. 

**Tip:** to see a list of all of your conda environments, type conda info -e.

4. Switch to the bash folder and install the prerequisite Anaconda Packages
    ```sh
    $ ./conda_prereq.sh
    ```

5. Run the run_slurms script
    ```sh
    $ ./run_slurms.sh
    ```
    
| Warning! :warning: Keep an eye on the batch jobs schedule. The python job should remain in queue and run last! |
| --- |

6. Check your code results in the outputs folder specified below
    ```sh
    $ cd ../slurm/outputs
    $ ll
    ```
    
7. Check for any bugs logged in the errorrs folder specified below
    ```sh
    $ cd ../errors
    $ ll
    ```

License
----

Northeastern University

_Srinjoy Chakravarty_
