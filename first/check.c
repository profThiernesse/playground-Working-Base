#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    
    freopen(argv[2],"r",stdin);
    freopen(argv[3],"w",stdout);
    
    system(argv[1]);
    
    return 0;
}
