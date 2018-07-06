import numpy

def mandel(z,maxiter):
    c = z
    for n in range(maxiter):
        if abs(z) > 2:
            return n
        z = z*z + c
    return 0

def mandelperf(xmin, xmax, ymin, ymax, largura, altura, maxIter):
    r1 = numpy.linspace(xmin, xmax, largura)
    r2 = numpy.linspace(ymin, ymax, altura)
    M = numpy.empty((largura,altura))

    for i in range(largura):
        for j in range(altura):
            M[i,j] = mandel(r1[i] + 1j*r2[j], maxIter)
    return (M)

print mandelperf(-2, 0.5, -1, 1, 26, 21, 80)