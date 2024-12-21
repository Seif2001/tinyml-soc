
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
  48:	57c50513          	addi	a0,a0,1404 # 5c0 <_sidata>
  4c:	20000597          	auipc	a1,0x20000
  50:	fb458593          	addi	a1,a1,-76 # 20000000 <gpio_data_2>
  54:	20000617          	auipc	a2,0x20000
  58:	ff460613          	addi	a2,a2,-12 # 20000048 <data>
  5c:	00c5d863          	bge	a1,a2,6c <end_init_data>

00000060 <loop_init_data>:
  60:	4114                	lw	a3,0(a0)
  62:	c194                	sw	a3,0(a1)
  64:	0511                	addi	a0,a0,4
  66:	0591                	addi	a1,a1,4
  68:	fec5cce3          	blt	a1,a2,60 <loop_init_data>

0000006c <end_init_data>:
  6c:	20000517          	auipc	a0,0x20000
  70:	fdc50513          	addi	a0,a0,-36 # 20000048 <data>
  74:	85c18593          	addi	a1,gp,-1956 # 200000a4 <_ebss>
  78:	00b55763          	bge	a0,a1,86 <end_init_bss>

0000007c <loop_init_bss>:
  7c:	00052023          	sw	zero,0(a0)
  80:	0511                	addi	a0,a0,4
  82:	feb54de3          	blt	a0,a1,7c <loop_init_bss>

00000086 <end_init_bss>:
  86:	2c21                	jal	29e <main>

00000088 <loopy>:
  88:	a001                	j	88 <loopy>

0000008a <read_from_dest_addr>:
  8a:	1101                	addi	sp,sp,-32
  8c:	ce06                	sw	ra,28(sp)
  8e:	cc22                	sw	s0,24(sp)
  90:	1000                	addi	s0,sp,32
  92:	fe042623          	sw	zero,-20(s0)
  96:	a0b5                	j	102 <read_from_dest_addr+0x78>
  98:	200007b7          	lui	a5,0x20000
  9c:	01c7a783          	lw	a5,28(a5) # 2000001c <dma_daddr>
  a0:	4398                	lw	a4,0(a5)
  a2:	fec42783          	lw	a5,-20(s0)
  a6:	078a                	slli	a5,a5,0x2
  a8:	97ba                	add	a5,a5,a4
  aa:	439c                	lw	a5,0(a5)
  ac:	fef42423          	sw	a5,-24(s0)
  b0:	fe842783          	lw	a5,-24(s0)
  b4:	87e1                	srai	a5,a5,0x18
  b6:	0ff7f793          	zext.b	a5,a5
  ba:	fef403a3          	sb	a5,-25(s0)
  be:	fe842783          	lw	a5,-24(s0)
  c2:	87c1                	srai	a5,a5,0x10
  c4:	0ff7f793          	zext.b	a5,a5
  c8:	fef40323          	sb	a5,-26(s0)
  cc:	fe744783          	lbu	a5,-25(s0)
  d0:	0ff7f793          	zext.b	a5,a5
  d4:	853e                	mv	a0,a5
  d6:	26d1                	jal	49a <uart_putc>
  d8:	fe644783          	lbu	a5,-26(s0)
  dc:	0ff7f793          	zext.b	a5,a5
  e0:	853e                	mv	a0,a5
  e2:	2e65                	jal	49a <uart_putc>
  e4:	200007b7          	lui	a5,0x20000
  e8:	01c7a703          	lw	a4,28(a5) # 2000001c <dma_daddr>
  ec:	200007b7          	lui	a5,0x20000
  f0:	0007a783          	lw	a5,0(a5) # 20000000 <gpio_data_2>
  f4:	4318                	lw	a4,0(a4)
  f6:	c398                	sw	a4,0(a5)
  f8:	fec42783          	lw	a5,-20(s0)
  fc:	0785                	addi	a5,a5,1
  fe:	fef42623          	sw	a5,-20(s0)
 102:	fec42703          	lw	a4,-20(s0)
 106:	47bd                	li	a5,15
 108:	f8e7d8e3          	bge	a5,a4,98 <read_from_dest_addr+0xe>
 10c:	0001                	nop
 10e:	0001                	nop
 110:	40f2                	lw	ra,28(sp)
 112:	4462                	lw	s0,24(sp)
 114:	6105                	addi	sp,sp,32
 116:	8082                	ret

00000118 <init_dma>:
 118:	1141                	addi	sp,sp,-16
 11a:	c622                	sw	s0,12(sp)
 11c:	0800                	addi	s0,sp,16
 11e:	200007b7          	lui	a5,0x20000
 122:	0187a783          	lw	a5,24(a5) # 20000018 <dma_saddr>
 126:	80000737          	lui	a4,0x80000
 12a:	0721                	addi	a4,a4,8 # 80000008 <_stack+0x5fffe008>
 12c:	c398                	sw	a4,0(a5)
 12e:	200007b7          	lui	a5,0x20000
 132:	01c7a783          	lw	a5,28(a5) # 2000001c <dma_daddr>
 136:	20000737          	lui	a4,0x20000
 13a:	04870713          	addi	a4,a4,72 # 20000048 <data>
 13e:	c398                	sw	a4,0(a5)
 140:	200007b7          	lui	a5,0x20000
 144:	0247a783          	lw	a5,36(a5) # 20000024 <dma_src_config>
 148:	4709                	li	a4,2
 14a:	c398                	sw	a4,0(a5)
 14c:	200007b7          	lui	a5,0x20000
 150:	0287a783          	lw	a5,40(a5) # 20000028 <dma_dst_config>
 154:	04200713          	li	a4,66
 158:	c398                	sw	a4,0(a5)
 15a:	200007b7          	lui	a5,0x20000
 15e:	02c7a783          	lw	a5,44(a5) # 2000002c <irq_config>
 162:	4705                	li	a4,1
 164:	c398                	sw	a4,0(a5)
 166:	200007b7          	lui	a5,0x20000
 16a:	0307a783          	lw	a5,48(a5) # 20000030 <block_count>
 16e:	4705                	li	a4,1
 170:	c398                	sw	a4,0(a5)
 172:	200007b7          	lui	a5,0x20000
 176:	0347a783          	lw	a5,52(a5) # 20000034 <block_size>
 17a:	473d                	li	a4,15
 17c:	c398                	sw	a4,0(a5)
 17e:	200007b7          	lui	a5,0x20000
 182:	0207a783          	lw	a5,32(a5) # 20000020 <dma_start>
 186:	4705                	li	a4,1
 188:	c398                	sw	a4,0(a5)
 18a:	0001                	nop
 18c:	4432                	lw	s0,12(sp)
 18e:	0141                	addi	sp,sp,16
 190:	8082                	ret

00000192 <init_i2s>:
 192:	1141                	addi	sp,sp,-16
 194:	c622                	sw	s0,12(sp)
 196:	0800                	addi	s0,sp,16
 198:	200007b7          	lui	a5,0x20000
 19c:	0087a783          	lw	a5,8(a5) # 20000008 <i2s_en>
 1a0:	4705                	li	a4,1
 1a2:	c398                	sw	a4,0(a5)
 1a4:	0001                	nop
 1a6:	4432                	lw	s0,12(sp)
 1a8:	0141                	addi	sp,sp,16
 1aa:	8082                	ret

000001ac <isFIFOEmpty>:
 1ac:	1141                	addi	sp,sp,-16
 1ae:	c622                	sw	s0,12(sp)
 1b0:	0800                	addi	s0,sp,16
 1b2:	200007b7          	lui	a5,0x20000
 1b6:	0147a783          	lw	a5,20(a5) # 20000014 <i2s_status>
 1ba:	439c                	lw	a5,0(a5)
 1bc:	17fd                	addi	a5,a5,-1
 1be:	0017b793          	seqz	a5,a5
 1c2:	0ff7f793          	zext.b	a5,a5
 1c6:	853e                	mv	a0,a5
 1c8:	4432                	lw	s0,12(sp)
 1ca:	0141                	addi	sp,sp,16
 1cc:	8082                	ret

000001ce <mret>:
 1ce:	1141                	addi	sp,sp,-16
 1d0:	c622                	sw	s0,12(sp)
 1d2:	0800                	addi	s0,sp,16
 1d4:	30200073          	mret
 1d8:	0001                	nop
 1da:	4432                	lw	s0,12(sp)
 1dc:	0141                	addi	sp,sp,16
 1de:	8082                	ret

000001e0 <isr>:
 1e0:	711d                	addi	sp,sp,-96
 1e2:	ce86                	sw	ra,92(sp)
 1e4:	cc96                	sw	t0,88(sp)
 1e6:	ca9a                	sw	t1,84(sp)
 1e8:	c89e                	sw	t2,80(sp)
 1ea:	c6a2                	sw	s0,76(sp)
 1ec:	c4aa                	sw	a0,72(sp)
 1ee:	c2ae                	sw	a1,68(sp)
 1f0:	c0b2                	sw	a2,64(sp)
 1f2:	de36                	sw	a3,60(sp)
 1f4:	dc3a                	sw	a4,56(sp)
 1f6:	da3e                	sw	a5,52(sp)
 1f8:	d842                	sw	a6,48(sp)
 1fa:	d646                	sw	a7,44(sp)
 1fc:	d472                	sw	t3,40(sp)
 1fe:	d276                	sw	t4,36(sp)
 200:	d07a                	sw	t5,32(sp)
 202:	ce7e                	sw	t6,28(sp)
 204:	1080                	addi	s0,sp,96
 206:	4789                	li	a5,2
 208:	faf42623          	sw	a5,-84(s0)
 20c:	478d                	li	a5,3
 20e:	faf42423          	sw	a5,-88(s0)
 212:	fac42703          	lw	a4,-84(s0)
 216:	fa842783          	lw	a5,-88(s0)
 21a:	97ba                	add	a5,a5,a4
 21c:	faf42223          	sw	a5,-92(s0)
 220:	fa442703          	lw	a4,-92(s0)
 224:	200007b7          	lui	a5,0x20000
 228:	0007a783          	lw	a5,0(a5) # 20000000 <gpio_data_2>
 22c:	c398                	sw	a4,0(a5)
 22e:	35ed                	jal	118 <init_dma>
 230:	06100513          	li	a0,97
 234:	249d                	jal	49a <uart_putc>
 236:	3d91                	jal	8a <read_from_dest_addr>
 238:	4705                	li	a4,1
 23a:	84e1ac23          	sw	a4,-1960(gp) # 200000a0 <flag>
 23e:	3f41                	jal	1ce <mret>
 240:	06200513          	li	a0,98
 244:	2c99                	jal	49a <uart_putc>
 246:	0001                	nop
 248:	40f6                	lw	ra,92(sp)
 24a:	42e6                	lw	t0,88(sp)
 24c:	4356                	lw	t1,84(sp)
 24e:	43c6                	lw	t2,80(sp)
 250:	4436                	lw	s0,76(sp)
 252:	4526                	lw	a0,72(sp)
 254:	4596                	lw	a1,68(sp)
 256:	4606                	lw	a2,64(sp)
 258:	56f2                	lw	a3,60(sp)
 25a:	5762                	lw	a4,56(sp)
 25c:	57d2                	lw	a5,52(sp)
 25e:	5842                	lw	a6,48(sp)
 260:	58b2                	lw	a7,44(sp)
 262:	5e22                	lw	t3,40(sp)
 264:	5e92                	lw	t4,36(sp)
 266:	5f02                	lw	t5,32(sp)
 268:	4ff2                	lw	t6,28(sp)
 26a:	6125                	addi	sp,sp,96
 26c:	30200073          	mret

00000270 <setup_mtvec>:
 270:	7179                	addi	sp,sp,-48
 272:	d622                	sw	s0,44(sp)
 274:	1800                	addi	s0,sp,48
 276:	fca42e23          	sw	a0,-36(s0)
 27a:	fcb42c23          	sw	a1,-40(s0)
 27e:	fdc42783          	lw	a5,-36(s0)
 282:	fef42623          	sw	a5,-20(s0)
 286:	fec42783          	lw	a5,-20(s0)
 28a:	30579073          	csrw	mtvec,a5
 28e:	30046073          	csrsi	mstatus,8
 292:	30446073          	csrsi	mie,8
 296:	0001                	nop
 298:	5432                	lw	s0,44(sp)
 29a:	6145                	addi	sp,sp,48
 29c:	8082                	ret

0000029e <main>:
 29e:	1141                	addi	sp,sp,-16
 2a0:	c606                	sw	ra,12(sp)
 2a2:	c422                	sw	s0,8(sp)
 2a4:	0800                	addi	s0,sp,16
 2a6:	4581                	li	a1,0
 2a8:	1e000513          	li	a0,480
 2ac:	37d1                	jal	270 <setup_mtvec>
 2ae:	35ad                	jal	118 <init_dma>
 2b0:	35cd                	jal	192 <init_i2s>
 2b2:	200007b7          	lui	a5,0x20000
 2b6:	0047a783          	lw	a5,4(a5) # 20000004 <gpio_oe_2>
 2ba:	577d                	li	a4,-1
 2bc:	c398                	sw	a4,0(a5)
 2be:	200007b7          	lui	a5,0x20000
 2c2:	0007a783          	lw	a5,0(a5) # 20000000 <gpio_data_2>
 2c6:	11111737          	lui	a4,0x11111
 2ca:	11170713          	addi	a4,a4,273 # 11111111 <_sidata+0x11110b51>
 2ce:	c398                	sw	a4,0(a5)
 2d0:	450d                	li	a0,3
 2d2:	2a71                	jal	46e <uart_init>
 2d4:	8581a703          	lw	a4,-1960(gp) # 200000a0 <flag>
 2d8:	4785                	li	a5,1
 2da:	00f71c63          	bne	a4,a5,2f2 <main+0x54>
 2de:	200007b7          	lui	a5,0x20000
 2e2:	0007a783          	lw	a5,0(a5) # 20000000 <gpio_data_2>
 2e6:	6705                	lui	a4,0x1
 2e8:	177d                	addi	a4,a4,-1 # fff <_sidata+0xa3f>
 2ea:	c398                	sw	a4,0(a5)
 2ec:	8401ac23          	sw	zero,-1960(gp) # 200000a0 <flag>
 2f0:	b7d5                	j	2d4 <main+0x36>
 2f2:	200007b7          	lui	a5,0x20000
 2f6:	0007a783          	lw	a5,0(a5) # 20000000 <gpio_data_2>
 2fa:	4705                	li	a4,1
 2fc:	c398                	sw	a4,0(a5)
 2fe:	bfd9                	j	2d4 <main+0x36>

00000300 <initialize_timer>:
 300:	1141                	addi	sp,sp,-16
 302:	c622                	sw	s0,12(sp)
 304:	0800                	addi	s0,sp,16
 306:	84018793          	addi	a5,gp,-1984 # 20000088 <timer>
 30a:	60000737          	lui	a4,0x60000
 30e:	c398                	sw	a4,0(a5)
 310:	84018793          	addi	a5,gp,-1984 # 20000088 <timer>
 314:	60000737          	lui	a4,0x60000
 318:	0711                	addi	a4,a4,4 # 60000004 <_stack+0x3fffe004>
 31a:	c3d8                	sw	a4,4(a5)
 31c:	84018793          	addi	a5,gp,-1984 # 20000088 <timer>
 320:	60000737          	lui	a4,0x60000
 324:	0721                	addi	a4,a4,8 # 60000008 <_stack+0x3fffe008>
 326:	c798                	sw	a4,8(a5)
 328:	84018793          	addi	a5,gp,-1984 # 20000088 <timer>
 32c:	60000737          	lui	a4,0x60000
 330:	0731                	addi	a4,a4,12 # 6000000c <_stack+0x3fffe00c>
 332:	c7d8                	sw	a4,12(a5)
 334:	84018793          	addi	a5,gp,-1984 # 20000088 <timer>
 338:	60000737          	lui	a4,0x60000
 33c:	073d                	addi	a4,a4,15 # 6000000f <_stack+0x3fffe00f>
 33e:	cb98                	sw	a4,16(a5)
 340:	84018793          	addi	a5,gp,-1984 # 20000088 <timer>
 344:	60000737          	lui	a4,0x60000
 348:	0741                	addi	a4,a4,16 # 60000010 <_stack+0x3fffe010>
 34a:	cbd8                	sw	a4,20(a5)
 34c:	0001                	nop
 34e:	4432                	lw	s0,12(sp)
 350:	0141                	addi	sp,sp,16
 352:	8082                	ret

00000354 <_start_timer>:
 354:	1101                	addi	sp,sp,-32
 356:	ce22                	sw	s0,28(sp)
 358:	1000                	addi	s0,sp,32
 35a:	fea42623          	sw	a0,-20(s0)
 35e:	84018793          	addi	a5,gp,-1984 # 20000088 <timer>
 362:	479c                	lw	a5,8(a5)
 364:	fec42703          	lw	a4,-20(s0)
 368:	c398                	sw	a4,0(a5)
 36a:	84018793          	addi	a5,gp,-1984 # 20000088 <timer>
 36e:	43dc                	lw	a5,4(a5)
 370:	470d                	li	a4,3
 372:	c398                	sw	a4,0(a5)
 374:	84018793          	addi	a5,gp,-1984 # 20000088 <timer>
 378:	439c                	lw	a5,0(a5)
 37a:	4705                	li	a4,1
 37c:	c398                	sw	a4,0(a5)
 37e:	0001                	nop
 380:	4472                	lw	s0,28(sp)
 382:	6105                	addi	sp,sp,32
 384:	8082                	ret

00000386 <start_timer>:
 386:	1101                	addi	sp,sp,-32
 388:	ce22                	sw	s0,28(sp)
 38a:	1000                	addi	s0,sp,32
 38c:	fea42623          	sw	a0,-20(s0)
 390:	feb42423          	sw	a1,-24(s0)
 394:	84018793          	addi	a5,gp,-1984 # 20000088 <timer>
 398:	479c                	lw	a5,8(a5)
 39a:	fe842703          	lw	a4,-24(s0)
 39e:	c398                	sw	a4,0(a5)
 3a0:	84018793          	addi	a5,gp,-1984 # 20000088 <timer>
 3a4:	43dc                	lw	a5,4(a5)
 3a6:	470d                	li	a4,3
 3a8:	c398                	sw	a4,0(a5)
 3aa:	84018793          	addi	a5,gp,-1984 # 20000088 <timer>
 3ae:	439c                	lw	a5,0(a5)
 3b0:	4705                	li	a4,1
 3b2:	c398                	sw	a4,0(a5)
 3b4:	84018793          	addi	a5,gp,-1984 # 20000088 <timer>
 3b8:	47dc                	lw	a5,12(a5)
 3ba:	11111737          	lui	a4,0x11111
 3be:	11170713          	addi	a4,a4,273 # 11111111 <_sidata+0x11110b51>
 3c2:	c398                	sw	a4,0(a5)
 3c4:	fec42783          	lw	a5,-20(s0)
 3c8:	84018713          	addi	a4,gp,-1984 # 20000088 <timer>
 3cc:	00072803          	lw	a6,0(a4)
 3d0:	4348                	lw	a0,4(a4)
 3d2:	470c                	lw	a1,8(a4)
 3d4:	4750                	lw	a2,12(a4)
 3d6:	4b14                	lw	a3,16(a4)
 3d8:	4b58                	lw	a4,20(a4)
 3da:	0107a023          	sw	a6,0(a5)
 3de:	c3c8                	sw	a0,4(a5)
 3e0:	c78c                	sw	a1,8(a5)
 3e2:	c7d0                	sw	a2,12(a5)
 3e4:	cb94                	sw	a3,16(a5)
 3e6:	cbd8                	sw	a4,20(a5)
 3e8:	fec42503          	lw	a0,-20(s0)
 3ec:	4472                	lw	s0,28(sp)
 3ee:	6105                	addi	sp,sp,32
 3f0:	8082                	ret

000003f2 <delay>:
 3f2:	1101                	addi	sp,sp,-32
 3f4:	ce06                	sw	ra,28(sp)
 3f6:	cc22                	sw	s0,24(sp)
 3f8:	1000                	addi	s0,sp,32
 3fa:	fea42623          	sw	a0,-20(s0)
 3fe:	6785                	lui	a5,0x1
 400:	76f78513          	addi	a0,a5,1903 # 176f <_sidata+0x11af>
 404:	3f81                	jal	354 <_start_timer>
 406:	84018793          	addi	a5,gp,-1984 # 20000088 <timer>
 40a:	47dc                	lw	a5,12(a5)
 40c:	fec42703          	lw	a4,-20(s0)
 410:	c398                	sw	a4,0(a5)
 412:	0001                	nop
 414:	84018793          	addi	a5,gp,-1984 # 20000088 <timer>
 418:	4b9c                	lw	a5,16(a5)
 41a:	4398                	lw	a4,0(a5)
 41c:	fec42783          	lw	a5,-20(s0)
 420:	fef71ae3          	bne	a4,a5,414 <delay+0x22>
 424:	84018793          	addi	a5,gp,-1984 # 20000088 <timer>
 428:	439c                	lw	a5,0(a5)
 42a:	0007a023          	sw	zero,0(a5)
 42e:	0001                	nop
 430:	40f2                	lw	ra,28(sp)
 432:	4462                	lw	s0,24(sp)
 434:	6105                	addi	sp,sp,32
 436:	8082                	ret

00000438 <get_timer_counter>:
 438:	1141                	addi	sp,sp,-16
 43a:	c622                	sw	s0,12(sp)
 43c:	0800                	addi	s0,sp,16
 43e:	84018793          	addi	a5,gp,-1984 # 20000088 <timer>
 442:	4b9c                	lw	a5,16(a5)
 444:	439c                	lw	a5,0(a5)
 446:	853e                	mv	a0,a5
 448:	4432                	lw	s0,12(sp)
 44a:	0141                	addi	sp,sp,16
 44c:	8082                	ret

0000044e <end_timer>:
 44e:	1141                	addi	sp,sp,-16
 450:	c622                	sw	s0,12(sp)
 452:	0800                	addi	s0,sp,16
 454:	84018793          	addi	a5,gp,-1984 # 20000088 <timer>
 458:	439c                	lw	a5,0(a5)
 45a:	0007a023          	sw	zero,0(a5)
 45e:	84018793          	addi	a5,gp,-1984 # 20000088 <timer>
 462:	4b9c                	lw	a5,16(a5)
 464:	439c                	lw	a5,0(a5)
 466:	853e                	mv	a0,a5
 468:	4432                	lw	s0,12(sp)
 46a:	0141                	addi	sp,sp,16
 46c:	8082                	ret

0000046e <uart_init>:
 46e:	1101                	addi	sp,sp,-32
 470:	ce22                	sw	s0,28(sp)
 472:	1000                	addi	s0,sp,32
 474:	fea42623          	sw	a0,-20(s0)
 478:	200007b7          	lui	a5,0x20000
 47c:	03c7a783          	lw	a5,60(a5) # 2000003c <uart_bauddiv>
 480:	fec42703          	lw	a4,-20(s0)
 484:	c398                	sw	a4,0(a5)
 486:	200007b7          	lui	a5,0x20000
 48a:	0387a783          	lw	a5,56(a5) # 20000038 <uart_ctrl>
 48e:	4705                	li	a4,1
 490:	c398                	sw	a4,0(a5)
 492:	0001                	nop
 494:	4472                	lw	s0,28(sp)
 496:	6105                	addi	sp,sp,32
 498:	8082                	ret

0000049a <uart_putc>:
 49a:	1101                	addi	sp,sp,-32
 49c:	ce22                	sw	s0,28(sp)
 49e:	1000                	addi	s0,sp,32
 4a0:	87aa                	mv	a5,a0
 4a2:	fef407a3          	sb	a5,-17(s0)
 4a6:	0001                	nop
 4a8:	200007b7          	lui	a5,0x20000
 4ac:	0407a783          	lw	a5,64(a5) # 20000040 <uart_status>
 4b0:	439c                	lw	a5,0(a5)
 4b2:	dbfd                	beqz	a5,4a8 <uart_putc+0xe>
 4b4:	200007b7          	lui	a5,0x20000
 4b8:	0447a783          	lw	a5,68(a5) # 20000044 <uart_data>
 4bc:	fef44703          	lbu	a4,-17(s0)
 4c0:	c398                	sw	a4,0(a5)
 4c2:	200007b7          	lui	a5,0x20000
 4c6:	0387a783          	lw	a5,56(a5) # 20000038 <uart_ctrl>
 4ca:	4398                	lw	a4,0(a5)
 4cc:	200007b7          	lui	a5,0x20000
 4d0:	0387a783          	lw	a5,56(a5) # 20000038 <uart_ctrl>
 4d4:	00276713          	ori	a4,a4,2
 4d8:	c398                	sw	a4,0(a5)
 4da:	0001                	nop
 4dc:	4472                	lw	s0,28(sp)
 4de:	6105                	addi	sp,sp,32
 4e0:	8082                	ret

000004e2 <uart_puts>:
 4e2:	7179                	addi	sp,sp,-48
 4e4:	d606                	sw	ra,44(sp)
 4e6:	d422                	sw	s0,40(sp)
 4e8:	1800                	addi	s0,sp,48
 4ea:	fca42e23          	sw	a0,-36(s0)
 4ee:	fe042623          	sw	zero,-20(s0)
 4f2:	a839                	j	510 <uart_puts+0x2e>
 4f4:	fec42783          	lw	a5,-20(s0)
 4f8:	fdc42703          	lw	a4,-36(s0)
 4fc:	97ba                	add	a5,a5,a4
 4fe:	0007c783          	lbu	a5,0(a5)
 502:	853e                	mv	a0,a5
 504:	3f59                	jal	49a <uart_putc>
 506:	fec42783          	lw	a5,-20(s0)
 50a:	0785                	addi	a5,a5,1
 50c:	fef42623          	sw	a5,-20(s0)
 510:	fec42783          	lw	a5,-20(s0)
 514:	fdc42703          	lw	a4,-36(s0)
 518:	97ba                	add	a5,a5,a4
 51a:	0007c783          	lbu	a5,0(a5)
 51e:	fbf9                	bnez	a5,4f4 <uart_puts+0x12>
 520:	0001                	nop
 522:	0001                	nop
 524:	50b2                	lw	ra,44(sp)
 526:	5422                	lw	s0,40(sp)
 528:	6145                	addi	sp,sp,48
 52a:	8082                	ret

0000052c <uart_puti8>:
 52c:	1101                	addi	sp,sp,-32
 52e:	ce22                	sw	s0,28(sp)
 530:	1000                	addi	s0,sp,32
 532:	87aa                	mv	a5,a0
 534:	fef407a3          	sb	a5,-17(s0)
 538:	0001                	nop
 53a:	200007b7          	lui	a5,0x20000
 53e:	0407a783          	lw	a5,64(a5) # 20000040 <uart_status>
 542:	439c                	lw	a5,0(a5)
 544:	dbfd                	beqz	a5,53a <uart_puti8+0xe>
 546:	200007b7          	lui	a5,0x20000
 54a:	0447a783          	lw	a5,68(a5) # 20000044 <uart_data>
 54e:	fef44703          	lbu	a4,-17(s0)
 552:	c398                	sw	a4,0(a5)
 554:	200007b7          	lui	a5,0x20000
 558:	0387a783          	lw	a5,56(a5) # 20000038 <uart_ctrl>
 55c:	4398                	lw	a4,0(a5)
 55e:	200007b7          	lui	a5,0x20000
 562:	0387a783          	lw	a5,56(a5) # 20000038 <uart_ctrl>
 566:	00276713          	ori	a4,a4,2
 56a:	c398                	sw	a4,0(a5)
 56c:	0001                	nop
 56e:	4472                	lw	s0,28(sp)
 570:	6105                	addi	sp,sp,32
 572:	8082                	ret

00000574 <uart_puti>:
 574:	7179                	addi	sp,sp,-48
 576:	d606                	sw	ra,44(sp)
 578:	d422                	sw	s0,40(sp)
 57a:	1800                	addi	s0,sp,48
 57c:	fca42e23          	sw	a0,-36(s0)
 580:	fe042623          	sw	zero,-20(s0)
 584:	a01d                	j	5aa <uart_puti+0x36>
 586:	fec42783          	lw	a5,-20(s0)
 58a:	078e                	slli	a5,a5,0x3
 58c:	fdc42703          	lw	a4,-36(s0)
 590:	40f757b3          	sra	a5,a4,a5
 594:	fef405a3          	sb	a5,-21(s0)
 598:	feb44783          	lbu	a5,-21(s0)
 59c:	853e                	mv	a0,a5
 59e:	3779                	jal	52c <uart_puti8>
 5a0:	fec42783          	lw	a5,-20(s0)
 5a4:	0785                	addi	a5,a5,1
 5a6:	fef42623          	sw	a5,-20(s0)
 5aa:	fec42703          	lw	a4,-20(s0)
 5ae:	478d                	li	a5,3
 5b0:	fce7dbe3          	bge	a5,a4,586 <uart_puti+0x12>
 5b4:	0001                	nop
 5b6:	0001                	nop
 5b8:	50b2                	lw	ra,44(sp)
 5ba:	5422                	lw	s0,40(sp)
 5bc:	6145                	addi	sp,sp,48
 5be:	8082                	ret

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

20000018 <dma_saddr>:
20000018:	0000                	unimp
2000001a:	9000                	.insn	2, 0x9000

2000001c <dma_daddr>:
2000001c:	0004                	.insn	2, 0x0004
2000001e:	9000                	.insn	2, 0x9000

20000020 <dma_start>:
20000020:	0008                	.insn	2, 0x0008
20000022:	9000                	.insn	2, 0x9000

20000024 <dma_src_config>:
20000024:	000c                	.insn	2, 0x000c
20000026:	9000                	.insn	2, 0x9000

20000028 <dma_dst_config>:
20000028:	0010                	.insn	2, 0x0010
2000002a:	9000                	.insn	2, 0x9000

2000002c <irq_config>:
2000002c:	0014                	.insn	2, 0x0014
2000002e:	9000                	.insn	2, 0x9000

20000030 <block_count>:
20000030:	0018                	.insn	2, 0x0018
20000032:	9000                	.insn	2, 0x9000

20000034 <block_size>:
20000034:	001c                	.insn	2, 0x001c
20000036:	9000                	.insn	2, 0x9000

20000038 <uart_ctrl>:
20000038:	0000                	unimp
2000003a:	5000                	lw	s0,32(s0)

2000003c <uart_bauddiv>:
2000003c:	0004                	.insn	2, 0x0004
2000003e:	5000                	lw	s0,32(s0)

20000040 <uart_status>:
20000040:	0008                	.insn	2, 0x0008
20000042:	5000                	lw	s0,32(s0)

20000044 <uart_data>:
20000044:	000c                	.insn	2, 0x000c
20000046:	5000                	lw	s0,32(s0)

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	5341                	li	t1,-16
   2:	0000                	unimp
   4:	7200                	.insn	2, 0x7200
   6:	7369                	lui	t1,0xffffa
   8:	01007663          	bgeu	zero,a6,14 <start+0x14>
   c:	0049                	c.nop	18
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
  50:	0108                	addi	a0,sp,128
  52:	0b0a                	slli	s6,s6,0x2

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
