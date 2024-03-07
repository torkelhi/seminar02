/* Generert av GPT UiO med prompt "lag et program som overfyller stack"*/
#include <stdio.h>

void overflow(int num) {
    int arr[100];
    printf("%d\n", num);
    overflow(num + 1);
}

int main(void) {
    overflow(0);
    return 0;
}