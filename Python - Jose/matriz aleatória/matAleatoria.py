import numpy as np

def randmatstat (t):
    n = 5
    # v = zeros(t)
    # w = zeros(t)
    for i in (1,t+1):
        a = np.random.rand(n,n)
        b = np.random.rand(n,n)
        c = np.random.rand(n,n)
        d = np.random.rand(n,n)
        P = np.concatenate(a,b)
        P = np.concatenate(c,d)
        aux1 = []
        aux1.push(a)
        aux1.push(b)
        aux2 = []
        aux2.push(c)
        aux2.push(d)
        Q = np.concatenate(aux1,aux2)
        print P
        print Q
        # v[i] = trace((PP)4)
        # w[i] = trace((QQ)4)
    std(v)/mean(v)
    std(w)/mean(w)

randmatstat(100)