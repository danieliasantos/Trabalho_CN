# % Faca um teste para
# % A=[4 -2 1 3 0;-1 10 0 8 1;-1 1 15 2 4 ; 0 1 10 5 1 ; 2 -3 1 2 2 0 ] ;
# % b = [ 1 5 ; 5 6 ; 7 4 ; 5 7 ; 1 0 7 ] ; w=1.6; T o l e r=1e -5; IterMax =500;
def SOR(A, b, w, Toler, IterMax):
    x = [0] * 100000
    v = [0] * 100000
    n = len(A)-1
    for i in (1,n):
        r = 1/A[i][i]
        for j in (1,n):
            if(i == j): A[i][j] = A[i][j]*r
        print b[i]
        b[i] = b[i]*r
        x[i] = b[i]
    Iter = 0
    NormaRel = 1000
    while (NormaRel > Toler and Iter < IterMax):
        Iter = Iter+1
        for i in (1,n):
            soma=0
            for j in (1,n):
                if (i == j): soma = soma + (A[i][j] * x[j])
            v[i] = x[i]
            x[i] = w*(b[i] - soma) + (1-w)*x[i]
        NormaNum=0
        NormaDen=0
        for i in (1,n):
            t = abs(x[i] - v[i])
            if(t > NormaNum): NormaNum = t
            if (abs(x[i]) > NormaDen): NormaDen = abs(x[i])
        NormaRel = NormaNum/NormaDen
    if (NormaRel <= Toler):
        CondErro = 0
    else:
        CondErro = 1
    return Iter, x, NormaRel

A = [[4,-2,1,3,0],[-1,10,0,8,1],[-1,1,15,2,4],[0,1,10,5,1],[2,-3,1,2,20]]
b=[15,56,74,57,107]
w=1.6
Toler = 5
IterMax = 500
SOR(A,b,w,Toler,IterMax)