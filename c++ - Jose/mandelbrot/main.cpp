#include <iostream>
#include <cmath>
#include "matlab.hpp"

using namespace std;

int nIteracoes=0;
int mandel(float z, int maxiter){
    float c = z;
    for(int n = 0; n<maxiter; n++)
    {
        nIteracoes=nIteracoes+1;
        if (abs(z) > 2)
        {
            return n;}
        z = z*z + c;
    }
    return 0;
}

float *mandelperf(float xmin, float xmax, float ymin, float ymax, float largura, float altura, int maxIter){
    mxArray r1;
    r1 = linspace(xmin, xmax);
    r2 = numpy.linspace(ymin, ymax, altura)
    M = numpy.empty((largura,altura))

    for i in range(largura):
        nIteracoes=nIteracoes+1
        for j in range(altura):
            nIteracoes=nIteracoes+1
            M[i,j] = mandel(r1[i] + 1j*r2[j], maxIter)
    return M;
}

int main()
{
    cout << "Hello world!" << endl;
    return 0;
}




import numpy
import time

nIteracoes=0
def mandel(z,maxiter):
    global nIteracoes
    c = z
    for n in range(maxiter):
        nIteracoes=nIteracoes+1
        if abs(z) > 2:
            return n
        z = z*z + c
    return 0

def mandelperf(xmin, xmax, ymin, ymax, largura, altura, maxIter):
    global nIteracoes
    r1 = numpy.linspace(xmin, xmax, largura)
    r2 = numpy.linspace(ymin, ymax, altura)
    M = numpy.empty((largura,altura))

    for i in range(largura):
        nIteracoes=nIteracoes+1
        for j in range(altura):
            nIteracoes=nIteracoes+1
            M[i,j] = mandel(r1[i] + 1j*r2[j], maxIter)
    return (M)

start = time.time()
mandelperf(-2, 0.5, -1, 1, 26, 21, 80)
end = time.time()

print 'Tempo:',end - start
print "Iteracoes:", nIteracoes
