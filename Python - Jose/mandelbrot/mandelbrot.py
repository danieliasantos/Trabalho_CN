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