program   Fibonacci

!use portlib
	implicit none
	integer :: primeiro, segundo, temp, IX
	!REAL*8 T1, T2, H
   	primeiro = 0
   	segundo = 1
   	write (*,*) primeiro
   	write (*,*) segundo

   	!T1 = TIMEF()

   	do IX = 1, 45, 1
		TEMP = primeiro + segundo
		primeiro = segundo
		segundo = temp
		write (*,*) temp
	end do
	!T2 = TIMEF()
	!H = T2-T1
	!write(*,*) H 

end program Fibonacci
