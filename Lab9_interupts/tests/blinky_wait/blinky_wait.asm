
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
  84:	30050513          	addi	a0,a0,768 # 380 <_sidata>
  88:	20000597          	auipc	a1,0x20000
  8c:	f7858593          	addi	a1,a1,-136 # 20000000 <gpio_data_2>
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
  d4:	fe010113          	addi	sp,sp,-32
  d8:	00112e23          	sw	ra,28(sp)
  dc:	00812c23          	sw	s0,24(sp)
  e0:	02010413          	addi	s0,sp,32
  e4:	05c000ef          	jal	140 <initialize_timer>
  e8:	200007b7          	lui	a5,0x20000
  ec:	0047a783          	lw	a5,4(a5) # 20000004 <gpio_oe_2>
  f0:	10000737          	lui	a4,0x10000
  f4:	fff70713          	addi	a4,a4,-1 # fffffff <_sidata+0xffffc7f>
  f8:	00e7a023          	sw	a4,0(a5)
  fc:	00100793          	li	a5,1
 100:	fef42623          	sw	a5,-20(s0)
 104:	200007b7          	lui	a5,0x20000
 108:	0007a783          	lw	a5,0(a5) # 20000000 <gpio_data_2>
 10c:	fec42703          	lw	a4,-20(s0)
 110:	00e7a023          	sw	a4,0(a5)
 114:	200007b7          	lui	a5,0x20000
 118:	0007a783          	lw	a5,0(a5) # 20000000 <gpio_data_2>
 11c:	fec42703          	lw	a4,-20(s0)
 120:	00e7a023          	sw	a4,0(a5)
 124:	fec42783          	lw	a5,-20(s0)
 128:	00178793          	addi	a5,a5,1
 12c:	fef42623          	sw	a5,-20(s0)
 130:	06400513          	li	a0,100
 134:	178000ef          	jal	2ac <delay>
 138:	00000013          	nop
 13c:	fd9ff06f          	j	114 <main+0x40>

00000140 <initialize_timer>:
 140:	ff010113          	addi	sp,sp,-16
 144:	00812623          	sw	s0,12(sp)
 148:	01010413          	addi	s0,sp,16
 14c:	200007b7          	lui	a5,0x20000
 150:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 154:	60000737          	lui	a4,0x60000
 158:	00e7a023          	sw	a4,0(a5)
 15c:	200007b7          	lui	a5,0x20000
 160:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 164:	60000737          	lui	a4,0x60000
 168:	00470713          	addi	a4,a4,4 # 60000004 <_stack+0x3fffe004>
 16c:	00e7a223          	sw	a4,4(a5)
 170:	200007b7          	lui	a5,0x20000
 174:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 178:	60000737          	lui	a4,0x60000
 17c:	00870713          	addi	a4,a4,8 # 60000008 <_stack+0x3fffe008>
 180:	00e7a423          	sw	a4,8(a5)
 184:	200007b7          	lui	a5,0x20000
 188:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 18c:	60000737          	lui	a4,0x60000
 190:	00c70713          	addi	a4,a4,12 # 6000000c <_stack+0x3fffe00c>
 194:	00e7a623          	sw	a4,12(a5)
 198:	200007b7          	lui	a5,0x20000
 19c:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 1a0:	60000737          	lui	a4,0x60000
 1a4:	00f70713          	addi	a4,a4,15 # 6000000f <_stack+0x3fffe00f>
 1a8:	00e7a823          	sw	a4,16(a5)
 1ac:	200007b7          	lui	a5,0x20000
 1b0:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 1b4:	60000737          	lui	a4,0x60000
 1b8:	01070713          	addi	a4,a4,16 # 60000010 <_stack+0x3fffe010>
 1bc:	00e7aa23          	sw	a4,20(a5)
 1c0:	00000013          	nop
 1c4:	00c12403          	lw	s0,12(sp)
 1c8:	01010113          	addi	sp,sp,16
 1cc:	00008067          	ret

000001d0 <_start_timer>:
 1d0:	fe010113          	addi	sp,sp,-32
 1d4:	00812e23          	sw	s0,28(sp)
 1d8:	02010413          	addi	s0,sp,32
 1dc:	fea42623          	sw	a0,-20(s0)
 1e0:	200007b7          	lui	a5,0x20000
 1e4:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 1e8:	0087a783          	lw	a5,8(a5)
 1ec:	fec42703          	lw	a4,-20(s0)
 1f0:	00e7a023          	sw	a4,0(a5)
 1f4:	200007b7          	lui	a5,0x20000
 1f8:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 1fc:	0047a783          	lw	a5,4(a5)
 200:	00300713          	li	a4,3
 204:	00e7a023          	sw	a4,0(a5)
 208:	200007b7          	lui	a5,0x20000
 20c:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 210:	0007a783          	lw	a5,0(a5)
 214:	00100713          	li	a4,1
 218:	00e7a023          	sw	a4,0(a5)
 21c:	00000013          	nop
 220:	01c12403          	lw	s0,28(sp)
 224:	02010113          	addi	sp,sp,32
 228:	00008067          	ret

0000022c <start_timer>:
 22c:	fe010113          	addi	sp,sp,-32
 230:	00812e23          	sw	s0,28(sp)
 234:	02010413          	addi	s0,sp,32
 238:	fea42623          	sw	a0,-20(s0)
 23c:	200007b7          	lui	a5,0x20000
 240:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 244:	0087a783          	lw	a5,8(a5)
 248:	fec42703          	lw	a4,-20(s0)
 24c:	00e7a023          	sw	a4,0(a5)
 250:	200007b7          	lui	a5,0x20000
 254:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 258:	0047a783          	lw	a5,4(a5)
 25c:	00300713          	li	a4,3
 260:	00e7a023          	sw	a4,0(a5)
 264:	200007b7          	lui	a5,0x20000
 268:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 26c:	0007a783          	lw	a5,0(a5)
 270:	00100713          	li	a4,1
 274:	00e7a023          	sw	a4,0(a5)
 278:	200007b7          	lui	a5,0x20000
 27c:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 280:	00c7a783          	lw	a5,12(a5)
 284:	11111737          	lui	a4,0x11111
 288:	11170713          	addi	a4,a4,273 # 11111111 <_sidata+0x11110d91>
 28c:	00e7a023          	sw	a4,0(a5)
 290:	200007b7          	lui	a5,0x20000
 294:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 298:	0107a783          	lw	a5,16(a5)
 29c:	00078513          	mv	a0,a5
 2a0:	01c12403          	lw	s0,28(sp)
 2a4:	02010113          	addi	sp,sp,32
 2a8:	00008067          	ret

000002ac <delay>:
 2ac:	fe010113          	addi	sp,sp,-32
 2b0:	00112e23          	sw	ra,28(sp)
 2b4:	00812c23          	sw	s0,24(sp)
 2b8:	02010413          	addi	s0,sp,32
 2bc:	fea42623          	sw	a0,-20(s0)
 2c0:	000017b7          	lui	a5,0x1
 2c4:	76f78513          	addi	a0,a5,1903 # 176f <_sidata+0x13ef>
 2c8:	f09ff0ef          	jal	1d0 <_start_timer>
 2cc:	200007b7          	lui	a5,0x20000
 2d0:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 2d4:	00c7a783          	lw	a5,12(a5)
 2d8:	fec42703          	lw	a4,-20(s0)
 2dc:	00e7a023          	sw	a4,0(a5)
 2e0:	00000013          	nop
 2e4:	200007b7          	lui	a5,0x20000
 2e8:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 2ec:	0107a783          	lw	a5,16(a5)
 2f0:	0007a703          	lw	a4,0(a5)
 2f4:	fec42783          	lw	a5,-20(s0)
 2f8:	fef716e3          	bne	a4,a5,2e4 <delay+0x38>
 2fc:	200007b7          	lui	a5,0x20000
 300:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 304:	0007a783          	lw	a5,0(a5)
 308:	0007a023          	sw	zero,0(a5)
 30c:	00000013          	nop
 310:	01c12083          	lw	ra,28(sp)
 314:	01812403          	lw	s0,24(sp)
 318:	02010113          	addi	sp,sp,32
 31c:	00008067          	ret

00000320 <get_timer_counter>:
 320:	ff010113          	addi	sp,sp,-16
 324:	00812623          	sw	s0,12(sp)
 328:	01010413          	addi	s0,sp,16
 32c:	200007b7          	lui	a5,0x20000
 330:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 334:	0107a783          	lw	a5,16(a5)
 338:	00078513          	mv	a0,a5
 33c:	00c12403          	lw	s0,12(sp)
 340:	01010113          	addi	sp,sp,16
 344:	00008067          	ret

00000348 <end_timer>:
 348:	ff010113          	addi	sp,sp,-16
 34c:	00812623          	sw	s0,12(sp)
 350:	01010413          	addi	s0,sp,16
 354:	200007b7          	lui	a5,0x20000
 358:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 35c:	0007a783          	lw	a5,0(a5)
 360:	0007a023          	sw	zero,0(a5)
 364:	200007b7          	lui	a5,0x20000
 368:	00878793          	addi	a5,a5,8 # 20000008 <timer>
 36c:	0107a783          	lw	a5,16(a5)
 370:	00078513          	mv	a0,a5
 374:	00c12403          	lw	s0,12(sp)
 378:	01010113          	addi	sp,sp,16
 37c:	00008067          	ret

Disassembly of section .data:

20000000 <gpio_data_2>:
20000000:	0000                	.insn	2, 0x
20000002:	4200                	.insn	2, 0x4200

20000004 <gpio_oe_2>:
20000004:	0004                	.insn	2, 0x0004
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
