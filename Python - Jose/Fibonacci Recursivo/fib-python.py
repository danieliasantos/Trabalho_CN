import time

nIteracoes=0
def fibRecursivo(i):
    global nIteracoes
    nIteracoes=nIteracoes+1
    if(i<2):
        return 1;
    else:
        return fibRecursivo(i-1)+fibRecursivo(i-2);

num = input("Digite de termos da sequencia que deseja: ")

start = time.time()
for i in range(1,num):
    fibRecursivo(i)
end = time.time()

print 'Tempo:',end - start
print "Iteracoes:", nIteracoes