program main 
    implicit none
    real :: choice, spr, cylh, cylr, cubel, rpl, rpw, rph, coner, coneh
    print*,"Enter # for desired volume: "
    print*,"1 for Sphere"
    print*,"2 for Cylinder"
    print*,"3 for Cube"
    print*,"4 for Rectangular Prism"
    print*,"5 for Cone"
    read*, choice
    IF (choice == 1) THEN
        CALL subspvol(spr)
    ELSE IF (choice == 2) THEN
        CALL subcylvol(cylh,cylr)
    ELSE IF (choice == 3) THEN
        CALL subcubevol(cubel)
    ELSE IF (choice == 4) THEN
        CALL subrecprismvol(rpl,rpw,rph)
    ELSE IF (choice == 5) THEN
        CALL subconevol(coner,coneh)
    END IF
end program

subroutine subspvol(spr)
    implicit none
    real :: spr, spvol, PI
    PI=4.D0*DATAN(1.D0)
    print*,"Enter Sphere Radius: "
    read*,spr
    spvol = (4.000/3.000)*(PI*(spr*spr*spr))
    print*,"Sphere Volume: ",spvol
end subroutine

subroutine subcylvol(cylh,cylr)
    implicit none
    real :: cylh, cylr, cylvol, PI
    PI=4.D0*DATAN(1.D0)
    print*,"Enter Cylinder Radius: "
    read*,cylr
    print*,"Enter Cylinder Height: "
    read*,cylh
    cylvol  = PI * (cylr*cylr) * cylh
    print*,"Cylinder Volume: ",cylvol
end subroutine

subroutine subcubevol(cubel)
    implicit none
    real :: cubel, cubevol
    print*,"Enter Cube Side Length: "
    read*,cubel
    cubevol = cubel * cubel * cubel
    print*,"Cube Volume: ",cubevol
end subroutine

subroutine subrecprismvol (rpl, rpw, rph)
    implicit none
    real :: rpl, rpw, rph, rpvol 
    print*,"Enter Prism Length: "
    read*,rpl
    print*,"Enter Prism Width: "
    read*,rpw
    print*,"Enter Prism Height: "
    read*,rph
    rpvol = rpl * rpw * rph
    print*,"Rectangular Prism Volume: ",rpvol
end subroutine

subroutine subconevol (coner, coneh)
    implicit none
    real :: coner, coneh, conevol, PI
    PI=4.D0*DATAN(1.D0)
    print*,"Enter Cone Radius: "
    read*,coner
    print*,"Enter Cone Height: "
    read*,coneh
    conevol = (1.00/3.00)*PI*(coner*coner)*coneh
end subroutine
