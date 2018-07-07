library(caTools)  # external package providing write.gif function jet.colors <- colorRampPalette(c("#00007F", "blue", "#007FFF", "cyan",
#                                                                               "#7FFF7F", "yellow", "#FF7F00", "red",
#                                                                               "#7F0000"))
m <- 1200                
C <- complex( real=rep(seq(-1.8,0.6, length.out=m), each=m ),
             imag=rep(seq(-1.2,1.2, length.out=m), m ) )
C <- matrix(C,m,m)       
Z <- 0                   
X <- array(0, c(m,m,50)) {        
Z <- Z^2+C             
X[,,k] <- exp(-abs(Z)) 
}
write.gif(X, "Mandelbrot.gif", col=jet.colors, delay=100)