program pipeline
    implicit none
    real :: a, b, c
    character(len=64) :: arg

    call get_command_argument(1, arg)
    read(arg, *) a
    call get_command_argument(2, arg)
    read(arg, *) b

    c = a + b
    print *, c
end program
