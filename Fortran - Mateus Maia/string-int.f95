module str2int_mod
contains 

  elemental subroutine str2int(str,int,stat)
    implicit none
    ! Arguments
    character(len=*),intent(in) :: str
    integer,intent(out)         :: int
    integer,intent(out)         :: stat

    read(str,*,iostat=stat)  int
  end subroutine str2int

end module

program test
  use str2int_mod
  character(len=20) :: str(3)
  integer           :: int(3), stat(3)

  str(1) = '123' ! Valido
  str(2) = '-1'    ! Valido
  str(3) = 'one' ! Invalido

  call str2int(str,int,stat)

  do i=1,3
    if ( stat(i) == 0 ) then
      print *,i,int(i)
  end if
 end do
end program