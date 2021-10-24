.data
num:     .word 19
str1:    .string "true"
str2:    .string "false"
.text
#a3 = num
#a2 = modulus data
#a1 = logical comparison data
#a4 = sum


main:
        addi    sp,sp,-16					# Add Immediate stack pointer
        sw      ra,12(sp)					# store data in reg and store it to memory
        lw      a3,num						# load integer data from num = 19, by the case of leetcode 202
        li      a2,10						# load immediate 10, this data for modulus operation
        li      a1,9						# load immediate 10, this data for sum decision sum>=10
exchange:
        mv      a4,a3						# n = sum
        li      a3,0						# sum = 0
		
operation:
        rem     a5,a4,a2					# rem = n%10
        div     a4,a4,a2					# n = n/10
        mul     a5,a5,a5					# multiplication rem * rem
        add     a3,a3,a5					#
        bne     a4,zero,operation			# if n == 0 then will return to operation faunction
        bgt     a3,a1,exchange				# if sum >= 10 then will process function
        li      a5,1						# load immediate 1, this data for sum == 1
        beq     a3,a5,true					# if condition if(sum==1) then will return to true function
        la     	a0, str2					# prepare to print string = false
	    li     	a7, 4 						# print string
        ecall
        li      a7, 10        				# end program
        ecall
    
false:
        lw      ra,12(sp)					# load word form
        li      a0,0						# load immediate 0
        addi    sp,sp,16					#
        li      a7, 10        				# end program
        ecall
        jr      ra							#

true:
        la     a0, str1						# prepare to print string = true
	    li     a7, 4 						# print string
        ecall
        j       false						# jump to false function if the condition false

    