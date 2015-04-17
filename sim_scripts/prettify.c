#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main (int argc, char *argv[])
{
  FILE * old;
  FILE * new;
  old = fopen (argv[1], "r");
  new = fopen (argv[2], "wb");
  char * line1 = NULL;
  char * line2 = NULL;
  size_t len = 0;
  
  
  while (getline(&line1, &len, old) != -1) {
    printf("line: %s",line1);
    if(getline(&line1, &len, old) != -1)
      fprintf(new,"%s%s\n", line1,line2);
  }
  
  fclose(new);
  fclose(old);
  if (line1) free(line1);
  if (line2) free(line2);
  return 0;
  
}