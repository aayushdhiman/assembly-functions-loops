# Write the assembly code for array_max

#
# Usage: ./array-max <array>
#

# Make main accessible outside of this module
.global array_max

# Start of code section
.text

# unsigned long array_max(unsigned long n, unsigned long *items)
array_max:
	enter $0, $0
  
	# Variable Mappings
	# num of arguments -> %r12
	# argument addresses -> %r13
	# loop counter -> %r14

	mov %rdi, %r12 # number of variables
	mov %rsi, %r13 # argument addresses
	mov $0, %r14
	mov 8(%r13), %r15
	mov $0, %rax

	# Body
	# right now, r12 has the num of variables and r13 has all the memory addresses
loop:
	#theyre already longs, so no need to convert
	cmp %r12, %r14
	jge loop_end

	mov (%r13, %r14, 8), %r8
	cmp %r15, %r8
	jge update

	inc %r14
	jmp loop

update:
	mov %r8, %r15
	
loop_end:
	mov %r15, %rax
	leave
	ret

.data
format:
	.asciz "%ld\n"
