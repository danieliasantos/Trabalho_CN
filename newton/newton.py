import time

def f(x):
    f=x**4+2*x**3-13*x**2-14*x+24
    return f


def df(x):
    df = 4*x**3+6*x**2-26*x-14
    return df

def Newton(x0, Toler, IterMax):
    Fx = f(x0)
    DFx = df(x0)
    x = x0
    Iter = 0
    DeltaX = 1000
    DF = 0
    while ((abs(DeltaX) > Toler or abs(Fx) > Toler) and (DF == 0) and (Iter<IterMax)):
        DeltaX = -Fx/DFx
        x = x + DeltaX
        Fx = f(x)
        DFx = df(x)
        Iter = Iter+1
    Raiz=x
    if(abs(DeltaX) <= Toler and abs(Fx) <= Toler):
        CondErro = 0
    else:
        CondErro = 1
    return Raiz, Iter, CondErro

start = time.time()
Raiz, Iter, CondErro = Newton(4,0.00001,100)
end = time.time()

print 'Tempo:',end - start
print "Iteracoes:", Iter