program HelloName
    implicit none
    character(len=20) :: firstname, lastname
    character(len=6) :: title
    character(len=40) :: fullname
    print*,"Enter Title: "
    read*,title
    print*,"-------------------------------"
    print*,"Enter First Name: "
    read*,firstname
    print*,"-------------------------------"
    print*,"Enter Last Name: "
    read*,lastname
    print*,"-------------------------------"
    fullname = trim(title)//" "//trim(firstname)//" "//trim(lastname)
    print*,"Hello ",fullname
end program
