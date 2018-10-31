#include <stdio.h>
#include <stdlib.h>

int bissex(int);

int main() {
  int a;
  
  scanf("%d",&a);
  
  printf("%d",bissex(a));
  
  return 0;
}

int bissex(int a) {
    return (a%400==0 || (a%100!=0 && a%4==0));
}
