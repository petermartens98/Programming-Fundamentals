Program FizzBuzz
    integer i
    i = 1
    do while (i <= 100)
        if (mod(i,3)==0 .and. mod(i,5)==0) then
            print*,'FizzBuzz'
        else if (mod(i,3)==0) then
            print*,'Fizz'
        else if (mod(i,5)==0) then
            print*,'Buzz'
        else
            print*,i
        end if
    i = i+1
    end do 
end Program FizzBuzz
