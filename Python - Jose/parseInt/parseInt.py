from random import randint
import time

nIteracoes = 0
def Assert(bool):
    global nIteracoes
    nIteracoes = nIteracoes+1
    if (bool == False):
        return False
    else:
        return True

def parseintperf(t):
    for i in range(1,t):
        global nIteracoes
        nIteracoes = nIteracoes+1
        n = randint(0, 2**32-1)
        s = hex(n)[2:]
        m = int(s,16)
        Assert(m == n)

start = time.time()
parseintperf(1000);
end = time.time()

print 'Tempo:',end - start
print "Iteracoes:", nIteracoes
