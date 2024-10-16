
blinky_wait.elf:     file format elf32-littleriscv


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
  8c:	f7858593          	addi	a1,a1,-136 # 20000000 <tick_counter>
  90:	20000617          	auipc	a2,0x20000
  94:	f9060613          	addi	a2,a2,-112 # 20000020 <_ebss>
  98:	00c5dc63          	bge	a1,a2,b0 <end_init_data>

0000009c <loop_init_data>:
  9c:	00052683          	lw	a3,0(a0)
  a0:	00d5a023          	sw	a3,0(a1)
  a4:	00450513          	addi	a0,a0,4
  a8:	00458593          	addi	a1,a1,4
  ac:	fec5c8e3          	blt	a1,a2,9c <loop_init_data>

000000b0 <end_init_data>:
  b0:	20000517          	auipc	a0,0x20000
  b4:	f7050513          	addi	a0,a0,-144 # 20000020 <_ebss>
  b8:	20000597          	auipc	a1,0x20000
  bc:	f6858593          	addi	a1,a1,-152 # 20000020 <_ebss>
  c0:	00b55863          	bge	a0,a1,d0 <end_init_bss>

000000c4 <loop_init_bss>:
  c4:	00052023          	sw	zero,0(a0)
  c8:	00450513          	addi	a0,a0,4
  cc:	feb54ce3          	blt	a0,a1,c4 <loop_init_bss>

000000d0 <end_init_bss>:
  d0:	06c000ef          	jal	13c <main>

000000d4 <loopy>:
  d4:	0000006f          	j	d4 <loopy>

000000d8 <timer_init>:
  d8:	00008067          	ret

000000dc <delay>:
  dc:	000017b7          	lui	a5,0x1
  e0:	77078793          	addi	a5,a5,1904 # 1770 <_sidata+0x15a0>
  e4:	02f50533          	mul	a0,a0,a5
  e8:	200007b7          	lui	a5,0x20000
  ec:	00c7a783          	lw	a5,12(a5) # 2000000c <ps_counter>
  f0:	20000737          	lui	a4,0x20000
  f4:	01072703          	lw	a4,16(a4) # 20000010 <cfg_counter>
  f8:	00900613          	li	a2,9
  fc:	200006b7          	lui	a3,0x20000
 100:	0146a683          	lw	a3,20(a3) # 20000014 <ctrl_counter>
 104:	00c7a023          	sw	a2,0(a5)
 108:	200007b7          	lui	a5,0x20000
 10c:	0087a783          	lw	a5,8(a5) # 20000008 <load_counter>
 110:	00300613          	li	a2,3
 114:	00c72023          	sw	a2,0(a4)
 118:	20000737          	lui	a4,0x20000
 11c:	00100613          	li	a2,1
 120:	00472703          	lw	a4,4(a4) # 20000004 <timer_counter>
 124:	00c6a023          	sw	a2,0(a3)
 128:	00a7a023          	sw	a0,0(a5)
 12c:	00072783          	lw	a5,0(a4)
 130:	fea79ee3          	bne	a5,a0,12c <delay+0x50>
 134:	0006a023          	sw	zero,0(a3)
 138:	00008067          	ret

0000013c <main>:
 13c:	200007b7          	lui	a5,0x20000
 140:	0187a703          	lw	a4,24(a5) # 20000018 <gpio_oe_2>
 144:	200007b7          	lui	a5,0x20000
 148:	0047a683          	lw	a3,4(a5) # 20000004 <timer_counter>
 14c:	100007b7          	lui	a5,0x10000
 150:	fff78793          	addi	a5,a5,-1 # fffffff <_sidata+0xffffe2f>
 154:	00f72023          	sw	a5,0(a4)
 158:	20000737          	lui	a4,0x20000
 15c:	00c72f83          	lw	t6,12(a4) # 2000000c <ps_counter>
 160:	200007b7          	lui	a5,0x20000
 164:	20000737          	lui	a4,0x20000
 168:	01c7a503          	lw	a0,28(a5) # 2000001c <gpio_data_2>
 16c:	01072f03          	lw	t5,16(a4) # 20000010 <cfg_counter>
 170:	0006a783          	lw	a5,0(a3)
 174:	20000737          	lui	a4,0x20000
 178:	01472583          	lw	a1,20(a4) # 20000014 <ctrl_counter>
 17c:	20000737          	lui	a4,0x20000
 180:	00872e83          	lw	t4,8(a4) # 20000008 <load_counter>
 184:	00092737          	lui	a4,0x92
 188:	00f52023          	sw	a5,0(a0)
 18c:	00100613          	li	a2,1
 190:	00700e13          	li	t3,7
 194:	00900313          	li	t1,9
 198:	00300893          	li	a7,3
 19c:	00100813          	li	a6,1
 1a0:	7c070713          	addi	a4,a4,1984 # 927c0 <_sidata+0x925f0>
 1a4:	00160793          	addi	a5,a2,1
 1a8:	00c52023          	sw	a2,0(a0)
 1ac:	03c7f633          	remu	a2,a5,t3
 1b0:	006fa023          	sw	t1,0(t6)
 1b4:	011f2023          	sw	a7,0(t5)
 1b8:	0105a023          	sw	a6,0(a1)
 1bc:	00eea023          	sw	a4,0(t4)
 1c0:	0006a783          	lw	a5,0(a3)
 1c4:	fee79ee3          	bne	a5,a4,1c0 <main+0x84>
 1c8:	0005a023          	sw	zero,0(a1)
 1cc:	fd9ff06f          	j	1a4 <main+0x68>

Disassembly of section .data:

20000000 <tick_counter>:
20000000:	0010                	.insn	2, 0x0010
20000002:	6000                	.insn	2, 0x6000

20000004 <timer_counter>:
20000004:	6000000f          	.insn	4, 0x6000000f

20000008 <load_counter>:
20000008:	000c                	.insn	2, 0x000c
2000000a:	6000                	.insn	2, 0x6000

2000000c <ps_counter>:
2000000c:	0008                	.insn	2, 0x0008
2000000e:	6000                	.insn	2, 0x6000

20000010 <cfg_counter>:
20000010:	0004                	.insn	2, 0x0004
20000012:	6000                	.insn	2, 0x6000

20000014 <ctrl_counter>:
20000014:	0000                	.insn	2, 0x
20000016:	6000                	.insn	2, 0x6000

20000018 <gpio_oe_2>:
20000018:	0004                	.insn	2, 0x0004
2000001a:	4200                	.insn	2, 0x4200

2000001c <gpio_data_2>:
2000001c:	0000                	.insn	2, 0x
2000001e:	4200                	.insn	2, 0x4200

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	2941                	.insn	2, 0x2941
   2:	0000                	.insn	2, 0x
   4:	7200                	.insn	2, 0x7200
   6:	7369                	.insn	2, 0x7369
   8:	01007663          	bgeu	zero,a6,14 <start+0x14>
   c:	001f 0000 1004      	.insn	6, 0x10040000001f
  12:	7205                	.insn	2, 0x7205
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	5f31                	.insn	2, 0x5f31
  1c:	326d                	.insn	2, 0x326d
  1e:	3070                	.insn	2, 0x3070
  20:	7a5f 6d6d 6c75      	.insn	6, 0x6c756d6d7a5f
  26:	7031                	.insn	2, 0x7031
  28:	0030                	.insn	2, 0x0030

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
