#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <malloc.h>

int nIteracoes=0;

void troca (float* vet, int i, int j);
int particao (float* vet, int e, int d);
void quickSort (float* vet, int e, int d);
int main()
{
    int n=5000, e=0, d=n-1, i;
    float* vet = calloc(n, sizeof(float));
    quickSort(vet,e,d);

    srand(time(NULL));
    for( i=0; i<n; i++)
    {
        vet[i] = ((double) rand() / (RAND_MAX));
    }

    clock_t start;
    double duration;

    start = clock();
    quickSort(vet,e,d);
    duration = ( clock() - start ) / (double) CLOCKS_PER_SEC;

    printf("\nO tempo gasto foi: %f s", duration);
    printf("\nO numero de iteracoes foram: %d \n", nIteracoes);

    free(vet);

    return 0;
}

void quickSort (float* vet, int e, int d)
{
    if(d<=e)
        return;
    int p= particao(vet,e,d);
    quickSort(vet,e,p-1);
    quickSort(vet,p+1,d);
}

int particao (float* vet, int e, int d)
{
    int i=e;
    int j=d;
    int pivo=vet[(d+e)/2];

    while(1)
    {
        nIteracoes+=1;
        while(vet[i]<pivo)
        {
            nIteracoes+=1;
            i++;
        }
        while(pivo<vet[j])
        {
            nIteracoes+=1;
            j--;
        }
        if(i>=j)
            break;
        troca(vet,i,j);
        i++;
        j--;
    }
    return i;
}

void troca (float* vet, int i, int j)
{
    int aux;
    aux=vet[i];
    vet[i]=vet[j];
    vet[j]=aux;

}
