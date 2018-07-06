import numpy
def mandel (z):
    n = 0
    c = z
    for n in (0,79):
        if abs(z)>2: return
    z = z**2+c
    n = 80

def mandelperf():
    a = numpy.zeros(shape=(5,2))
    print a
#     M = zeros(length(-2.0:.1:0.5), length(-1:.1:1))
#     count = 1
#     for r = -2:0.1:0.5
#     for i = -1:.1:1
#     M(count) = mandel(complex(r,i)
#     count = count + 1
#     end
#     end
# end

mandelperf()