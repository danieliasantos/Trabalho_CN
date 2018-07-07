#include <iostream>

using namespace std;

int nIteracoes=0;
float fibRecursivo(int i)
{
    if(i<2)
    {
        nIteracoes+=1;
        return 1;
    }
    else
    {
        nIteracoes+=1;
        return fibRecursivo(i-1)+fibRecursivo(i-2);
    }
}

int main()
{
    int n=30;

    clock_t start;
    double duration;

    start = clock();
    for(int i=1;i<=n;i++)
    {
        fibRecursivo(i);
    }

    duration = ( clock() - start ) / (double) CLOCKS_PER_SEC;

    cout<<"Tempo: "<< duration <<endl;
    cout<<"Iterações: "<< nIteracoes <<endl;
    return 0;
}
