#include  <stdio.h>
#include  <iostream>
#include  <cmath>
#include  <ctime>

using namespace std;

float Iter=0;

float f(float x)
{
    float f = pow(x,4)+2*pow(x,3)-13*pow(x,2)-14*x+24;
    return f;
}


float df(float x)
{
    float df = 4*pow(x,3)+6*pow(x,2)-26*x-14;
    return df;
}

float Newton(float x0, float Toler, int IterMax)
{
    float Fx = f(x0);
    float DFx = df(x0);
    float x = x0;
    int DeltaX = 1000;
    int DF = 0;
    while ((abs(DeltaX) > Toler or abs(Fx) > Toler) and (DF == 0) and (Iter<IterMax))
    {
        DeltaX = -Fx/DFx;
        x = x + DeltaX;
        Fx = f(x);
        DFx = df(x);
        Iter = Iter+1;
    }
    float Raiz=x;
    if(abs(DeltaX) <= Toler and abs(Fx) <= Toler)
        bool CondErro = 0;
    else
        bool CondErro = 1;
    return Raiz;
}

int main(){
    clock_t start;
    double duration;

    start = clock();
    cout << Newton(4,0.00001,100);

    duration = ( clock() - start ) / (double) CLOCKS_PER_SEC;

    cout<<"Tempo: "<< duration <<endl;
    cout<<"Iterações: "<< Iter <<endl;
}
