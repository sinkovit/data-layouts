#include <stdio.h>
#include <stdlib.h>

/* This program illustrates how various C structures are laid out in
   memory. Note that a non-optimal ordering of the elements can result
   in a larger memory footprint */

int main(int argc, char **argv) {

  int i;
  long int s;

  typedef struct st1 {
    float f1;
    double d1;
    float f2;
  } st1;

  typedef struct st2 {
    float f1;
    float f2;
    double d1;
  } st2;

  int n=5;
  struct st1 *arr1;
  struct st2 *arr2;
  
  arr1 = (struct st1 *) malloc(sizeof(st1) * n);  
  arr2 = (struct st2 *) malloc(sizeof(st2) * n);

  printf("--- layout for struct (float,double,float) ---\n");
  s = (long int) &arr1[0].f1;
  printf("Starting address: %ld\n", s);
  for (i=0; i<n; i++) {
    printf("%5d: %5ld %5ld %5ld\n", i,
	   (long int) &arr1[i].f1 - s, 
	   (long int) &arr1[i].d1 - s, 
	   (long int) &arr1[i].f2 - s);
  }
  printf("\n");

  printf("--- layout for struct (float,float,double) ---\n");
  s = (long int) &arr2[0].f1;
  printf("Starting address: %ld\n", s);
  for (i=0; i<n; i++) {
    printf("%5d: %5ld %5ld %5ld\n", i,
	   (long int) &arr2[i].f1 - s, 
	   (long int) &arr2[i].f2 - s, 
	   (long int) &arr2[i].d1 - s);
  }


}
