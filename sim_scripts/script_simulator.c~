#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main (int argc, char *argv[])
{
  FILE * pFile;
  pFile = fopen ("period_sweep.sp", "wb");
  char input[3] = "ab";
  int c0 = 0;
  char Vcc[4]= "Vcc"; // Virtual Vdd
  char Vss[4]= "Vss"; // Virtual Ground
  char * V[2] = {Vss , Vcc};
  double pulse, period, test_period, end, res;

  if (argc >1 && argc != 3) {
    printf("Error: Usage: script_simulator period c0\n");
    exit(1);
  }
  else if (argc == 3) {
    c0 = atoi(argv[2]);
    if (c0 != 0 && c0!= 1){
       printf("Error: c0 must be either 0 or 1\n");
       exit(1);
    }
    period = atof(argv[1]);
    if (period <= 0) {
      printf("Error: period must be postive\n");
      exit(1);
    }
  }
  else {
    pulse = 128.0;
    period = pulse/2.0;
  }
  res = period /1000.0;	// Resolution is 1000th of the period
  end = 2* period; 	// The simulation is 100 cycles

  // Set the simulation parameters for resolution and end
  fprintf(pFile,".TRAN %E %E START=0.0\n\n",res,end);

  fprintf(pFile,".meas tran Iavg AVG I(vVcc) FROM=0 TO=%E\n"
		".meas tran Vavg AVG V(Vcc) FROM=0 TO=%E\n"
		".meas tran Etot PARAM='Iavg*Vavg*%E'\n\n", end,end,end);
  // Set Vcc and Vss
  fprintf(pFile,"vvground vground 0 DC=Vss\nvvsupply vsupply 0 DC=Vcc\n" );
  // Set the carry in, c0
  fprintf(pFile,"vc0 c0 0 DC=%s\n",V[c0]); 
  for(int ind = 0; ind < 8; ++ind) {
    test_period = period/(1<<ind);
    pulse = test_period/2;
    // Create signal for b
    fprintf(pFile,"v%c%i %c%i 0 pulse Vcc 0 0 0 0 %E %E\n",
		input[1],ind,input[1],ind,pulse,test_period);
    // Create signal for a
    fprintf(pFile,"v%c%i %c%i 0 DC=%s\n",
		input[0],ind,input[0],ind,V[ind%2]);
  }
  fclose (pFile);
  return 0;
}
