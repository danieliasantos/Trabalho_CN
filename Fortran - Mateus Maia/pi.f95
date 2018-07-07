program pi
  implicit none
  integer ::  j, k
  real :: sum
  sum = 0.0
   do j = 1, 100
    sum= 0.0
     do  k = 1,10000
       sum = sum +( 1.0 / (k*k))
     end do
  end do
write(*,*) sum
end program pi
  