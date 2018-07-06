#include <iostream>
#include <cmath>

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
    cout << pisumvec();
    return 0;
}
