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
        addi    sp,sp,-16					#
        sw      ra,12(sp)					#
        lw      a3,num						#load integer data from num = 19, by the case of leetcode 202
        li      a2,10						#load immediate 10, this data for modulus operation
        li      a1,9						#load immediate 10, this data for sum decision sum>=10
exchange:
        mv      a4,a3						# n = sum
        li      a3,0						# sum = 0
		
operation:
        rem     a5,a4,a2					#
        div     a4,a4,a2					#
        mul     a5,a5,a5					#
        add     a3,a3,a5					#
        bne     a4,zero,operation			#
        bgt     a3,a1,exchange				#
        li      a5,1						#
        beq     a3,a5,true					#
        la     	a0, str2					# prepare to print string = false
	    li     	a7, 4 						# print string
        ecall
        li      a7, 10        				# end program
        ecall
    
false:
        lw      ra,12(sp)					#
        li      a0,0						#
        addi    sp,sp,16					#
        li      a7, 10        				# end program
        ecall
        jr      ra							#

true:
        la     a0, str1						# prepare to print string = true
	    li     a7, 4 						# print string
        ecall
        j       false						#

    