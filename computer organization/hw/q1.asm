.data
size: .word 0 
star:  .string "* "
nwline:  .string "\n"
.text 


main:	
	add s2, x0, x0        # i =0
	add s3, x0, x0        # j = 0
	
	
	
	li a0, 0            # File descriptor, 0 for STDIN
        li a7, 5            # System call code for read integer. The value will be in a0
        ecall
        
    
     
     
     
	lw  s4, size        # size
	 add s4, x0, a0
	 addi s4 ,s4 ,1
	 
	
	 
	 
	 
	 
loop1:
	
	la a0, nwline        
	li a7, 4
	ecall	
	
	addi	s2, s2, 1		   
	addi	t0, s4, 1		  
	blt   s2, t0, jump    
	
	
	
	j exit	
	
		
			 
loop2:
	addi s3, s3, 1	      
	add t2, s4, x0	      
	
	
	
	bge   s3, t2, loop1  
	sub  t1, s4, s2	      
	addi t1, t1, 1        
	blt  s3, t1, loop2	   				
        j printStar
        	

jump:
	add s3, x0, x0      
	j loop2

printStar:
	la a0, star
	li a7, 4
	ecall
	j loop2	



exit:


	
	

    	li a7, 10
    	ecall 
