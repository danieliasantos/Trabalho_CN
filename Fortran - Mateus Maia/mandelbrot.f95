program mandelbrot 
implicit none
    
        Integer, parameter :: GRID = 1000, ITER = 90  

        Complex :: c 
        Integer :: i, j 
        real :: xpart, ypart
        Logical :: converges


        DO i=0, GRID
                Do j = 0, GRID 
                        xpart = -2.0 + 4.0*real(i)/real(GRID)
                        ypart = -2.0 + 4.0*real(j)/real(GRID)
                        c = CMPLX(xpart, ypart)
    
                        IF (converges(c, ITER)) THEN
                                print *, c
                        END IF

                END DO  
        END DO
end program mandelbrot


function converges (c, ITER) result (convergence)
implicit none
        Complex, INTENT(IN) :: c
        Integer, INTENT(IN) :: ITER

        Real, parameter :: THRESHOLD = 2.0 
        Integer :: i 
        Complex :: buffer
        Logical :: convergence 
        buffer = (0,0)

        DO i=0, ITER
               buffer = buffer**2 + c 
               IF (ABS(buffer)>THRESHOLD) THEN 
                      convergence = .false.
                      RETURN 
               END IF 
        END DO
        convergence = .true.

end function 
