#include <stdio.h>

int main() {
    int fahr;
    printf("   F      C\n");
    for (fahr = 0; fahr <= 300; fahr = fahr+20) {
        printf("%4d %6.1f\n", fahr, (5.0/9.0)*(fahr-32));
    }
}
