#include <stdio.h>
#include <stdlib.h>
#include <time.h>

double pi(int* ninteracoes){

    int j, k;
    double sum=0.0;

    for (j=1;j<=500;j++){
        sum=0.0;
        *ninteracoes+=1;
        for(k=1;k<=10000;k++){
            sum=sum+1.0/(k*k);
            *ninteracoes+=1;
        }
    }
    return sum;
}

int main()
{
    clock_t start;
    double duration;
    int ninteracoes=0;

    start = clock();
    printf("O valor de pi e: %f\n", pi(&ninteracoes));
    duration = ( clock() - start ) / (double) CLOCKS_PER_SEC;

    printf("O tempo gasto foi: %f", duration);
    printf("\nO numero de iteracoes foram: %d", ninteracoes);

    return 0;
}
