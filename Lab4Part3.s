# Lab 4 Part 3

addi	t0, zero, 0x01234567	# datain_a = 0x1234567
addi	t1, zero, 0x11223344	# datain_b/imm = 0x11223344

# testing addition
add	t2, t0, t1		# t2 = datain_a + datain_b = 0x124578AB

# testing subtraction
sub	t3, t0, t1		# t3 = datain_a - datain_b = 0xF0011223

# testing immediate addition
addi	t4, t0, 0xF0011223	# t4 = datain_a - 0xF0011223 = 0x124578AB

# testing and
and	t2, t0, t1		# t2 = datain_a AND datain_b

# testing immediate and
andi	t3, t0, 0xF0011223	# t3 = datain_a AND 0xF0011223

# testing or
or	t4, t0, t1		# t4 = datain_a OR datain_b

# testing immediate or
ori	t5, t0, 0xF0011223	# t5 = datain_a OR 0xF0011223

#-----updating input-----
addi	t1, zero, 2
#------------------------

# testing shift left logical
sll	t2, t0, t1		# t2 = datain_a << t1

# testing immediate shift left logical
slli	t3, t0, 2		# t3 = datain_a << 2

# testing shift right logical
srl	t4, t0, t1		# t4 = datain_a >> t1

# testing immediate shift right logical
srli	t5, t0, 2		# t5 = datain_a >> 2