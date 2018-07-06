import time

nIteracoes=0
def pisumvec():
    global nIteracoes
    pi = 0
    for j in range(500):
        nIteracoes=nIteracoes+1
        pi=0
        for k in range(1,10001):
            nIteracoes=nIteracoes+1
            pi = pi + (1/round((k*k),25))
    return pi

start = time.time()
pisumvec()
end = time.time()

print 'Tempo:',end - start
print "Iteracoes:", nIteracoes