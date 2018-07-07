#include <iostream>
#include <ctime>

using namespace std;

int nIteracoes=0;

void troca (int* vet, int i, int j);
int particao (int* vet, int e, int d);
void quickSort (int* vet, int e, int d);
int main()
{
    int n=5000, e=0, d=n-1;
    int* vet = new int[n];
    quickSort(vet,e,d);

    for(int i=0; i<n; i++)
    {
        vet[i] = n-i;
    }

    clock_t start;
    double duration;

    start = clock();
    quickSort(vet,e,d);
    duration = ( clock() - start ) / (double) CLOCKS_PER_SEC;

    cout<<"Tempo: "<< duration <<'\n';
    cout<<"Iterações: "<< nIteracoes <<'\n';
    return 0;
}

void quickSort (int* vet, int e, int d)
{
    if(d<=e)
        return;
    int p= particao(vet,e,d);
    quickSort(vet,e,p-1);
    quickSort(vet,p+1,d);
}

int particao (int* vet, int e, int d)
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

void troca (int* vet, int i, int j)
{
    int aux;
    aux=vet[i];
    vet[i]=vet[j];
    vet[j]=aux;

}
