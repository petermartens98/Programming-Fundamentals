program bmi_calc
    implicit none
    real :: h, w, bmi
    print*,'Fortran BMI Calculator'
    write(*,*)
    print*,'Enter Height: '
    read *, h
    print*,'Enter Weight: '
    read *, w
    bmi = (w / (h*h))*703
    write(*,*)
    print*,'***** RESULTS *****'
    write(*,*)
    print*,'Body Mass Index (BMI): ',bmi
    write(*,*)
    IF (bmi < 18.5) THEN 
        print*,"Weight Status: Underweight"
    ELSE IF (bmi >= 18.5 .AND. bmi < 25.0) THEN
        print*,"Weight Status: Healthy Weight"
    ELSE IF (bmi >= 25 .AND. bmi < 30.0) THEN
        print*,"Weight Status: Overweight"
    ELSE IF (bmi >= 30.0) THEN
        print*,"Weight Status: Obesity"
    END IF
end program bmi_calc
