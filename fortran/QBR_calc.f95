program QBR_calc

    implicit none
    
    real :: comp, att, yds, td, int, a, b, c , d, qbr
    
    print*,'Fortran QBR Calculator'
    write(*,*)
    
    print*,'Input completions: '
    read*,comp
    
    print*,'Input attempts: '
    read*,att
    
    print*,'Input passing yards: '
    read*,yds
    
    print*,'Input touchdowns: '
    read*,td
    
    print*,'Input interceptions: '
    read*,int
    
    a=((comp/att)-0.3)*5
    b=((yds/att)-3)/4
    c=(td/int)*20
    d=2.375-((int/att)*25)
    qbr = ((a+b+c+d)/6)*100
    
    print*, "Quarterback Rating: ",qbr 

end program QBR_calc
