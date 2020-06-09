/******************************************************************************
* FILE: mm_ser.c
* DESCRIPTION:
*   Serial Matrix Multiply - C Version
******************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#define NRA 500 	        /* number of rows in matrix A */
#define NCA 500			/* number of columns in matrix A */
#define NCB 300   		/* number of columns in matrix B */

int main(int argc, char *argv[])
{
long start, end;
struct timeval timecheck;
gettimeofday(&timecheck, NULL);
start = (long)timecheck.tv_sec * 1000 + (long)timecheck.tv_usec / 1000;
int    i, j, k;			/* misc */
double a[NRA][NCA], 		/* matrix A to be multiplied */
       b[NCA][NCB],      	/* matrix B to be multiplied */
       c[NRA][NCB];		/* result matrix C */

printf("Starting serial matrix multiple example...\n");
printf("Using matrix sizes a[%d][%d], b[%d][%d], c[%d][%d]\n", NRA,NCA,NCA,NCB,NRA,NCB);

/* Initialize A, B, and C matrices */
printf("Initializing matrices...\n");
for (i=0; i<NRA; i++)
   for (j=0; j<NCA; j++)
      a[i][j]= i+j;
for (i=0; i<NCA; i++)
   for (j=0; j<NCB; j++)
      b[i][j]= i*j;
for(i=0;i<NRA;i++)
   for(j=0;j<NCB;j++)
      c[i][j] = 0.0;

/* Perform matrix multiply */
printf("Performing matrix multiply...\n");
for(i=0;i<NRA;i++)
   for(j=0;j<NCB;j++)
      for(k=0;k<NCA;k++)
         c[i][j]+= a[i][k] * b[k][j];

// printf("Here is the result matrix:");
// for (i=0; i<NRA; i++) {
   // printf("\n");
   // for (j=0; j<NCB; j++)
      // printf("%6.2f   ", c[i][j]);
   // }
printf ("\nDone.\n");
gettimeofday(&timecheck, NULL);
end = (long)timecheck.tv_sec * 1000 + (long)timecheck.tv_usec / 1000;
printf("%ld milliseconds elapsed\n", (end - start));
}
