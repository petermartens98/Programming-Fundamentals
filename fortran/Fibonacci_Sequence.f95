program fib_seq

    implicit none
    integer :: n, i, j, k, kold
    
    print*,'Input Fibonacci Length: '
    read*,n
    write(*,*)
    
    j=1 
    k=0
    do i = 1, n
        kold = k 
        k=k+j 
        write(*,*)k
        j=kold
    end do
    
end program fib_seq
