// Performs a scatter operation on the rows of an array

#include "mpi.h"
#include <stdio.h>
#include <stdlib.h>
#define SIZE 4

int main(int argument_count, char *argument_values[])
{
    // initialize variables to return mpi metrics
    int num_of_tasks, current_rank, send_count, received_count, src;

    // initialize 4x4 matrix to send source computation
    float send_buffer[SIZE][SIZE] =
    {
        {0.5, 4.1, 1.5, 3.4},
        {2.5, 5.9, 6.5, 7.0},
        {8.2, 11.0, 9.8, 12.7},
        {16.6, 13.3, 17.0, 0.2}
    };

    // initialize variable to receive return computation
    float received_buffer[SIZE];

    // initialize openMPI
    MPI_Init(&argument_count, &argument_values);

    // retrieve task rank
    MPI_Comm_rank(MPI_COMM_WORLD, &current_rank);

    // retrieve number of tasks
    MPI_Comm_size(MPI_COMM_WORLD, &num_of_tasks);

    if (num_of_tasks == SIZE)
    {
        // defines source task and elements to send and receive, then performs collective scatter
        src = 1;

        // send and received counts should match
        send_count = SIZE;
        received_count = SIZE;

        // scatter computation on floats into disparate tasks using the predefined communicator MPI_COMM_WORLD
        MPI_Scatter(send_buffer, send_count, MPI_FLOAT, received_buffer, received_count, MPI_FLOAT, src, MPI_COMM_WORLD);

        // prints out the buffer received by each sub task
        printf("subtask rank: %d\n result buffers: %f\n %f\n %f\n %f\n", current_rank, received_buffer[0], received_buffer[1], received_buffer[2], received_buffer[3]);
    }

    else
    {
        // error message if mismatch between number of tasks, processors and matrix dimensions
        printf("user must specify %d processors! Terminating...\n", SIZE);
    }

    // safety call to ensure original thread that triggered parallelism is re-entered before program exit
    MPI_Finalize();
}
