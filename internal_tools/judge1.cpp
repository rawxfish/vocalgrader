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

double score[6];
int shift_by;
bool orientation;

int min1(int a, int b) {
  return a < b ? a : b;
}

double min2(double a, double b) {
  return a < b ? a : b;
}

float abs(float a) {
  return a > 0 ? a : -a;
}



// mean
void score1() {

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
    if (best > s/(min(maxA, maxE) - shift)) {
      shift_by = shift;
      orientation = (s1 < s2);
      best = s/(min(maxA, maxE) - shift);
    }
  }

  score[0] = best;
}

// median, 25th percentile, 75th percentil
void score2() {
  double best = 2000000;
  double best1 = 2000000;
  double best2 = 2000000;

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
    double s1 = min2(res1[cnt/4], res2[cnt/4]);
    double s2 = min2(res1[3*cnt/4], res2[3*cnt/4]);

    if (best > s)
      best = s;
    if (best1 > s1)
      best1 = s1;
    if (best2 > s2)
      best2 = s2;
  }

  score[1] = best;
  score[2] = best1;
  score[3] = best2;
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
  
  score1();
  score2();

  double mult = (1.0 * maxE) / (min1(maxA, maxE) - shift_by);
  for (int i = 0; i < 4; i++) {
    fprintf(ofp, "%f\n", score[i] * mult);
  }
  
  for (int i = 0; i < min1(maxA, maxE) - shift_by; i++) {
     if (orientation) {
       fprintf(ofp, "%f %f\n", E[i + shift_by], A[i]);
     } else {
       fprintf(ofp, "%f %f\n", E[i], A[i + shift_by]);
     }
  }
  fclose(ofp);
}
