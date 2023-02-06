/* Complete the C version of the driver program for compare. This C code does
 * not need to compile. */

#include <stdio.h>

extern long compare(long, long);

int main(int argc, char *argv[]) {
  if(argc != 2) {
    printf("Two arguments required\n.");
    return 1;
  }
  
  int i = atol(argv[0]);
  int j = atol(argv[1]);

  if(i < j) {
    printf("less");
  } else if (i > j) {
    printf("greater");
  } else {
    printf("equal");
  }
  return 0;
}

