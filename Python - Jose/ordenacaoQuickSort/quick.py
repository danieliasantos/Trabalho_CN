from random import randint
import time

nIteracoes = 0
def sort(array):
    global nIteracoes
    less = []
    equal = []
    greater = []

    if len(array) > 1:
        pivot = array[0]
        for x in array:
            nIteracoes = nIteracoes+1
            if x < pivot:
                less.append(x)
            if x == pivot:
                equal.append(x)
            if x > pivot:
                greater.append(x)
        return sort(less)+equal+sort(greater)
    else: 
        nIteracoes = nIteracoes+1
        return array

n = 5000
array = []
# Popula o vetor com numeros entre 0 e 1
for i in range(0, n):
    array.append(randint(0,1))

start = time.time()
array = sort(array)
end = time.time()

print 'Tempo:',end - start
print "Iteracoes:", nIteracoes
