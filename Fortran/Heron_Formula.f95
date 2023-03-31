! Fortran Program that computes the area of a trianle using Herrons Formula
! based on triangle side length
program HeronFormula
    real :: a, b, c  ! three sides
    real :: s ! half the premiter   
    real :: area ! triangle area
    logical :: cond1, cond2
    
    print*,'Enter side A length: '
    read(*,*) a
    print*,'Enter side B length: '
    read(*,*) b
    print*,'Enter side C length: '
    read(*,*) c
    write(*,*)
    
    write(*,*) "A = ",a
    write(*,*) "B = ",b
    write(*,*) "C = ",c
    write(*,*)
    
    cond1 = (a>0.0) .AND. (b > 0.0) .AND. (c > 0.0)
    cond2 = (a + b > c) .AND. (a + c > b) .AND. (b + c > a)
    
    if (cond1 .AND. cond2) then
        s = (a+b+c)/2.
        area = SQRT(s*(s-a)*(s-b)*(s-c))
        write(*,*)"Triangle Area: ",area 
    else
        write(*,*)"ERROR: this is not a triangle"
    end if
    
end program HeronFormula
