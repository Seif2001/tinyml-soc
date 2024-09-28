
test.elf:     file format elf32-littleriscv


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
  84:	0c450513          	addi	a0,a0,196 # 144 <_sidata>
  88:	20000597          	auipc	a1,0x20000
  8c:	f7858593          	addi	a1,a1,-136 # 20000000 <gpio_oe_2>
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
  d0:	008000ef          	jal	d8 <main>

000000d4 <loopy>:
  d4:	0000006f          	j	d4 <loopy>

000000d8 <main>:
  d8:	200007b7          	lui	a5,0x20000
  dc:	0147a583          	lw	a1,20(a5) # 20000014 <gpio_oe_0>
  e0:	200007b7          	lui	a5,0x20000
  e4:	0107a603          	lw	a2,16(a5) # 20000010 <gpio_data_0>
  e8:	200007b7          	lui	a5,0x20000
  ec:	00c7a683          	lw	a3,12(a5) # 2000000c <gpio_oe_1>
  f0:	fff00713          	li	a4,-1
  f4:	f00fe7b7          	lui	a5,0xf00fe
  f8:	00e5a023          	sw	a4,0(a1)
  fc:	00e78793          	addi	a5,a5,14 # f00fe00e <_stack+0xd00fc00e>
 100:	200005b7          	lui	a1,0x20000
 104:	0085a583          	lw	a1,8(a1) # 20000008 <gpio_data_1>
 108:	00f62023          	sw	a5,0(a2)
 10c:	200007b7          	lui	a5,0x20000
 110:	0007a603          	lw	a2,0(a5) # 20000000 <gpio_oe_2>
 114:	00e6a023          	sw	a4,0(a3)
 118:	f00fe7b7          	lui	a5,0xf00fe
 11c:	200006b7          	lui	a3,0x20000
 120:	0046a683          	lw	a3,4(a3) # 20000004 <gpio_data_2>
 124:	00d78793          	addi	a5,a5,13 # f00fe00d <_stack+0xd00fc00d>
 128:	00f5a023          	sw	a5,0(a1)
 12c:	f00fe7b7          	lui	a5,0xf00fe
 130:	00e62023          	sw	a4,0(a2)
 134:	00c78793          	addi	a5,a5,12 # f00fe00c <_stack+0xd00fc00c>
 138:	00f6a023          	sw	a5,0(a3)
 13c:	00000513          	li	a0,0
 140:	00008067          	ret

Disassembly of section .data:

20000000 <gpio_oe_2>:
20000000:	0014                	.insn	2, 0x0014
20000002:	4000                	.insn	2, 0x4000

20000004 <gpio_data_2>:
20000004:	0010                	.insn	2, 0x0010
20000006:	4000                	.insn	2, 0x4000

20000008 <gpio_data_1>:
20000008:	0008                	.insn	2, 0x0008
2000000a:	4000                	.insn	2, 0x4000

2000000c <gpio_oe_1>:
2000000c:	000c                	.insn	2, 0x000c
2000000e:	4000                	.insn	2, 0x4000

20000010 <gpio_data_0>:
20000010:	0000                	.insn	2, 0x
20000012:	4000                	.insn	2, 0x4000

20000014 <gpio_oe_0>:
20000014:	0004                	.insn	2, 0x0004
20000016:	4000                	.insn	2, 0x4000

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