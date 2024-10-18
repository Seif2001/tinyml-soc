
uart.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	00000093          	li	ra,0
   4:	20002117          	auipc	sp,0x20002
   8:	ffc10113          	addi	sp,sp,-4 # 20002000 <_stack>
   c:	00000193          	li	gp,0
  10:	00000213          	li	tp,0
  14:	00000293          	li	t0,0
  18:	00000313          	li	t1,0
  1c:	00000393          	li	t2,0
  20:	00000413          	li	s0,0
  24:	00000493          	li	s1,0
  28:	00000513          	li	a0,0
  2c:	00000593          	li	a1,0
  30:	00000613          	li	a2,0
  34:	00000693          	li	a3,0
  38:	00000713          	li	a4,0
  3c:	00000793          	li	a5,0
  40:	00000813          	li	a6,0
  44:	00000893          	li	a7,0
  48:	00000913          	li	s2,0
  4c:	00000993          	li	s3,0
  50:	00000a13          	li	s4,0
  54:	00000a93          	li	s5,0
  58:	00000b13          	li	s6,0
  5c:	00000b93          	li	s7,0
  60:	00000c13          	li	s8,0
  64:	00000c93          	li	s9,0
  68:	00000d13          	li	s10,0
  6c:	00000d93          	li	s11,0
  70:	00000e13          	li	t3,0
  74:	00000e93          	li	t4,0
  78:	00000f13          	li	t5,0
  7c:	00000f93          	li	t6,0
  80:	00000517          	auipc	a0,0x0
  84:	15050513          	addi	a0,a0,336 # 1d0 <_sidata>
  88:	20000597          	auipc	a1,0x20000
  8c:	f7858593          	addi	a1,a1,-136 # 20000000 <gpio_oe>
  90:	20000617          	auipc	a2,0x20000
  94:	f8860613          	addi	a2,a2,-120 # 20000018 <_ebss>
  98:	00c5dc63          	bge	a1,a2,b0 <end_init_data>

0000009c <loop_init_data>:
  9c:	00052683          	lw	a3,0(a0)
  a0:	00d5a023          	sw	a3,0(a1)
  a4:	00450513          	addi	a0,a0,4
  a8:	00458593          	addi	a1,a1,4
  ac:	fec5c8e3          	blt	a1,a2,9c <loop_init_data>

000000b0 <end_init_data>:
  b0:	20000517          	auipc	a0,0x20000
  b4:	f6850513          	addi	a0,a0,-152 # 20000018 <_ebss>
  b8:	20000597          	auipc	a1,0x20000
  bc:	f6058593          	addi	a1,a1,-160 # 20000018 <_ebss>
  c0:	00b55863          	bge	a0,a1,d0 <end_init_bss>

000000c4 <loop_init_bss>:
  c4:	00052023          	sw	zero,0(a0)
  c8:	00450513          	addi	a0,a0,4
  cc:	feb54ce3          	blt	a0,a1,c4 <loop_init_bss>

000000d0 <end_init_bss>:
  d0:	020000ef          	jal	f0 <main>

000000d4 <loopy>:
  d4:	0000006f          	j	d4 <loopy>

000000d8 <exit>:
  d8:	200007b7          	lui	a5,0x20000
  dc:	0047a703          	lw	a4,4(a5) # 20000004 <gpio_data>
  e0:	f00fe7b7          	lui	a5,0xf00fe
  e4:	00e78793          	addi	a5,a5,14 # f00fe00e <_stack+0xd00fc00e>
  e8:	00f72023          	sw	a5,0(a4)
  ec:	00008067          	ret

000000f0 <main>:
  f0:	200007b7          	lui	a5,0x20000
  f4:	0007a783          	lw	a5,0(a5) # 20000000 <gpio_oe>
  f8:	ff010113          	addi	sp,sp,-16
  fc:	00812423          	sw	s0,8(sp)
 100:	00112623          	sw	ra,12(sp)
 104:	fff00713          	li	a4,-1
 108:	27100513          	li	a0,625
 10c:	00e7a023          	sw	a4,0(a5)
 110:	010000ef          	jal	120 <uart_init>
 114:	1c000513          	li	a0,448
 118:	05c000ef          	jal	174 <uart_puts>
 11c:	ff9ff06f          	j	114 <main+0x24>

00000120 <uart_init>:
 120:	200007b7          	lui	a5,0x20000
 124:	0107a703          	lw	a4,16(a5) # 20000010 <uart_bauddiv>
 128:	200007b7          	lui	a5,0x20000
 12c:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 130:	00a72023          	sw	a0,0(a4)
 134:	00100713          	li	a4,1
 138:	00e7a023          	sw	a4,0(a5)
 13c:	00008067          	ret

00000140 <uart_putc>:
 140:	200007b7          	lui	a5,0x20000
 144:	00c7a703          	lw	a4,12(a5) # 2000000c <uart_status>
 148:	00072783          	lw	a5,0(a4)
 14c:	fe078ee3          	beqz	a5,148 <uart_putc+0x8>
 150:	200007b7          	lui	a5,0x20000
 154:	0087a783          	lw	a5,8(a5) # 20000008 <uart_data>
 158:	20000737          	lui	a4,0x20000
 15c:	01472703          	lw	a4,20(a4) # 20000014 <uart_ctrl>
 160:	00a7a023          	sw	a0,0(a5)
 164:	00072783          	lw	a5,0(a4)
 168:	0027e793          	ori	a5,a5,2
 16c:	00f72023          	sw	a5,0(a4)
 170:	00008067          	ret

00000174 <uart_puts>:
 174:	00054603          	lbu	a2,0(a0)
 178:	04060263          	beqz	a2,1bc <uart_puts+0x48>
 17c:	200007b7          	lui	a5,0x20000
 180:	00c7a703          	lw	a4,12(a5) # 2000000c <uart_status>
 184:	200007b7          	lui	a5,0x20000
 188:	0087a803          	lw	a6,8(a5) # 20000008 <uart_data>
 18c:	200007b7          	lui	a5,0x20000
 190:	0147a583          	lw	a1,20(a5) # 20000014 <uart_ctrl>
 194:	00150693          	addi	a3,a0,1
 198:	00072783          	lw	a5,0(a4)
 19c:	fe078ee3          	beqz	a5,198 <uart_puts+0x24>
 1a0:	00c82023          	sw	a2,0(a6)
 1a4:	0005a783          	lw	a5,0(a1)
 1a8:	00168693          	addi	a3,a3,1
 1ac:	0027e793          	ori	a5,a5,2
 1b0:	00f5a023          	sw	a5,0(a1)
 1b4:	fff6c603          	lbu	a2,-1(a3)
 1b8:	fe0610e3          	bnez	a2,198 <uart_puts+0x24>
 1bc:	00008067          	ret
 1c0:	6548                	.insn	2, 0x6548
 1c2:	6c6c                	.insn	2, 0x6c6c
 1c4:	6f57206f          	j	730b8 <_sidata+0x72ee8>
 1c8:	6c72                	.insn	2, 0x6c72
 1ca:	2164                	.insn	2, 0x2164
 1cc:	000a                	.insn	2, 0x000a
	...

Disassembly of section .data:

20000000 <gpio_oe>:
20000000:	0004                	.insn	2, 0x0004
20000002:	4000                	.insn	2, 0x4000

20000004 <gpio_data>:
20000004:	0000                	.insn	2, 0x
20000006:	4000                	.insn	2, 0x4000

20000008 <uart_data>:
20000008:	000c                	.insn	2, 0x000c
2000000a:	5000                	.insn	2, 0x5000

2000000c <uart_status>:
2000000c:	0008                	.insn	2, 0x0008
2000000e:	5000                	.insn	2, 0x5000

20000010 <uart_bauddiv>:
20000010:	0004                	.insn	2, 0x0004
20000012:	5000                	.insn	2, 0x5000

20000014 <uart_ctrl>:
20000014:	0000                	.insn	2, 0x
20000016:	5000                	.insn	2, 0x5000

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	1b41                	.insn	2, 0x1b41
   2:	0000                	.insn	2, 0x
   4:	7200                	.insn	2, 0x7200
   6:	7369                	.insn	2, 0x7369
   8:	01007663          	bgeu	zero,a6,14 <start+0x14>
   c:	0011                	.insn	2, 0x0011
   e:	0000                	.insn	2, 0x
  10:	1004                	.insn	2, 0x1004
  12:	7205                	.insn	2, 0x7205
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	0031                	.insn	2, 0x0031

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	.insn	4, 0x3a434347
   4:	2820                	.insn	2, 0x2820
   6:	39386367          	.insn	4, 0x39386367
   a:	6431                	.insn	2, 0x6431
   c:	6438                	.insn	2, 0x6438
   e:	65333263          	.insn	4, 0x65333263
  12:	2029                	.insn	2, 0x2029
  14:	3331                	.insn	2, 0x3331
  16:	322e                	.insn	2, 0x322e
  18:	302e                	.insn	2, 0x302e
	...
