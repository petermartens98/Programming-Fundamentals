#include <stdio.h>
#include <stdlib.h>

int main (void) {
    int *x = malloc(3 * sizeof(int));
    if (x == NULL){
        return 1;
    }
    x[0] = 72;
    x[1] = 73;
    x[2] = 33;
    free(x);
    return 0;
}