
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
  84:	16050513          	addi	a0,a0,352 # 1e0 <_sidata>
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
  d0:	08c000ef          	jal	15c <main>

000000d4 <loopy>:
  d4:	0000006f          	j	d4 <loopy>

000000d8 <timer_init>:
  d8:	200007b7          	lui	a5,0x20000
  dc:	0147a783          	lw	a5,20(a5) # 20000014 <ctrl_counter>
  e0:	20000737          	lui	a4,0x20000
  e4:	01072683          	lw	a3,16(a4) # 20000010 <cfg_counter>
  e8:	00100613          	li	a2,1
  ec:	20000737          	lui	a4,0x20000
  f0:	00c72703          	lw	a4,12(a4) # 2000000c <ps_counter>
  f4:	00c7a023          	sw	a2,0(a5)
  f8:	200007b7          	lui	a5,0x20000
  fc:	0087a783          	lw	a5,8(a5) # 20000008 <load_counter>
 100:	00200613          	li	a2,2
 104:	00c6a023          	sw	a2,0(a3)
 108:	00900693          	li	a3,9
 10c:	00d72023          	sw	a3,0(a4)
 110:	0007a023          	sw	zero,0(a5)
 114:	00008067          	ret

00000118 <delay>:
 118:	200007b7          	lui	a5,0x20000
 11c:	0087a703          	lw	a4,8(a5) # 20000008 <load_counter>
 120:	200007b7          	lui	a5,0x20000
 124:	0107a683          	lw	a3,16(a5) # 20000010 <cfg_counter>
 128:	200007b7          	lui	a5,0x20000
 12c:	0147a783          	lw	a5,20(a5) # 20000014 <ctrl_counter>
 130:	00200613          	li	a2,2
 134:	00a72023          	sw	a0,0(a4)
 138:	20000737          	lui	a4,0x20000
 13c:	00072703          	lw	a4,0(a4) # 20000000 <tick_counter>
 140:	00c6a023          	sw	a2,0(a3)
 144:	00100693          	li	a3,1
 148:	00d7a023          	sw	a3,0(a5)
 14c:	00072783          	lw	a5,0(a4)
 150:	0017f793          	andi	a5,a5,1
 154:	fe079ce3          	bnez	a5,14c <delay+0x34>
 158:	00008067          	ret

0000015c <main>:
 15c:	200007b7          	lui	a5,0x20000
 160:	0187a703          	lw	a4,24(a5) # 20000018 <gpio_oe_2>
 164:	ff010113          	addi	sp,sp,-16
 168:	100007b7          	lui	a5,0x10000
 16c:	fff78793          	addi	a5,a5,-1 # fffffff <_sidata+0xffffe1f>
 170:	00112623          	sw	ra,12(sp)
 174:	00f72023          	sw	a5,0(a4)
 178:	f61ff0ef          	jal	d8 <timer_init>
 17c:	200007b7          	lui	a5,0x20000
 180:	01c7a603          	lw	a2,28(a5) # 2000001c <gpio_data_2>
 184:	200007b7          	lui	a5,0x20000
 188:	0087ae03          	lw	t3,8(a5) # 20000008 <load_counter>
 18c:	200007b7          	lui	a5,0x20000
 190:	0107a303          	lw	t1,16(a5) # 20000010 <cfg_counter>
 194:	200007b7          	lui	a5,0x20000
 198:	0147a883          	lw	a7,20(a5) # 20000014 <ctrl_counter>
 19c:	200007b7          	lui	a5,0x20000
 1a0:	0007a703          	lw	a4,0(a5) # 20000000 <tick_counter>
 1a4:	00300793          	li	a5,3
 1a8:	00f62023          	sw	a5,0(a2)
 1ac:	00100693          	li	a3,1
 1b0:	00a00813          	li	a6,10
 1b4:	00200513          	li	a0,2
 1b8:	00100593          	li	a1,1
 1bc:	00d62023          	sw	a3,0(a2)
 1c0:	010e2023          	sw	a6,0(t3)
 1c4:	00a32023          	sw	a0,0(t1)
 1c8:	00168693          	addi	a3,a3,1
 1cc:	00b8a023          	sw	a1,0(a7)
 1d0:	00072783          	lw	a5,0(a4)
 1d4:	0017f793          	andi	a5,a5,1
 1d8:	fe079ce3          	bnez	a5,1d0 <main+0x74>
 1dc:	fe1ff06f          	j	1bc <main+0x60>

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
