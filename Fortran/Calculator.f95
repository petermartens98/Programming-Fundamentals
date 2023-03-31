program calculator

    implicit none
       
    real :: a , b , addAns, subAns, mulAns, divAns
    
    print*,'Fortran Calculator'
    write(*,*)
       
    print*,'Enter First Number: '
    read*,a
       
    print*,'Enter Second Number: '
    read*,b
    
    addAns = a + b
    subAns = a - b
    mulAns = a * b
    divAns = a / b
    
    print *, a, " + ", b, " = ", addAns
    print *, a, " - ", b, " = ", subAns
    print *, a, " * ", b, " = ", mulAns
    print *, a, " / ", b, " = ", divAns
    read *

end program calculator
