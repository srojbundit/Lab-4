

.text
main:
	# using s1, s2, s3 for int a, b, c
	addi	a2, zero, 3	# pass 3 as the argument
	jal	Fibonacci
	mv	s1, a0		# s1 = Fibonacci(3)
	
	addi	a2, zero, 10
	jal	Fibonacci
	mv	s2, a0		# s1 = Fibonacci(3)
	
	addi	a2, zero, 20
	jal	Fibonacci
	mv	s3, a0		# s1 = Fibonacci(3)
	
	j	exit

Fibonacci:
	addi	a2, a2, -1  # offset the input by -1
Fib:
	blt	a2, zero, if	# if (n <= 0) {proceed to "if"}

	addi	t0, zero, 1
	beq	a2, t0, elif	# else if (n == 1) {proceed to "elif")}
	
	# else
	addi	sp, sp, -8	# push 2 stacks
	sw	a2, 0(sp)	# store a2 at 0
	sw	ra, 4(sp)	# store return address at 1
	
	# n = Fibonacci(n - 1)
	addi	a2, a2, -1	# n -= 1
	jal	Fib		# return here after the base case is reached
	
	# swap n root from the stack with Fibonacci(n - 1)
	lw	t0, 0(sp)	# load n root back from the stack
	sw	a2, 0(sp)	# repalce it with the result from Fibonacci(n - 1)
	mv	a2, t0
	
	# n = Fibonacci(n - 2)
	addi	a2, a2, -2	# n -= 2
	jal	Fib		# return here after the base case is reached

	# n = Fibonacci(n - 1) + Fibonacci(n - 2)
	lw	t0, 0(sp)	# t0 = Fibonacci(n - 1)
	add	a2, a2, t0	# a2 = t0 + Fibonacci(n - 2)
	
	mv	a0, a2
	lw	ra, 4(sp)	# load the stored ra into ra
	addi	sp, sp, 8	# pop the stack pointer by 2
	j	return
if:	# a0 = a2 = 0
	mv	a0, zero	# return 0;
	mv	a2, a0		# a2 = 0;
	j	return
elif:
	addi	a0, zero, 1	# return 1;
	mv	a2, a0		# a2 = 1;
	j	return
return:
	ret
exit: