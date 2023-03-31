program factorial  
    implicit none  
    integer :: nfact = 1   
    integer :: n
    do n = 1, 10     
       nfact = nfact * n 
       print*,  n, " ", nfact   
    end do 
end program factorial  
