#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    
    freopen("input.txt","r",stdin);
    freopen("output.txt","w",stdout);
    
    system(argv[1]);
    
    return 0;
}
