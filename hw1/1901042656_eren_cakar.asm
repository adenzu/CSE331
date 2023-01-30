	.data
print0:
	.asciiz "The integers can be seperated arbitrarily while entering inputs.\n"
print1:
	.asciiz	"Enter array length and k value:\n"
print2:
	.asciiz "Enter array integers:\n"
print3:
	.asciiz "Result:\n"
array:
	.word 0 : 100

	.text
	.globl main
main:
	la $a0, print0
	li $v0, 4
	syscall						# inform about input structure
	
	la $a0, print1
	li $v0, 4
	syscall						# instruct to enter array length and k value
	
read_len:
	jal read_int				# read array length
	beq $v1, $zero, read_len	# if couldnt read an integer try again
	move $s0, $v0				# save to s0

read_k:
	jal read_int				# read k value
	beq $v1, $zero, read_k		# if couldnt read an integer try again
	move $s1, $v0				# save to s1
	
	la $a0, print2
	li $v0, 4
	syscall						# instruct to enter array elements
	
	move $a0, $s0				# number of integers to read (array length)
	jal read_elements			# read array elements
	
	la $a0, print3
	li $v0, 4
	syscall						# instruct to enter array elements
	
	move $a0, $s0				# array length
	move $a1, $s1				# k value
	jal count_dsp				# count number of valid pairs
	
	move $a0, $v0				# move the result to a0
	li $v0, 1					# to print result
	syscall						# print result 
	
	j exit

# count number of pairs whose sum is divisible by k value -> $v0
count_dsp:
	move $t0, $a0				# array length
	move $t1, $a1				# k value
	li $t8, 4					# number of bytes in a word
	mult $t0, $t8				# to get word index
	mflo $t8					# word index
	li $v0, 0					# number of valid pairs
loop_cd_0:
	subi $t0, $t0, 1			# decrement counter by one
	subi $t8, $t8, 4			# greatest index is one minus array length
	beq $t0, $zero, return_cd	# end if counter is zero
	lw $t3, array($t8)			# first element of addition
	move $t2, $t0				# counter of inner loop
	move $t9, $t8				# index of inner loop's element
loop_cd_1:
	subi $t2, $t2, 1			# decrement counter by one
	subi $t9, $t9, 4			# get to index of next element
	lw $t4, array($t9)			# second element of addition
	add $t5, $t3, $t4			# sum of elements
	div $t5, $t1				# divide sum by k
	mfhi $t6					# get quotient to t6
	slti $t7, $t6, 1			# if quotient is 0
	add $v0, $v0, $t7			# increment the result by one
	bne $t2, $zero, loop_cd_1	# loop if last element isnt reached
	j loop_cd_0					# outer loop
return_cd:
	jr $ra
	
# get array elements -> array
read_elements:
	subi $sp, $sp, 4			# open space to store s0
	sw $s0, ($sp)				# store s0
	li $s0, 0					# index of read int
	subi $sp, $sp, 4			# open space to store s1
	sw $s1, ($sp)				# store s1
	move $s1, $a0				# loop counter
loop_re_0:
	beq $s1, $zero, return_re	# end if loop counter is zero
	subi $sp, $sp, 4			# open space to store content of ra
	sw $ra, ($sp)				# store content of ra
	jal read_int				# read int
	lw $ra, ($sp)				# get back stored ra content
	addi $sp, $sp, 4			# free space
	beq $v1, $zero, loop_re_0	# if couldnt read an integer, try again
	sw $v0, array($s0)			# put read int to corresponding position in array
	addi $s0, $s0, 4			# get to next element's index
	subi $s1, $s1, 1			# decrement loop counter by one
	j loop_re_0					# continue
return_re:
	lw $s1, ($sp)				# load s1
	addi $sp, $sp, 4			# free space to store s1
	lw $s0, ($sp)				# load s0
	addi $sp, $sp, 4			# free space to store s0
	jr $ra

# reads integer -> $v0
read_int:
	li $t0, 0					# min digit value
	li $t1, 9					# max digit value
	li $t2, 0					# read integer
	li $t3, 10					# decimal read
	li $t4, 0					# did read an integer?
loop_ri_0:
	subi $sp, $sp, 4			# open space to store content of ra
	sw $ra, ($sp)				# store content of ra
	jal read_char				# read char
	lw $ra, ($sp)				# get back stored ra content
	addi $sp, $sp, 4			# free space
	subi $v0, $v0, 48			# subtract the ascii value of '0'
	blt $v0, $t0, return_ri		# < 0
	bgt $v0, $t1, return_ri		# > 9
	li $t4,	1					# read an integer
	mult $t2, $t3				# multiply already read integer by 10
	mflo $t2					# update with the result
	add $t2, $t2, $v0			# add read digit to the return value
	j loop_ri_0
return_ri:
	move $v0, $t2				# read integer
	move $v1, $t4				# did read an integer
	jr $ra

# reads one character -> $v0
read_char:
	li $v0, 12
	syscall
	jr $ra

# exit the program
exit:
	li $v0, 10
	syscall