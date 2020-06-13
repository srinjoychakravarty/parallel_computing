#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#define Limit 64

int main(int argument_count, char *argument_values[])
{
    printf("Initializing variables...\n");
    int num_threads, thread_id, iterator;
    float alpha[Limit], beta[Limit], camel[Limit];

    printf("Outer loop with Limit set to 64\n");
    for (iterator = 0; iterator < Limit; iterator++)
    {
        alpha[iterator] = beta[iterator] = iterator;
    }

    printf("Initializing open mp parellelization...\n");
    #pragma omp parallel shared(alpha, beta, camel, num_threads) private(iterator, thread_id)
    {
        thread_id = omp_get_thread_num();
        if (thread_id == 0)
        {
            printf("Inside master thread...\n");
            num_threads = omp_get_num_threads();
            printf("Thread Count: %d\n", num_threads);
        }
        printf("Thread %d starting...\n", thread_id);

        #pragma omp for
        for (iterator = 0; iterator < Limit; iterator++)
        {
            camel[iterator] = alpha[iterator] + beta[iterator];
            printf("Thread %d: camel[%d] = %f\n", thread_id, iterator, camel[iterator]);
        }
        printf("Exiting subthreads...");
    }
    printf("End of open mp parallelization...");

    return 0;
}

