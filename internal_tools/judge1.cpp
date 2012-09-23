#include <fstream>
#include <cstdio>
#include <stdlib.h>
using namespace std;

FILE *ifp1, *ifp2, *ofp;
int maxA, maxE;

float E[1000000];
float A[1000000];


int score1() {

  double best = 2000000;

  for (int shift = -2000; shift < 2000; shift++) {
    int k = 1;
  }


}



int abs(double k) {
  return k > 0 ? k : -k;
}

int main (int argc, char *argv[]) {
  int id1 = atoi(argv[1]); //expected
  int id2 = atoi(argv[2]); //actual
  char buffer[200];

  sprintf(buffer, "../output_data/%d-expected-notes", id1);
  ifp1 = fopen(buffer, "r");

  sprintf(buffer, "../output_data/%d-actual-notes", id2);
  ifp2 = fopen(buffer, "r");

  sprintf(buffer, "../output_data/%d-%d", id1, id2);
  ofp = fopen(buffer , "w");

  
  int cnt = 0;
  float n;
  while (fscanf(ifp1, "%f", &n)) {
    E[cnt++] = n;
  }
  maxE = cnt;

  cnt = 0;
  while(fscanf(ifp2, "%f", &n)) {
    A[cnt++] = n;
  }
  maxA = cnt;

  fprintf(ofp, "%f", 1.0);


}
