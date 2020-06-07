// Performs a scatter operation on the rows of an array

#include <stdio.h>
#include <stdlib.h>
#define SIZE 4

int main(int argument_count, char *argument_values[])
{
    // initialize variables to return mpi metrics
    int number_of_tasks, rank, send_count, received_count, source;

    // initialize 4x4 matrix to send source computation
    float send_buffer[][] =
    {
        {0.5, 4.1, 1.5, 3.4},
        {2.5, 5.9, 6.5, 7.0},
        {8.2, 11.0, 9.8, 12.7},
        {16.6, 13.3, 17.0, 0.2}
    };

    // initialize variable to receive return computation
    float received_buffer[SIZE];

    // initialize openMPI
    MPI_Init();
}
