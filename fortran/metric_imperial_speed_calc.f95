program speed_calculator
    implicit none
    real :: unitsys, timesys, tripsec, tripmin, triphr
    print*,"What unit system?"
    print*,"1 for Metric"
    print*,"2 for Imperial"
    read*,unitsys
    print*,"-------------------------------"
    print*,"Preferred Time Imput: "
    print*,"1 for Seconds"
    print*,"2 for Minutes"
    print*,"3 for Hours"
    read*,timesys
    if(timesys == 1) then 
        print*,"-------------------------------"
        print*,"How many seconds?"
        read*,tripsec
        tripmin = tripsec/60.00
        triphr = tripmin/60.00
    else if(timesys == 2) then
        print*,"-------------------------------"
        print*,"How many minutes?"
        read*,tripmin
        tripsec = tripmin * 60.00
        triphr = tripmin / 60.00
    else if(timesys == 3) then
        print*,"-------------------------------"
        print*,"How many hours?"
        read*,triphr
        tripmin = triphr * 60.00
        tripsec = tripmin * 60.00
    end if
    if(unitsys == 1) then
        CALL submetspeed(tripsec, tripmin, triphr)
    else if(unitsys == 2) then
        CALL subimpspeed(tripsec, tripmin, triphr)
    end if
end program

subroutine submetspeed(tripsec, tripmin, triphr)
    implicit none
    real :: tripsec, tripmin, triphr, m, km, disin, disout, timeout, mps, mpm, mph, kmps, kmpm, kmph
    print*,"-------------------------------"
    print*,"Enter desired distance input: "
    print*,"1 for Meters"
    print*,"2 for Kilometers"
    read*,disin
    if(disin == 1) then
        print*,"-------------------------------"
        print*,"Enter Distance (m): "
        read*,m
        km=m/1000.00
    else if(disin == 2) then
        print*,"-------------------------------"
        print*,"Enter Distance (km): "
        read*,km
        m=km*1000.00
    end if
    print*,"-------------------------------"
    print*,"Enter desired distance output: "
    print*,"1 for Meters"
    print*,"2 for Kilometers"
    read*,disout
    print*,"-------------------------------"
    print*,"Enter desired time output: "
    print*,"1 for Seconds"
    print*,"2 for Minutes"
    print*,"3 for Hours"
    read*,timeout
    print*,"***** Speed Results *****"
    mps= m/tripsec
    mpm= m/tripmin
    mph= m/triphr
    kmps= km/tripsec
    kmpm= km/tripmin
    kmph= km/triphr
    if (disout == 1 .AND. timeout == 1) then
        print*,"meters/sec: ",mps
    else if (disout == 1 .AND. timeout == 2) then
        print*,"meters/min: ",mpm
    else if (disout == 1 .AND. timeout == 3) then
        print*,"meters/hour: ",mph
    else if (disout == 2 .AND. timeout == 1) then
        print*,"km/sec: ",kmps
    else if (disout == 2 .AND. timeout == 2) then
        print*,"km/min: ",kmpm
    else if (disout == 2 .AND. timeout == 3) then
        print*,"km/hour: ",kmph
    end if
end subroutine

subroutine subimpspeed(tripsec, tripmin, triphr)
    implicit none
    real :: tripsec, tripmin, triphr, ft, mil, fps, fpm, fph, mps, mpm, mph, disin, disout, timeout
    print*,"-------------------------------"
    print*,"Enter desired distance input: "
    print*,"1 for Feet"
    print*,"2 for Miles"
    read*,disin
    if(disin == 1) then
        print*,"-------------------------------"
        print*,"Enter Distance (ft): "
        read*,ft
        mil=ft/5280.00
    else if(disin == 2) then
        print*,"-------------------------------"
        print*,"Enter Distance (miles): "
        read*,mil
        ft=mil*5280
    end if
    print*,"-------------------------------"
    print*,"Enter desired distance output: "
    print*,"1 for Feet"
    print*,"2 for Miles"
    read*,disout
    print*,"-------------------------------"
    print*,"Enter desired time output: "
    print*,"1 for Seconds"
    print*,"2 for Minutes"
    print*,"3 for Hours"
    read*,timeout
    fps = ft/tripsec
    fpm = ft/tripmin
    fph = ft/triphr
    mps = mil/tripsec
    mpm = mil/tripmin
    mph = mil/triphr
    print*,"***** Speed Results *****"
    if (disout == 1 .AND. timeout == 1) then
        print*,"ft/sec: ",fps
    else if (disout == 1 .AND. timeout == 2) then
        print*,"ft/min: ",fpm
    else if (disout == 1 .AND. timeout == 3) then
        print*,"ft/hour: ",fph
    else if (disout == 2 .AND. timeout == 1) then
        print*,"miles/sec: ",mps
    else if (disout == 2 .AND. timeout == 2) then
        print*,"miles/min: ",mpm
    else if (disout == 2 .AND. timeout == 3) then
        print*,"miles/hour: ",mph
    end if
end subroutine
