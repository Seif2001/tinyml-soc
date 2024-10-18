
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
  84:	20050513          	addi	a0,a0,512 # 280 <_sidata>
  88:	20000597          	auipc	a1,0x20000
  8c:	f7858593          	addi	a1,a1,-136 # 20000000 <gpio_oe_2>
  90:	20000617          	auipc	a2,0x20000
  94:	f7860613          	addi	a2,a2,-136 # 20000008 <timer>
  98:	00c5dc63          	bge	a1,a2,b0 <end_init_data>

0000009c <loop_init_data>:
  9c:	00052683          	lw	a3,0(a0)
  a0:	00d5a023          	sw	a3,0(a1)
  a4:	00450513          	addi	a0,a0,4
  a8:	00458593          	addi	a1,a1,4
  ac:	fec5c8e3          	blt	a1,a2,9c <loop_init_data>

000000b0 <end_init_data>:
  b0:	20000517          	auipc	a0,0x20000
  b4:	f5850513          	addi	a0,a0,-168 # 20000008 <timer>
  b8:	81818593          	addi	a1,gp,-2024 # 20000020 <_ebss>
  bc:	00b55863          	bge	a0,a1,cc <end_init_bss>

000000c0 <loop_init_bss>:
  c0:	00052023          	sw	zero,0(a0)
  c4:	00450513          	addi	a0,a0,4
  c8:	feb54ce3          	blt	a0,a1,c0 <loop_init_bss>

000000cc <end_init_bss>:
  cc:	008000ef          	jal	d4 <main>

000000d0 <loopy>:
  d0:	0000006f          	j	d0 <loopy>

000000d4 <main>:
  d4:	200007b7          	lui	a5,0x20000
  d8:	0007a703          	lw	a4,0(a5) # 20000000 <gpio_oe_2>
  dc:	ff010113          	addi	sp,sp,-16
  e0:	100007b7          	lui	a5,0x10000
  e4:	00812423          	sw	s0,8(sp)
  e8:	00912223          	sw	s1,4(sp)
  ec:	00112623          	sw	ra,12(sp)
  f0:	fff78793          	addi	a5,a5,-1 # fffffff <_sidata+0xffffd7f>
  f4:	00f72023          	sw	a5,0(a4)
  f8:	00100413          	li	s0,1
  fc:	200004b7          	lui	s1,0x20000
 100:	0044a783          	lw	a5,4(s1) # 20000004 <gpio_data_2>
 104:	06400513          	li	a0,100
 108:	0087a023          	sw	s0,0(a5)
 10c:	00140413          	addi	s0,s0,1
 110:	0e4000ef          	jal	1f4 <delay>
 114:	fedff06f          	j	100 <main+0x2c>

00000118 <initialize_timer>:
 118:	60000537          	lui	a0,0x60000
 11c:	600005b7          	lui	a1,0x60000
 120:	60000637          	lui	a2,0x60000
 124:	600006b7          	lui	a3,0x60000
 128:	60000737          	lui	a4,0x60000
 12c:	200007b7          	lui	a5,0x20000
 130:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 134:	00450513          	addi	a0,a0,4 # 60000004 <_stack+0x3fffe004>
 138:	00858593          	addi	a1,a1,8 # 60000008 <_stack+0x3fffe008>
 13c:	00c60613          	addi	a2,a2,12 # 6000000c <_stack+0x3fffe00c>
 140:	00f68693          	addi	a3,a3,15 # 6000000f <_stack+0x3fffe00f>
 144:	01070713          	addi	a4,a4,16 # 60000010 <_stack+0x3fffe010>
 148:	60000837          	lui	a6,0x60000
 14c:	0107a423          	sw	a6,8(a5)
 150:	00a7a223          	sw	a0,4(a5)
 154:	00b7a023          	sw	a1,0(a5)
 158:	00c7a623          	sw	a2,12(a5)
 15c:	00d7a823          	sw	a3,16(a5)
 160:	00e7aa23          	sw	a4,20(a5)
 164:	00008067          	ret

00000168 <_start_timer>:
 168:	ff010113          	addi	sp,sp,-16
 16c:	200007b7          	lui	a5,0x20000
 170:	00a12623          	sw	a0,12(sp)
 174:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 178:	0087a683          	lw	a3,8(a5)
 17c:	00c12603          	lw	a2,12(sp)
 180:	0047a703          	lw	a4,4(a5)
 184:	0007a783          	lw	a5,0(a5)
 188:	00c6a023          	sw	a2,0(a3)
 18c:	00300693          	li	a3,3
 190:	00d72023          	sw	a3,0(a4)
 194:	00100713          	li	a4,1
 198:	00e7a023          	sw	a4,0(a5)
 19c:	01010113          	addi	sp,sp,16
 1a0:	00008067          	ret

000001a4 <start_timer>:
 1a4:	ff010113          	addi	sp,sp,-16
 1a8:	200007b7          	lui	a5,0x20000
 1ac:	00a12623          	sw	a0,12(sp)
 1b0:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 1b4:	00c12583          	lw	a1,12(sp)
 1b8:	0087a683          	lw	a3,8(a5)
 1bc:	0047a703          	lw	a4,4(a5)
 1c0:	0007a603          	lw	a2,0(a5)
 1c4:	00b6a023          	sw	a1,0(a3)
 1c8:	00c7a683          	lw	a3,12(a5)
 1cc:	00300593          	li	a1,3
 1d0:	00b72023          	sw	a1,0(a4)
 1d4:	11111737          	lui	a4,0x11111
 1d8:	00100593          	li	a1,1
 1dc:	00b62023          	sw	a1,0(a2)
 1e0:	11170713          	addi	a4,a4,273 # 11111111 <_sidata+0x11110e91>
 1e4:	00e6a023          	sw	a4,0(a3)
 1e8:	0107a503          	lw	a0,16(a5)
 1ec:	01010113          	addi	sp,sp,16
 1f0:	00008067          	ret

000001f4 <delay>:
 1f4:	200007b7          	lui	a5,0x20000
 1f8:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 1fc:	0087a583          	lw	a1,8(a5)
 200:	0047a683          	lw	a3,4(a5)
 204:	ff010113          	addi	sp,sp,-16
 208:	00a12623          	sw	a0,12(sp)
 20c:	0007a603          	lw	a2,0(a5)
 210:	00100713          	li	a4,1
 214:	00e5a023          	sw	a4,0(a1)
 218:	00300593          	li	a1,3
 21c:	00b6a023          	sw	a1,0(a3)
 220:	00e62023          	sw	a4,0(a2)
 224:	00c12703          	lw	a4,12(sp)
 228:	000016b7          	lui	a3,0x1
 22c:	77068693          	addi	a3,a3,1904 # 1770 <_sidata+0x14f0>
 230:	02d70733          	mul	a4,a4,a3
 234:	00c7a583          	lw	a1,12(a5)
 238:	0107a683          	lw	a3,16(a5)
 23c:	00e12623          	sw	a4,12(sp)
 240:	00c12783          	lw	a5,12(sp)
 244:	00f5a023          	sw	a5,0(a1)
 248:	0006a703          	lw	a4,0(a3)
 24c:	00c12783          	lw	a5,12(sp)
 250:	fef71ce3          	bne	a4,a5,248 <delay+0x54>
 254:	00062023          	sw	zero,0(a2)
 258:	01010113          	addi	sp,sp,16
 25c:	00008067          	ret

00000260 <get_timer_counter>:
 260:	8101a503          	lw	a0,-2032(gp) # 20000018 <timer+0x10>
 264:	00008067          	ret

00000268 <end_timer>:
 268:	200007b7          	lui	a5,0x20000
 26c:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 270:	0007a703          	lw	a4,0(a5)
 274:	0107a503          	lw	a0,16(a5)
 278:	00072023          	sw	zero,0(a4)
 27c:	00008067          	ret

Disassembly of section .data:

20000000 <gpio_oe_2>:
20000000:	0004                	.insn	2, 0x0004
20000002:	4200                	.insn	2, 0x4200

20000004 <gpio_data_2>:
20000004:	0000                	.insn	2, 0x
20000006:	4200                	.insn	2, 0x4200

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
