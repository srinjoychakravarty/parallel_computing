/* required MPI include file */
#include "mpi.h"
#include <stdio.h>
#include <stdlib.h>
#define MASTER 0

int main(int argument_count, char *argument_values[])
{
    // init integer variables
    int number_of_tasks, task_identifier, length;

    // call mpi function to discover hostname
    char host_name[MESSAGE_PASSING_INTERFACE_PROCESSOR_NAME];

    // init MPI
    MPI_Init(&argument_count, &argument_values);

    // retrieve number of tasks
    MPI_Comm_size(MPI_COMM_WORLD, &number_of_tasks);

    // retrieve task rank
    MPI_Comm_rank(MPI_COMM_WORLD, &task_identifier);

    // retrieve processor name
    MPI_Get_processor_name(host_name, &length);

    // prints integer task identifier and string source host
    printf("Hey, this is task %d from %s\n", task_identifier, host_name);

    // prints out the total number of subtasks when master thread detected
    if(task_identifier == MASTER)
    {
        printf("Master thread says the number of subthreads totalled: %d\n", number_of_tasks);
    }

    // safety call to ensure original thread that triggered parallelism is re-entered before program exit
    MPI_Finalize();

}
