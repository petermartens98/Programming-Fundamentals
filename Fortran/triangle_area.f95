program triangle_area
    implicit none
    real :: base, height, area
    print*,'Triangle Area Calculator'
    write(*,*)
    print*,'Enter Base: '
    read*,base
    print*,'Enter Height: '
    read*,height 
    area = (base * height) / 2
    print*,"Triangle Area: ",area
end program triangle_area
