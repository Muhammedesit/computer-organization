.globl __start

.text

__start:
    
    
    li a0, 0            # File descriptor, 0 for STDIN
        li a7, 5            # System call code for read integer. The value will be in a0
        ecall
        
        
add a5,a0,x0   # put a5 to a0    
  jal fonk
add a0, a5,x0 

li a7, 1			# Print a0
        ecall

j exit


fonk:
	 addi sp,sp,-8
	 sw   x1,4(sp)
	 sw   a5,0(sp)  # a5 =n 
	 addi t0,a5,-1  #t0=n-1
	bge  t0,x0,L1
	 addi a5,x0,5
	 addi sp,sp,8
	 jalr x0,0(x1)
L1: 
	addi a5,a5,-1
	 jal  x1,fonk
	 addi t1,a5,0	  
	 lw   a5,0(sp)
	 lw   x1,4(sp)
	 addi sp,sp,8	 
	 add t1,t1,t1  #2* f(n-1)
	 add t1,t1,a5 # +n
	 add a5,t1,x0
	 jalr x0,0(x1)
      exit:  