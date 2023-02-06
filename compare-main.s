# Write the assembly code for main

#
# Usage: ./compare <arg1> <arg2>
#

.global main

.text

#String main(int argc, char argv[][])
main:
  # Function prologue
  enter $0, $0
  
  # Variable mappings:
  # arg1 -> %r12
  # arg2 -> %r13
  # number of inputs -> %r10
  movq 8(%rsi), %r12
  movq 16(%rsi), %r13
  mov %rdi, %r10

  # Body
  
  # Check if there are two inputs
  movq $3, %r9
  cmpq %r10, %r9
  jne toomany

  # convert each value to a long  
  movq %r12, %rdi
  call atol
  movq %rax, %r12
  
  movq %r13, %rdi
  call atol
  movq %rax, %r13

  # move both inputs into rdi and rsi and call compare
  movq %r13, %rdi
  movq %r12, %rsi
  call compare

  # move the compare output into r14
  movq %rax, %r14

  # if the output from compare is equal to 0 then it is equal
  # less than 0 is less than
  # greater than 0 is greater than
  movq $0, %r8
  cmpq %r14, %r8
  jz equalfunc
  jl lessfunc
  jg greaterfunc

  # Function epilogue
  leave
  ret

toomany:
  movq $format, %rdi
  movq $error, %rsi
  call printf
  
  # Function epilogue
  leave
  ret

lessfunc:
  # print lesstxt
  movq $format, %rdi
  movq $lesstxt, %rsi
  call printf

  # Function epilogue
  leave
  ret

equalfunc:
  # print equaltxt
  movq $format, %rdi
  movq $equaltxt, %rsi
  call printf
 
  # Function epilogue
  leave
  ret

greaterfunc:
  # print greatertxt
  movq $greatertxt, %rdi
  call printf

  # Function epilogue
  leave
  ret

# Start of data section
.data
format:
  .asciz "%s\n"

lesstxt:
  .asciz "less"

equaltxt:
  .asciz "equal"

greatertxt:
  .asciz "greater\n"

error:
  .asciz "Two inputs required."
