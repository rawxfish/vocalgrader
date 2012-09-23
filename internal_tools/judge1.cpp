#include <fstream>
#include <cstdio>
#include <stdlib.h>
#include <algorithm>
#include <iostream>
using namespace std;

FILE *ifp1, *ifp2, *ofp;
int maxA, maxE;

float E[1000000];
float A[1000000];

int min1(int a, int b) {
  return a < b ? a : b;
}

double min2(double a, double b) {
  return a < b ? a : b;
}

float abs(float a) {
  return a > 0 ? a : -a;
}


// laoma
double score1() {
  return 10.0;
}

// mean
double score2() {

  double best = 2000000;
  int maxShift = min1(2000, min(maxA, maxE)/5 - 1);

  for (int shift = 0; shift < maxShift; shift++) {
    double s1 = 0;
    double s2 = 0;
    for (int i = 0; i < min(maxA, maxE) - shift; i++) {
      s1 += abs(E[i + shift] - A[i]);
      s2 += abs(E[i] - A[i + shift]);
    }
    double s = min(s1, s2);
    if (best > s/(min(maxA, maxE) - shift))
      best = s/(min(maxA, maxE) - shift);
  }

  return best;
}

// median
double score3() {
  double best = 2000000;
  int maxShift = min1(2000, min(maxA, maxE)/5 - 1);
  double res1[min1(maxA, maxE) + 1];
  double res2[min1(maxA, maxE) + 1];
  int cnt;

  for (int shift = 0; shift < maxShift; shift++) {
    cnt = 0;
    for (int i = 0; i < min(maxA, maxE) - shift; i++) {
      res1[cnt] = abs(E[i + shift] - A[i]);
      res2[cnt] = abs(E[i] - A[i + shift]);
      cnt++;
    }
    sort(res1, res1 + cnt);
    sort(res2, res2 + cnt);

    double s = min2(res1[cnt/2], res2[cnt/2]);

    if (best > s)
      best = s;
  }

  return best;
}


int main (int argc, char *argv[]) {
  int id1 = atoi(argv[1]); //expected
  int id2 = atoi(argv[2]); //actual
  char buffer[200];

  sprintf(buffer, "./trial_data/%d-expected-notes", id1);
  ifp1 = fopen(buffer, "r");

  sprintf(buffer, "./trial_data/%d-actual-notes", id2);
  ifp2 = fopen(buffer, "r");

  sprintf(buffer, "./output_data/%d-%d", id1, id2);
  ofp = fopen(buffer , "w");

  float n;
  int cnt = 0;
  while (fscanf(ifp1, "%f", &n) != EOF) {
    E[cnt++] = n;
  }
  maxE = cnt;
  fclose(ifp1);

  cnt = 0;
  while(fscanf(ifp2, "%f", &n) != EOF) {
    A[cnt++] = n;
  }
  maxA = cnt;
  fclose(ifp2);

  fprintf(ofp, "%f\n", score1());
  fprintf(ofp, "%f\n", score2());
  fprintf(ofp, "%f\n", score3());
  fclose(ofp);
}
