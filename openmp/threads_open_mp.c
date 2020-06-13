#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main(int argument_count, char *argument_values[])
{
    printf("Initializing variables...\n");
    /*Initialize variables*/
    int num_threads, thread_identifier, process_count,
    max_threads, is_parallel, dynamic_threads_enabled,
    nested_parallelism_enabled;

    printf("Starting parallel region...\n");
    /*Start parallel region*/
    #pragma omp parallel private(num_threads, thread_identifier)
    {
        printf("Obtaining thread count...\n");
        /*Obtain thread count*/
        thread_identifier = omp_get_thread_num();

        printf("Entering master thread...\n");
        /*Enter master thread i.e. thread 0*/
        if (thread_identifier == 0)
        {
            printf("Thread %d retrieving environment variables...\n",
            thread_identifier);

            printf("Delineating environment variables...\n");
            /*Delineating environment variables*/

            num_threads = omp_get_num_threads();
            process_count = omp_get_num_procs();
            max_threads = omp_get_max_threads();
            is_parallel = omp_in_parallel();
            dynamic_threads_enabled = omp_get_dynamic();
            nested_parallelism_enabled = omp_get_nested();

            printf("Printing environment variables...\n");
            /*Printing environment variables*/

            printf("Thread count: %d\n", num_threads);
            printf("Processor count: %d\n", process_count);
            printf("Maximum threads available: %d\n", max_threads);
            printf("Is parallel?[0=>no|1=>yes] : %d\n", is_parallel);
            printf("Is dynamic?[0=>no|1=>yes] : %d\n", dynamic_threads_enabled);
            printf("Is nested parallelism?[0=>no|1=>yes] : %d\n", nested_parallelism_enabled);
        }
        printf("Master thread ended.\n");
        /*End of master thread*/
    }
    printf("Parallel region ended.\n");
    /*End of parallel region*/
    return 0;
}

