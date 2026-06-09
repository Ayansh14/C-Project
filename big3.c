#include <stdio.h>

void biggest3() {
    int a, b, c;
    printf("Enter three numbers: ");
    scanf("%d %d %d", &a, &b, &c);

    if (a >= b && a >= c)
        printf("Biggest is %d\n", a);
    else if (b >= a && b >= c)
        printf("Biggest is %d\n", b);
    else
        printf("Biggest is %d\n", c);
}

