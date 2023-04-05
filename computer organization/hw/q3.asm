.global main
main:
	la a0, print	        # prepare to print string 
        li a7, 4			# print string
        ecall
        
	li a0,0
        li a7, 5            # System call code for read integer. The value will be in a0
        ecall    
        
        addi t0,a0,0   
        
        slli t2,t0,2	
        sub sp,sp,t2	
             
        addi t1,zero,1	
	jal ra,takeinput
	sub sp,sp,t2	
	addi s1, sp,0
	
	addi s7,zero,0	
	
	jal ra,firstloop 
	 jal printarray
	
	
	
	beq zero,zero,exit
takeinput: 

       addi a0,t1,0      
       li a7,1
       ecall
      
	la a0, print1	        # prepare to print string 
        li a7, 4			# print string
        ecall
	
	li a0, 0            # File descriptor, 0 for STDIN
        li a7, 5            # System call code for read integer. The value will be in a0
        ecall
	
	
	
	
	
	sw a0,0(sp)
	addi sp,sp,4	

	
	
	addi t1,t1,1           
	
	ble t1,t0,takeinput
	
	jalr zero,0(ra)
	
exit: 
        addi a7, zero, 93        #Exit process 
        addi a0, zero, 13
        ecall 


	


firstloop:
			
 	addi s1,sp,0 
 	addi t2,zero,1 
	slli t2,s7,2
	add t2,t2,s1 
	lw t2,0(t2)  
     	
     	
     	addi s3,t2,0 
     	addi s6,s7,-1 
     	
     	
     	
     	addi s7,s7,1 
     	jal ra,secondloop
     		
	blt s7,t0,firstloop


  
secondloop:
	blt s6,zero,link        
	blt s9,s3,link         
	add s9,s6,zero         
	slli s9,s9,2    	 
		add s9,s9,sp    	
	lw s9,0(s9)             
	

        
        	 
       addi s9,s6,1             
       slli s9,s9,2
       add s9,s9,sp
       add s11,s6,zero
       slli s11,s11,2
       add s11,s11,sp
       lw s11,0(s11)
       sw s11,0(s9)
       addi s6,s6,-1
     
       		
       beq zero,zero,secondloop

link:
jal ra,change


change:
	addi s9,s6,1
	slli s9,s9,2
	add s9,s9,sp
	sw s3,0(s9)


printarray:
        la   a0, str2
        li   a7, 4
        ecall
        
        lw   t0, 0(s0)
        addi a0,t1,1
        li   a7, 1
        ecall
        lw   t0, 4(s0)
        addi a0,t1,1
        li   a7, 1
        ecall
        lw   t0, 8(s0)
        addi a0,t1,1
        li   a7, 1
        ecall
        lw   t0, 12(s0)
        addi a0,t1,1
        li   a7, 1
        ecall
        lw   t0, 16(s0)
        addi a0,t1,1
        li   a7, 1
        ecall
        ret


.data

print: 
	.string "enter the size\n"


print1:
      .string ":"


str2:
          .string "Your array is: "

str1:         
	.space 255

