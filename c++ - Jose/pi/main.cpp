#include <iostream>
#include <cmath>
#include <ctime>

using namespace std;

int nIteracoes=0;
double pisumvec()
{
    double pi = 0;
    for(int j = 0; j<=500; j++)
    {
        nIteracoes=nIteracoes+1;
        pi=0;
        for(int k = 1; k<=10000; k++)
        {
            nIteracoes=nIteracoes+1;
            pi += 1/(pow(k,2));
        }
    }

    return pi;
}

int main()
{
    clock_t start;
    double duration;

    start = clock();
    pisumvec();

    duration = ( clock() - start ) / (double) CLOCKS_PER_SEC;

    cout<<"Tempo: "<< duration <<endl;
    cout<<"Iterações: "<< nIteracoes <<endl;
    return 0;
}
