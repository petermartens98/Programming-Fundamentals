program printMultiples
    implicit none
    integer :: n, num, nmul, nmax
    print*,"Enter Number: "
    read*,num
    print*,"Enter how many multiples: "
    read*,nmax
    do n= 1, nmax
        nmul=num*n
        print*,nmul
    end do
end program printMultiples
