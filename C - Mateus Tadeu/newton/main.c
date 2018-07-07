#include  <stdio.h>
#include  <stdlib.h>
#include  <math.h>
#include  <time.h>

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
    while ((abs(DeltaX) > Toler || abs(Fx) > Toler) && (DF == 0) && (Iter<IterMax))
    {
        DeltaX = -Fx/DFx;
        x = x + DeltaX;
        Fx = f(x);
        DFx = df(x);
        Iter = Iter+1;
    }
    float Raiz=x;
    int CondErro;
    if(abs(DeltaX) <= Toler && abs(Fx) <= Toler)
        CondErro = 0;
    else
        CondErro = 1;
    return Raiz;
}

int main(){

    clock_t start;
    double duration;

    start = clock();
    printf("%f", Newton(4,0.00001,100));

    duration = ( clock() - start ) / (double) CLOCKS_PER_SEC;

    printf("\nO tempo gasto foi: %f s", duration);
    printf("\nO numero de iteracoes foram: %d \n", Iter);
}
