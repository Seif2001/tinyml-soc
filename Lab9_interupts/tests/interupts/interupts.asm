
interupts.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	4081                	li	ra,0
   2:	20002117          	auipc	sp,0x20002
   6:	ffe10113          	addi	sp,sp,-2 # 20002000 <_stack>
   a:	4181                	li	gp,0
   c:	4201                	li	tp,0
   e:	4281                	li	t0,0
  10:	4301                	li	t1,0
  12:	4381                	li	t2,0
  14:	4401                	li	s0,0
  16:	4481                	li	s1,0
  18:	4501                	li	a0,0
  1a:	4581                	li	a1,0
  1c:	4601                	li	a2,0
  1e:	4681                	li	a3,0
  20:	4701                	li	a4,0
  22:	4781                	li	a5,0
  24:	4801                	li	a6,0
  26:	4881                	li	a7,0
  28:	4901                	li	s2,0
  2a:	4981                	li	s3,0
  2c:	4a01                	li	s4,0
  2e:	4a81                	li	s5,0
  30:	4b01                	li	s6,0
  32:	4b81                	li	s7,0
  34:	4c01                	li	s8,0
  36:	4c81                	li	s9,0
  38:	4d01                	li	s10,0
  3a:	4d81                	li	s11,0
  3c:	4e01                	li	t3,0
  3e:	4e81                	li	t4,0
  40:	4f01                	li	t5,0
  42:	4f81                	li	t6,0
  44:	00000517          	auipc	a0,0x0
  48:	3c050513          	addi	a0,a0,960 # 404 <_sidata>
  4c:	20000597          	auipc	a1,0x20000
  50:	fb458593          	addi	a1,a1,-76 # 20000000 <gpio_data_2>
  54:	20000617          	auipc	a2,0x20000
  58:	fd460613          	addi	a2,a2,-44 # 20000028 <timer>
  5c:	00c5d863          	bge	a1,a2,6c <end_init_data>

00000060 <loop_init_data>:
  60:	4114                	lw	a3,0(a0)
  62:	c194                	sw	a3,0(a1)
  64:	0511                	addi	a0,a0,4
  66:	0591                	addi	a1,a1,4
  68:	fec5cce3          	blt	a1,a2,60 <loop_init_data>

0000006c <end_init_data>:
  6c:	20000517          	auipc	a0,0x20000
  70:	fbc50513          	addi	a0,a0,-68 # 20000028 <timer>
  74:	81818593          	addi	a1,gp,-2024 # 20000040 <_ebss>
  78:	00b55763          	bge	a0,a1,86 <end_init_bss>

0000007c <loop_init_bss>:
  7c:	00052023          	sw	zero,0(a0)
  80:	0511                	addi	a0,a0,4
  82:	feb54de3          	blt	a0,a1,7c <loop_init_bss>

00000086 <end_init_bss>:
  86:	2011                	jal	8a <main>

00000088 <loopy>:
  88:	a001                	j	88 <loopy>

0000008a <main>:
  8a:	1101                	addi	sp,sp,-32
  8c:	ce06                	sw	ra,28(sp)
  8e:	cc22                	sw	s0,24(sp)
  90:	1000                	addi	s0,sp,32
  92:	200007b7          	lui	a5,0x20000
  96:	0087a783          	lw	a5,8(a5) # 20000008 <i2s_en>
  9a:	4725                	li	a4,9
  9c:	c398                	sw	a4,0(a5)
  9e:	200007b7          	lui	a5,0x20000
  a2:	0047a783          	lw	a5,4(a5) # 20000004 <gpio_oe_2>
  a6:	577d                	li	a4,-1
  a8:	c398                	sw	a4,0(a5)
  aa:	4789                	li	a5,2
  ac:	fef42623          	sw	a5,-20(s0)
  b0:	200007b7          	lui	a5,0x20000
  b4:	0007a783          	lw	a5,0(a5) # 20000000 <gpio_data_2>
  b8:	11111737          	lui	a4,0x11111
  bc:	11170713          	addi	a4,a4,273 # 11111111 <_sidata+0x11110d0d>
  c0:	c398                	sw	a4,0(a5)
  c2:	450d                	li	a0,3
  c4:	22fd                	jal	2b2 <uart_init>
  c6:	478d                	li	a5,3
  c8:	fef42223          	sw	a5,-28(s0)
  cc:	fec42703          	lw	a4,-20(s0)
  d0:	fe442783          	lw	a5,-28(s0)
  d4:	97ba                	add	a5,a5,a4
  d6:	fef42023          	sw	a5,-32(s0)
  da:	fe042703          	lw	a4,-32(s0)
  de:	200007b7          	lui	a5,0x20000
  e2:	0007a783          	lw	a5,0(a5) # 20000000 <gpio_data_2>
  e6:	c398                	sw	a4,0(a5)
  e8:	4781                	li	a5,0
  ea:	853e                	mv	a0,a5
  ec:	40f2                	lw	ra,28(sp)
  ee:	4462                	lw	s0,24(sp)
  f0:	6105                	addi	sp,sp,32
  f2:	8082                	ret

000000f4 <initialize_timer>:
  f4:	1141                	addi	sp,sp,-16
  f6:	c622                	sw	s0,12(sp)
  f8:	0800                	addi	s0,sp,16
  fa:	200007b7          	lui	a5,0x20000
  fe:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 102:	60000737          	lui	a4,0x60000
 106:	c398                	sw	a4,0(a5)
 108:	200007b7          	lui	a5,0x20000
 10c:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 110:	60000737          	lui	a4,0x60000
 114:	0711                	addi	a4,a4,4 # 60000004 <_stack+0x3fffe004>
 116:	c3d8                	sw	a4,4(a5)
 118:	200007b7          	lui	a5,0x20000
 11c:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 120:	60000737          	lui	a4,0x60000
 124:	0721                	addi	a4,a4,8 # 60000008 <_stack+0x3fffe008>
 126:	c798                	sw	a4,8(a5)
 128:	200007b7          	lui	a5,0x20000
 12c:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 130:	60000737          	lui	a4,0x60000
 134:	0731                	addi	a4,a4,12 # 6000000c <_stack+0x3fffe00c>
 136:	c7d8                	sw	a4,12(a5)
 138:	200007b7          	lui	a5,0x20000
 13c:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 140:	60000737          	lui	a4,0x60000
 144:	073d                	addi	a4,a4,15 # 6000000f <_stack+0x3fffe00f>
 146:	cb98                	sw	a4,16(a5)
 148:	200007b7          	lui	a5,0x20000
 14c:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 150:	60000737          	lui	a4,0x60000
 154:	0741                	addi	a4,a4,16 # 60000010 <_stack+0x3fffe010>
 156:	cbd8                	sw	a4,20(a5)
 158:	0001                	nop
 15a:	4432                	lw	s0,12(sp)
 15c:	0141                	addi	sp,sp,16
 15e:	8082                	ret

00000160 <_start_timer>:
 160:	1101                	addi	sp,sp,-32
 162:	ce22                	sw	s0,28(sp)
 164:	1000                	addi	s0,sp,32
 166:	fea42623          	sw	a0,-20(s0)
 16a:	200007b7          	lui	a5,0x20000
 16e:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 172:	479c                	lw	a5,8(a5)
 174:	fec42703          	lw	a4,-20(s0)
 178:	c398                	sw	a4,0(a5)
 17a:	200007b7          	lui	a5,0x20000
 17e:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 182:	43dc                	lw	a5,4(a5)
 184:	470d                	li	a4,3
 186:	c398                	sw	a4,0(a5)
 188:	200007b7          	lui	a5,0x20000
 18c:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 190:	439c                	lw	a5,0(a5)
 192:	4705                	li	a4,1
 194:	c398                	sw	a4,0(a5)
 196:	0001                	nop
 198:	4472                	lw	s0,28(sp)
 19a:	6105                	addi	sp,sp,32
 19c:	8082                	ret

0000019e <start_timer>:
 19e:	1101                	addi	sp,sp,-32
 1a0:	ce22                	sw	s0,28(sp)
 1a2:	1000                	addi	s0,sp,32
 1a4:	fea42623          	sw	a0,-20(s0)
 1a8:	feb42423          	sw	a1,-24(s0)
 1ac:	200007b7          	lui	a5,0x20000
 1b0:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 1b4:	479c                	lw	a5,8(a5)
 1b6:	fe842703          	lw	a4,-24(s0)
 1ba:	c398                	sw	a4,0(a5)
 1bc:	200007b7          	lui	a5,0x20000
 1c0:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 1c4:	43dc                	lw	a5,4(a5)
 1c6:	470d                	li	a4,3
 1c8:	c398                	sw	a4,0(a5)
 1ca:	200007b7          	lui	a5,0x20000
 1ce:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 1d2:	439c                	lw	a5,0(a5)
 1d4:	4705                	li	a4,1
 1d6:	c398                	sw	a4,0(a5)
 1d8:	200007b7          	lui	a5,0x20000
 1dc:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 1e0:	47dc                	lw	a5,12(a5)
 1e2:	11111737          	lui	a4,0x11111
 1e6:	11170713          	addi	a4,a4,273 # 11111111 <_sidata+0x11110d0d>
 1ea:	c398                	sw	a4,0(a5)
 1ec:	fec42783          	lw	a5,-20(s0)
 1f0:	20000737          	lui	a4,0x20000
 1f4:	02870713          	addi	a4,a4,40 # 20000028 <timer>
 1f8:	00072803          	lw	a6,0(a4)
 1fc:	4348                	lw	a0,4(a4)
 1fe:	470c                	lw	a1,8(a4)
 200:	4750                	lw	a2,12(a4)
 202:	4b14                	lw	a3,16(a4)
 204:	4b58                	lw	a4,20(a4)
 206:	0107a023          	sw	a6,0(a5)
 20a:	c3c8                	sw	a0,4(a5)
 20c:	c78c                	sw	a1,8(a5)
 20e:	c7d0                	sw	a2,12(a5)
 210:	cb94                	sw	a3,16(a5)
 212:	cbd8                	sw	a4,20(a5)
 214:	fec42503          	lw	a0,-20(s0)
 218:	4472                	lw	s0,28(sp)
 21a:	6105                	addi	sp,sp,32
 21c:	8082                	ret

0000021e <delay>:
 21e:	1101                	addi	sp,sp,-32
 220:	ce06                	sw	ra,28(sp)
 222:	cc22                	sw	s0,24(sp)
 224:	1000                	addi	s0,sp,32
 226:	fea42623          	sw	a0,-20(s0)
 22a:	6785                	lui	a5,0x1
 22c:	76f78513          	addi	a0,a5,1903 # 176f <_sidata+0x136b>
 230:	3f05                	jal	160 <_start_timer>
 232:	200007b7          	lui	a5,0x20000
 236:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 23a:	47dc                	lw	a5,12(a5)
 23c:	fec42703          	lw	a4,-20(s0)
 240:	c398                	sw	a4,0(a5)
 242:	0001                	nop
 244:	200007b7          	lui	a5,0x20000
 248:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 24c:	4b9c                	lw	a5,16(a5)
 24e:	4398                	lw	a4,0(a5)
 250:	fec42783          	lw	a5,-20(s0)
 254:	fef718e3          	bne	a4,a5,244 <delay+0x26>
 258:	200007b7          	lui	a5,0x20000
 25c:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 260:	439c                	lw	a5,0(a5)
 262:	0007a023          	sw	zero,0(a5)
 266:	0001                	nop
 268:	40f2                	lw	ra,28(sp)
 26a:	4462                	lw	s0,24(sp)
 26c:	6105                	addi	sp,sp,32
 26e:	8082                	ret

00000270 <get_timer_counter>:
 270:	1141                	addi	sp,sp,-16
 272:	c622                	sw	s0,12(sp)
 274:	0800                	addi	s0,sp,16
 276:	200007b7          	lui	a5,0x20000
 27a:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 27e:	4b9c                	lw	a5,16(a5)
 280:	439c                	lw	a5,0(a5)
 282:	853e                	mv	a0,a5
 284:	4432                	lw	s0,12(sp)
 286:	0141                	addi	sp,sp,16
 288:	8082                	ret

0000028a <end_timer>:
 28a:	1141                	addi	sp,sp,-16
 28c:	c622                	sw	s0,12(sp)
 28e:	0800                	addi	s0,sp,16
 290:	200007b7          	lui	a5,0x20000
 294:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 298:	439c                	lw	a5,0(a5)
 29a:	0007a023          	sw	zero,0(a5)
 29e:	200007b7          	lui	a5,0x20000
 2a2:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 2a6:	4b9c                	lw	a5,16(a5)
 2a8:	439c                	lw	a5,0(a5)
 2aa:	853e                	mv	a0,a5
 2ac:	4432                	lw	s0,12(sp)
 2ae:	0141                	addi	sp,sp,16
 2b0:	8082                	ret

000002b2 <uart_init>:
 2b2:	1101                	addi	sp,sp,-32
 2b4:	ce22                	sw	s0,28(sp)
 2b6:	1000                	addi	s0,sp,32
 2b8:	fea42623          	sw	a0,-20(s0)
 2bc:	200007b7          	lui	a5,0x20000
 2c0:	01c7a783          	lw	a5,28(a5) # 2000001c <uart_bauddiv>
 2c4:	fec42703          	lw	a4,-20(s0)
 2c8:	c398                	sw	a4,0(a5)
 2ca:	200007b7          	lui	a5,0x20000
 2ce:	0187a783          	lw	a5,24(a5) # 20000018 <uart_ctrl>
 2d2:	4705                	li	a4,1
 2d4:	c398                	sw	a4,0(a5)
 2d6:	0001                	nop
 2d8:	4472                	lw	s0,28(sp)
 2da:	6105                	addi	sp,sp,32
 2dc:	8082                	ret

000002de <uart_putc>:
 2de:	1101                	addi	sp,sp,-32
 2e0:	ce22                	sw	s0,28(sp)
 2e2:	1000                	addi	s0,sp,32
 2e4:	87aa                	mv	a5,a0
 2e6:	fef407a3          	sb	a5,-17(s0)
 2ea:	0001                	nop
 2ec:	200007b7          	lui	a5,0x20000
 2f0:	0207a783          	lw	a5,32(a5) # 20000020 <uart_status>
 2f4:	439c                	lw	a5,0(a5)
 2f6:	dbfd                	beqz	a5,2ec <uart_putc+0xe>
 2f8:	200007b7          	lui	a5,0x20000
 2fc:	0247a783          	lw	a5,36(a5) # 20000024 <uart_data>
 300:	fef44703          	lbu	a4,-17(s0)
 304:	c398                	sw	a4,0(a5)
 306:	200007b7          	lui	a5,0x20000
 30a:	0187a783          	lw	a5,24(a5) # 20000018 <uart_ctrl>
 30e:	4398                	lw	a4,0(a5)
 310:	200007b7          	lui	a5,0x20000
 314:	0187a783          	lw	a5,24(a5) # 20000018 <uart_ctrl>
 318:	00276713          	ori	a4,a4,2
 31c:	c398                	sw	a4,0(a5)
 31e:	0001                	nop
 320:	4472                	lw	s0,28(sp)
 322:	6105                	addi	sp,sp,32
 324:	8082                	ret

00000326 <uart_puts>:
 326:	7179                	addi	sp,sp,-48
 328:	d606                	sw	ra,44(sp)
 32a:	d422                	sw	s0,40(sp)
 32c:	1800                	addi	s0,sp,48
 32e:	fca42e23          	sw	a0,-36(s0)
 332:	fe042623          	sw	zero,-20(s0)
 336:	a839                	j	354 <uart_puts+0x2e>
 338:	fec42783          	lw	a5,-20(s0)
 33c:	fdc42703          	lw	a4,-36(s0)
 340:	97ba                	add	a5,a5,a4
 342:	0007c783          	lbu	a5,0(a5)
 346:	853e                	mv	a0,a5
 348:	3f59                	jal	2de <uart_putc>
 34a:	fec42783          	lw	a5,-20(s0)
 34e:	0785                	addi	a5,a5,1
 350:	fef42623          	sw	a5,-20(s0)
 354:	fec42783          	lw	a5,-20(s0)
 358:	fdc42703          	lw	a4,-36(s0)
 35c:	97ba                	add	a5,a5,a4
 35e:	0007c783          	lbu	a5,0(a5)
 362:	fbf9                	bnez	a5,338 <uart_puts+0x12>
 364:	0001                	nop
 366:	0001                	nop
 368:	50b2                	lw	ra,44(sp)
 36a:	5422                	lw	s0,40(sp)
 36c:	6145                	addi	sp,sp,48
 36e:	8082                	ret

00000370 <uart_puti8>:
 370:	1101                	addi	sp,sp,-32
 372:	ce22                	sw	s0,28(sp)
 374:	1000                	addi	s0,sp,32
 376:	87aa                	mv	a5,a0
 378:	fef407a3          	sb	a5,-17(s0)
 37c:	0001                	nop
 37e:	200007b7          	lui	a5,0x20000
 382:	0207a783          	lw	a5,32(a5) # 20000020 <uart_status>
 386:	439c                	lw	a5,0(a5)
 388:	dbfd                	beqz	a5,37e <uart_puti8+0xe>
 38a:	200007b7          	lui	a5,0x20000
 38e:	0247a783          	lw	a5,36(a5) # 20000024 <uart_data>
 392:	fef44703          	lbu	a4,-17(s0)
 396:	c398                	sw	a4,0(a5)
 398:	200007b7          	lui	a5,0x20000
 39c:	0187a783          	lw	a5,24(a5) # 20000018 <uart_ctrl>
 3a0:	4398                	lw	a4,0(a5)
 3a2:	200007b7          	lui	a5,0x20000
 3a6:	0187a783          	lw	a5,24(a5) # 20000018 <uart_ctrl>
 3aa:	00276713          	ori	a4,a4,2
 3ae:	c398                	sw	a4,0(a5)
 3b0:	0001                	nop
 3b2:	4472                	lw	s0,28(sp)
 3b4:	6105                	addi	sp,sp,32
 3b6:	8082                	ret

000003b8 <uart_puti>:
 3b8:	7179                	addi	sp,sp,-48
 3ba:	d606                	sw	ra,44(sp)
 3bc:	d422                	sw	s0,40(sp)
 3be:	1800                	addi	s0,sp,48
 3c0:	fca42e23          	sw	a0,-36(s0)
 3c4:	fe042623          	sw	zero,-20(s0)
 3c8:	a01d                	j	3ee <uart_puti+0x36>
 3ca:	fec42783          	lw	a5,-20(s0)
 3ce:	078e                	slli	a5,a5,0x3
 3d0:	fdc42703          	lw	a4,-36(s0)
 3d4:	40f757b3          	sra	a5,a4,a5
 3d8:	fef405a3          	sb	a5,-21(s0)
 3dc:	feb44783          	lbu	a5,-21(s0)
 3e0:	853e                	mv	a0,a5
 3e2:	3779                	jal	370 <uart_puti8>
 3e4:	fec42783          	lw	a5,-20(s0)
 3e8:	0785                	addi	a5,a5,1
 3ea:	fef42623          	sw	a5,-20(s0)
 3ee:	fec42703          	lw	a4,-20(s0)
 3f2:	478d                	li	a5,3
 3f4:	fce7dbe3          	bge	a5,a4,3ca <uart_puti+0x12>
 3f8:	0001                	nop
 3fa:	0001                	nop
 3fc:	50b2                	lw	ra,44(sp)
 3fe:	5422                	lw	s0,40(sp)
 400:	6145                	addi	sp,sp,48
 402:	8082                	ret

Disassembly of section .data:

20000000 <gpio_data_2>:
20000000:	0000                	unimp
20000002:	4200                	lw	s0,0(a2)

20000004 <gpio_oe_2>:
20000004:	0004                	.insn	2, 0x0004
20000006:	4200                	lw	s0,0(a2)

20000008 <i2s_en>:
20000008:	0000                	unimp
2000000a:	8000                	.insn	2, 0x8000

2000000c <i2s_data>:
2000000c:	0008                	.insn	2, 0x0008
2000000e:	8000                	.insn	2, 0x8000

20000010 <i2s_done>:
20000010:	0004                	.insn	2, 0x0004
20000012:	8000                	.insn	2, 0x8000

20000014 <i2s_status>:
20000014:	000c                	.insn	2, 0x000c
20000016:	8000                	.insn	2, 0x8000

20000018 <uart_ctrl>:
20000018:	0000                	unimp
2000001a:	5000                	lw	s0,32(s0)

2000001c <uart_bauddiv>:
2000001c:	0004                	.insn	2, 0x0004
2000001e:	5000                	lw	s0,32(s0)

20000020 <uart_status>:
20000020:	0008                	.insn	2, 0x0008
20000022:	5000                	lw	s0,32(s0)

20000024 <uart_data>:
20000024:	000c                	.insn	2, 0x000c
20000026:	5000                	lw	s0,32(s0)

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	4f41                	li	t5,16
   2:	0000                	unimp
   4:	7200                	.insn	2, 0x7200
   6:	7369                	lui	t1,0xffffa
   8:	01007663          	bgeu	zero,a6,14 <start+0x14>
   c:	0045                	c.nop	17
   e:	0000                	unimp
  10:	1004                	addi	s1,sp,32
  12:	7205                	lui	tp,0xfffe1
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	5f31                	li	t5,-20
  1c:	326d                	jal	fffff9c6 <_stack+0xdfffd9c6>
  1e:	3070                	.insn	2, 0x3070
  20:	615f 7032 5f31      	.insn	6, 0x5f317032615f
  26:	30703263          	.insn	4, 0x30703263
  2a:	7a5f 6369 7273      	.insn	6, 0x727363697a5f
  30:	7032                	.insn	2, 0x7032
  32:	5f30                	lw	a2,120(a4)
  34:	6d7a                	.insn	2, 0x6d7a
  36:	756d                	lui	a0,0xffffb
  38:	316c                	.insn	2, 0x316c
  3a:	3070                	.insn	2, 0x3070
  3c:	7a5f 6161 6f6d      	.insn	6, 0x6f6d61617a5f
  42:	7031                	c.lui	zero,0xfffec
  44:	5f30                	lw	a2,120(a4)
  46:	617a                	.insn	2, 0x617a
  48:	726c                	.insn	2, 0x726c
  4a:	70316373          	csrrsi	t1,0x703,2
  4e:	0030                	addi	a2,sp,8

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	.insn	4, 0x3a434347
   4:	2820                	.insn	2, 0x2820
   6:	39386367          	.insn	4, 0x39386367
   a:	6431                	lui	s0,0xc
   c:	6438                	.insn	2, 0x6438
   e:	65333263          	.insn	4, 0x65333263
  12:	2029                	jal	1c <start+0x1c>
  14:	3331                	jal	fffffd20 <_stack+0xdfffdd20>
  16:	322e                	.insn	2, 0x322e
  18:	302e                	.insn	2, 0x302e
	...
