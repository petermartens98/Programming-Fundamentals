program main 
    implicit none
    real :: spr
    CALL funcspvol(spr)
end program

! Sphere Volume subroutine
subroutine funcspvol(spr)
    implicit none
    real :: spr, spvol, PI
    PI=4.D0*DATAN(1.D0)
    print*,"Enter Sphere Radius: "
    read*,spr
    spvol = (4.0/3.0)*(PI*(spr*spr*spr))
    print*,"Sphere Volume: ", spvol
end subroutine
