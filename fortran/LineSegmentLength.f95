program LineSegmentLength
implicit none
    real :: coord1x, coord1y, coord2x, coord2y, xcomp, ycomp, dist
    print*,'Calculate Line Segment Length'
    write(*,*)
    print*,'Enter First Coordinate -> X Y: '
    read (*,*) coord1x, coord1y
    print*,'Enter Second Coordinate -> X Y: '
    read (*,*) coord2x, coord2y
    
    xcomp = abs(coord1x - coord2x)
    xcomp = xcomp * xcomp
    ycomp = abs(coord1y - coord2y)
    ycomp = ycomp * ycomp
    dist = SQRT(xcomp+ycomp)
    
    print*,'***** RESULTS *****'
    print*,'Line Segment Length: ',dist
end program LineSegmentLength
