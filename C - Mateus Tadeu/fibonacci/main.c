#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int fib(int n, int* ninteracoes){

    int f;

    if (n<2){
        f=n;
        *ninteracoes=*ninteracoes+1;
        return f;
    }
    else{
        *ninteracoes=*ninteracoes+1;
        f=fib(n-1, ninteracoes) + fib(n-2, ninteracoes);
    }
}

int main()
{
    int n, x;

    clock_t start;
    double duration;
    int ninteracoes=0;

    start = clock();
    printf("Digite um numero maior ou igual a vinte para calcular o fibonacci\n");
    scanf("%i", &n);
    duration = ( clock() - start ) / (double) CLOCKS_PER_SEC;

    printf("\nO valor sequencial de fibonacci = %i \n", fib(n, &ninteracoes));

    printf("\nO tempo gasto foi: %f s", duration);
    printf("\nO numero de interacoes foram: %d \n", ninteracoes);

    return 0;
}
