#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

int main (int argc, char *argv[])
{
  int nthreads, maxthreads, tid;
  // max number of thread that passes
  omp_set_num_threads(11);
  // specify the code between the curly brackets is part of an OpenMP parallel section.
  #pragma omp parallel private(nthreads, tid)
  {
    /* Obtain thread number */
    tid = omp_get_thread_num();
    printf("Hello World from thread = %d\n", tid);
    /* Only mastr thread does this */
    if (tid == 0)
    {
      // printf() displays the string inside quotation
      printf("\nA sample C program\n");
      nthreads = omp_get_num_threads();
      maxthreads = omp_get_max_threads();
      printf("Number of threads = %d\n", nthreads);
      printf("Max threads = %d\n", maxthreads);
    }
  }
  /* All threads join master thread and disband */
}
