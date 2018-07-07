f <- quote(sin(x)-x^2/16)        # expressão da função, queremos obter a raíz
fx0 <- function(x){ eval(f) }    # função
curve(fx0, -10, 10); abline(h=0) # gráfico da função

f1 <- D(f,"x")                   # expressão da derivada
fx1 <- function(x){ eval(f1) }   # função
par(new=TRUE); curve(fx1, -10, 10, col=2, axes=FALSE) # gráfico