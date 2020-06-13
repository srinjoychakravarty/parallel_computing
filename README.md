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
2. Switch to the bash folder and install the prerequisite Anaconda Packages
    ```sh
    $ ./conda_prereq.sh
    ```

3. Run the run_slurms script
    ```sh
    $ ./run_slurms.sh
    ```
    
| Warning! :warning: 
Keep an eye on the batch jobs schedule. The python job should remain in queue and run last! |
| --- |

4. Check your code results in the outputs folder specified below
    ```sh
    $ cd ../slurm/outputs
    $ ll
    ```
    
5. Check for any bugs logged in the errorrs folder specified below
    ```sh
    $ cd ../errors
    $ ll
    ```

License
----

Northeastern University

_Srinjoy Chakravarty_
