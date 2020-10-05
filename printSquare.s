.data
    star: .string "* "
    nline: .string "\n"
    msg: .string "the square is following:\n"

.text
    main:
    addi t1, x0, 5	# the size of square is 5
    add t2, x0, x0
    add t3, x0, x0
    
    la a0, msg
    li a7, 4
    ecall
    
    j label1

label1:		# outer loop
    addi t2, t2, 1
    add t3, x0, x0
    bge t1, t2, label2
    j done 

label2:		# inner loop
    jal ra, printStar
    addi t3, t3, 1
    bne t1, t3, label2
    jal ra, printLine
    j label1

printStar:
    la a0, star
    li a7, 4
    ecall
    ret

printLine:
    la a0, nline
    li a7, 4
    ecall
    ret

done:
    li a7, 10
    ecall