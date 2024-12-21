
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
  48:	50c50513          	addi	a0,a0,1292 # 550 <_sidata>
  4c:	20000597          	auipc	a1,0x20000
  50:	fb458593          	addi	a1,a1,-76 # 20000000 <gpio_data_2>
  54:	20000617          	auipc	a2,0x20000
  58:	ff460613          	addi	a2,a2,-12 # 20000048 <timer>
  5c:	00c5d863          	bge	a1,a2,6c <end_init_data>

00000060 <loop_init_data>:
  60:	4114                	lw	a3,0(a0)
  62:	c194                	sw	a3,0(a1)
  64:	0511                	addi	a0,a0,4
  66:	0591                	addi	a1,a1,4
  68:	fec5cce3          	blt	a1,a2,60 <loop_init_data>

0000006c <end_init_data>:
  6c:	20000517          	auipc	a0,0x20000
  70:	fdc50513          	addi	a0,a0,-36 # 20000048 <timer>
  74:	81c18593          	addi	a1,gp,-2020 # 20000064 <_ebss>
  78:	00b55763          	bge	a0,a1,86 <end_init_bss>

0000007c <loop_init_bss>:
  7c:	00052023          	sw	zero,0(a0)
  80:	0511                	addi	a0,a0,4
  82:	feb54de3          	blt	a0,a1,7c <loop_init_bss>

00000086 <end_init_bss>:
  86:	2a85                	jal	1f6 <main>

00000088 <loopy>:
  88:	a001                	j	88 <loopy>

0000008a <init_dma>:
  8a:	1141                	addi	sp,sp,-16
  8c:	c622                	sw	s0,12(sp)
  8e:	0800                	addi	s0,sp,16
  90:	200007b7          	lui	a5,0x20000
  94:	0187a783          	lw	a5,24(a5) # 20000018 <dma_saddr>
  98:	80000737          	lui	a4,0x80000
  9c:	0721                	addi	a4,a4,8 # 80000008 <_stack+0x5fffe008>
  9e:	c398                	sw	a4,0(a5)
  a0:	200007b7          	lui	a5,0x20000
  a4:	01c7a783          	lw	a5,28(a5) # 2000001c <dma_daddr>
  a8:	a0000737          	lui	a4,0xa0000
  ac:	c398                	sw	a4,0(a5)
  ae:	200007b7          	lui	a5,0x20000
  b2:	0247a783          	lw	a5,36(a5) # 20000024 <dma_src_config>
  b6:	4709                	li	a4,2
  b8:	c398                	sw	a4,0(a5)
  ba:	200007b7          	lui	a5,0x20000
  be:	0287a783          	lw	a5,40(a5) # 20000028 <dma_dst_config>
  c2:	04200713          	li	a4,66
  c6:	c398                	sw	a4,0(a5)
  c8:	200007b7          	lui	a5,0x20000
  cc:	02c7a783          	lw	a5,44(a5) # 2000002c <irq_config>
  d0:	4705                	li	a4,1
  d2:	c398                	sw	a4,0(a5)
  d4:	200007b7          	lui	a5,0x20000
  d8:	0307a783          	lw	a5,48(a5) # 20000030 <block_count>
  dc:	470d                	li	a4,3
  de:	c398                	sw	a4,0(a5)
  e0:	200007b7          	lui	a5,0x20000
  e4:	0347a783          	lw	a5,52(a5) # 20000034 <block_size>
  e8:	4741                	li	a4,16
  ea:	c398                	sw	a4,0(a5)
  ec:	200007b7          	lui	a5,0x20000
  f0:	0207a783          	lw	a5,32(a5) # 20000020 <dma_start>
  f4:	4705                	li	a4,1
  f6:	c398                	sw	a4,0(a5)
  f8:	0001                	nop
  fa:	4432                	lw	s0,12(sp)
  fc:	0141                	addi	sp,sp,16
  fe:	8082                	ret

00000100 <init_i2s>:
 100:	1141                	addi	sp,sp,-16
 102:	c622                	sw	s0,12(sp)
 104:	0800                	addi	s0,sp,16
 106:	200007b7          	lui	a5,0x20000
 10a:	0087a783          	lw	a5,8(a5) # 20000008 <i2s_en>
 10e:	4725                	li	a4,9
 110:	c398                	sw	a4,0(a5)
 112:	0001                	nop
 114:	4432                	lw	s0,12(sp)
 116:	0141                	addi	sp,sp,16
 118:	8082                	ret

0000011a <isFIFOEmpty>:
 11a:	1141                	addi	sp,sp,-16
 11c:	c622                	sw	s0,12(sp)
 11e:	0800                	addi	s0,sp,16
 120:	200007b7          	lui	a5,0x20000
 124:	0147a783          	lw	a5,20(a5) # 20000014 <i2s_status>
 128:	439c                	lw	a5,0(a5)
 12a:	17fd                	addi	a5,a5,-1
 12c:	0017b793          	seqz	a5,a5
 130:	0ff7f793          	zext.b	a5,a5
 134:	853e                	mv	a0,a5
 136:	4432                	lw	s0,12(sp)
 138:	0141                	addi	sp,sp,16
 13a:	8082                	ret

0000013c <mret>:
 13c:	1141                	addi	sp,sp,-16
 13e:	c622                	sw	s0,12(sp)
 140:	0800                	addi	s0,sp,16
 142:	30200073          	mret
 146:	0001                	nop
 148:	4432                	lw	s0,12(sp)
 14a:	0141                	addi	sp,sp,16
 14c:	8082                	ret

0000014e <isr>:
 14e:	711d                	addi	sp,sp,-96
 150:	ce86                	sw	ra,92(sp)
 152:	cc96                	sw	t0,88(sp)
 154:	ca9a                	sw	t1,84(sp)
 156:	c89e                	sw	t2,80(sp)
 158:	c6a2                	sw	s0,76(sp)
 15a:	c4aa                	sw	a0,72(sp)
 15c:	c2ae                	sw	a1,68(sp)
 15e:	c0b2                	sw	a2,64(sp)
 160:	de36                	sw	a3,60(sp)
 162:	dc3a                	sw	a4,56(sp)
 164:	da3e                	sw	a5,52(sp)
 166:	d842                	sw	a6,48(sp)
 168:	d646                	sw	a7,44(sp)
 16a:	d472                	sw	t3,40(sp)
 16c:	d276                	sw	t4,36(sp)
 16e:	d07a                	sw	t5,32(sp)
 170:	ce7e                	sw	t6,28(sp)
 172:	1080                	addi	s0,sp,96
 174:	4789                	li	a5,2
 176:	faf42623          	sw	a5,-84(s0)
 17a:	478d                	li	a5,3
 17c:	faf42423          	sw	a5,-88(s0)
 180:	fac42703          	lw	a4,-84(s0)
 184:	fa842783          	lw	a5,-88(s0)
 188:	97ba                	add	a5,a5,a4
 18a:	faf42223          	sw	a5,-92(s0)
 18e:	fa442703          	lw	a4,-92(s0)
 192:	200007b7          	lui	a5,0x20000
 196:	0007a783          	lw	a5,0(a5) # 20000000 <gpio_data_2>
 19a:	c398                	sw	a4,0(a5)
 19c:	3745                	jal	13c <mret>
 19e:	0001                	nop
 1a0:	40f6                	lw	ra,92(sp)
 1a2:	42e6                	lw	t0,88(sp)
 1a4:	4356                	lw	t1,84(sp)
 1a6:	43c6                	lw	t2,80(sp)
 1a8:	4436                	lw	s0,76(sp)
 1aa:	4526                	lw	a0,72(sp)
 1ac:	4596                	lw	a1,68(sp)
 1ae:	4606                	lw	a2,64(sp)
 1b0:	56f2                	lw	a3,60(sp)
 1b2:	5762                	lw	a4,56(sp)
 1b4:	57d2                	lw	a5,52(sp)
 1b6:	5842                	lw	a6,48(sp)
 1b8:	58b2                	lw	a7,44(sp)
 1ba:	5e22                	lw	t3,40(sp)
 1bc:	5e92                	lw	t4,36(sp)
 1be:	5f02                	lw	t5,32(sp)
 1c0:	4ff2                	lw	t6,28(sp)
 1c2:	6125                	addi	sp,sp,96
 1c4:	30200073          	mret

000001c8 <setup_mtvec>:
 1c8:	7179                	addi	sp,sp,-48
 1ca:	d622                	sw	s0,44(sp)
 1cc:	1800                	addi	s0,sp,48
 1ce:	fca42e23          	sw	a0,-36(s0)
 1d2:	fcb42c23          	sw	a1,-40(s0)
 1d6:	fdc42783          	lw	a5,-36(s0)
 1da:	fef42623          	sw	a5,-20(s0)
 1de:	fec42783          	lw	a5,-20(s0)
 1e2:	30579073          	csrw	mtvec,a5
 1e6:	30046073          	csrsi	mstatus,8
 1ea:	30446073          	csrsi	mie,8
 1ee:	0001                	nop
 1f0:	5432                	lw	s0,44(sp)
 1f2:	6145                	addi	sp,sp,48
 1f4:	8082                	ret

000001f6 <main>:
 1f6:	1101                	addi	sp,sp,-32
 1f8:	ce06                	sw	ra,28(sp)
 1fa:	cc22                	sw	s0,24(sp)
 1fc:	1000                	addi	s0,sp,32
 1fe:	4581                	li	a1,0
 200:	14e00513          	li	a0,334
 204:	37d1                	jal	1c8 <setup_mtvec>
 206:	3551                	jal	8a <init_dma>
 208:	3de5                	jal	100 <init_i2s>
 20a:	200007b7          	lui	a5,0x20000
 20e:	0047a783          	lw	a5,4(a5) # 20000004 <gpio_oe_2>
 212:	577d                	li	a4,-1
 214:	c398                	sw	a4,0(a5)
 216:	4789                	li	a5,2
 218:	fef42623          	sw	a5,-20(s0)
 21c:	200007b7          	lui	a5,0x20000
 220:	0007a783          	lw	a5,0(a5) # 20000000 <gpio_data_2>
 224:	11111737          	lui	a4,0x11111
 228:	11170713          	addi	a4,a4,273 # 11111111 <_sidata+0x11110bc1>
 22c:	c398                	sw	a4,0(a5)
 22e:	450d                	li	a0,3
 230:	22f1                	jal	3fc <uart_init>
 232:	4781                	li	a5,0
 234:	853e                	mv	a0,a5
 236:	40f2                	lw	ra,28(sp)
 238:	4462                	lw	s0,24(sp)
 23a:	6105                	addi	sp,sp,32
 23c:	8082                	ret

0000023e <initialize_timer>:
 23e:	1141                	addi	sp,sp,-16
 240:	c622                	sw	s0,12(sp)
 242:	0800                	addi	s0,sp,16
 244:	200007b7          	lui	a5,0x20000
 248:	04878793          	addi	a5,a5,72 # 20000048 <timer>
 24c:	60000737          	lui	a4,0x60000
 250:	c398                	sw	a4,0(a5)
 252:	200007b7          	lui	a5,0x20000
 256:	04878793          	addi	a5,a5,72 # 20000048 <timer>
 25a:	60000737          	lui	a4,0x60000
 25e:	0711                	addi	a4,a4,4 # 60000004 <_stack+0x3fffe004>
 260:	c3d8                	sw	a4,4(a5)
 262:	200007b7          	lui	a5,0x20000
 266:	04878793          	addi	a5,a5,72 # 20000048 <timer>
 26a:	60000737          	lui	a4,0x60000
 26e:	0721                	addi	a4,a4,8 # 60000008 <_stack+0x3fffe008>
 270:	c798                	sw	a4,8(a5)
 272:	200007b7          	lui	a5,0x20000
 276:	04878793          	addi	a5,a5,72 # 20000048 <timer>
 27a:	60000737          	lui	a4,0x60000
 27e:	0731                	addi	a4,a4,12 # 6000000c <_stack+0x3fffe00c>
 280:	c7d8                	sw	a4,12(a5)
 282:	200007b7          	lui	a5,0x20000
 286:	04878793          	addi	a5,a5,72 # 20000048 <timer>
 28a:	60000737          	lui	a4,0x60000
 28e:	073d                	addi	a4,a4,15 # 6000000f <_stack+0x3fffe00f>
 290:	cb98                	sw	a4,16(a5)
 292:	200007b7          	lui	a5,0x20000
 296:	04878793          	addi	a5,a5,72 # 20000048 <timer>
 29a:	60000737          	lui	a4,0x60000
 29e:	0741                	addi	a4,a4,16 # 60000010 <_stack+0x3fffe010>
 2a0:	cbd8                	sw	a4,20(a5)
 2a2:	0001                	nop
 2a4:	4432                	lw	s0,12(sp)
 2a6:	0141                	addi	sp,sp,16
 2a8:	8082                	ret

000002aa <_start_timer>:
 2aa:	1101                	addi	sp,sp,-32
 2ac:	ce22                	sw	s0,28(sp)
 2ae:	1000                	addi	s0,sp,32
 2b0:	fea42623          	sw	a0,-20(s0)
 2b4:	200007b7          	lui	a5,0x20000
 2b8:	04878793          	addi	a5,a5,72 # 20000048 <timer>
 2bc:	479c                	lw	a5,8(a5)
 2be:	fec42703          	lw	a4,-20(s0)
 2c2:	c398                	sw	a4,0(a5)
 2c4:	200007b7          	lui	a5,0x20000
 2c8:	04878793          	addi	a5,a5,72 # 20000048 <timer>
 2cc:	43dc                	lw	a5,4(a5)
 2ce:	470d                	li	a4,3
 2d0:	c398                	sw	a4,0(a5)
 2d2:	200007b7          	lui	a5,0x20000
 2d6:	04878793          	addi	a5,a5,72 # 20000048 <timer>
 2da:	439c                	lw	a5,0(a5)
 2dc:	4705                	li	a4,1
 2de:	c398                	sw	a4,0(a5)
 2e0:	0001                	nop
 2e2:	4472                	lw	s0,28(sp)
 2e4:	6105                	addi	sp,sp,32
 2e6:	8082                	ret

000002e8 <start_timer>:
 2e8:	1101                	addi	sp,sp,-32
 2ea:	ce22                	sw	s0,28(sp)
 2ec:	1000                	addi	s0,sp,32
 2ee:	fea42623          	sw	a0,-20(s0)
 2f2:	feb42423          	sw	a1,-24(s0)
 2f6:	200007b7          	lui	a5,0x20000
 2fa:	04878793          	addi	a5,a5,72 # 20000048 <timer>
 2fe:	479c                	lw	a5,8(a5)
 300:	fe842703          	lw	a4,-24(s0)
 304:	c398                	sw	a4,0(a5)
 306:	200007b7          	lui	a5,0x20000
 30a:	04878793          	addi	a5,a5,72 # 20000048 <timer>
 30e:	43dc                	lw	a5,4(a5)
 310:	470d                	li	a4,3
 312:	c398                	sw	a4,0(a5)
 314:	200007b7          	lui	a5,0x20000
 318:	04878793          	addi	a5,a5,72 # 20000048 <timer>
 31c:	439c                	lw	a5,0(a5)
 31e:	4705                	li	a4,1
 320:	c398                	sw	a4,0(a5)
 322:	200007b7          	lui	a5,0x20000
 326:	04878793          	addi	a5,a5,72 # 20000048 <timer>
 32a:	47dc                	lw	a5,12(a5)
 32c:	11111737          	lui	a4,0x11111
 330:	11170713          	addi	a4,a4,273 # 11111111 <_sidata+0x11110bc1>
 334:	c398                	sw	a4,0(a5)
 336:	fec42783          	lw	a5,-20(s0)
 33a:	20000737          	lui	a4,0x20000
 33e:	04870713          	addi	a4,a4,72 # 20000048 <timer>
 342:	00072803          	lw	a6,0(a4)
 346:	4348                	lw	a0,4(a4)
 348:	470c                	lw	a1,8(a4)
 34a:	4750                	lw	a2,12(a4)
 34c:	4b14                	lw	a3,16(a4)
 34e:	4b58                	lw	a4,20(a4)
 350:	0107a023          	sw	a6,0(a5)
 354:	c3c8                	sw	a0,4(a5)
 356:	c78c                	sw	a1,8(a5)
 358:	c7d0                	sw	a2,12(a5)
 35a:	cb94                	sw	a3,16(a5)
 35c:	cbd8                	sw	a4,20(a5)
 35e:	fec42503          	lw	a0,-20(s0)
 362:	4472                	lw	s0,28(sp)
 364:	6105                	addi	sp,sp,32
 366:	8082                	ret

00000368 <delay>:
 368:	1101                	addi	sp,sp,-32
 36a:	ce06                	sw	ra,28(sp)
 36c:	cc22                	sw	s0,24(sp)
 36e:	1000                	addi	s0,sp,32
 370:	fea42623          	sw	a0,-20(s0)
 374:	6785                	lui	a5,0x1
 376:	76f78513          	addi	a0,a5,1903 # 176f <_sidata+0x121f>
 37a:	3f05                	jal	2aa <_start_timer>
 37c:	200007b7          	lui	a5,0x20000
 380:	04878793          	addi	a5,a5,72 # 20000048 <timer>
 384:	47dc                	lw	a5,12(a5)
 386:	fec42703          	lw	a4,-20(s0)
 38a:	c398                	sw	a4,0(a5)
 38c:	0001                	nop
 38e:	200007b7          	lui	a5,0x20000
 392:	04878793          	addi	a5,a5,72 # 20000048 <timer>
 396:	4b9c                	lw	a5,16(a5)
 398:	4398                	lw	a4,0(a5)
 39a:	fec42783          	lw	a5,-20(s0)
 39e:	fef718e3          	bne	a4,a5,38e <delay+0x26>
 3a2:	200007b7          	lui	a5,0x20000
 3a6:	04878793          	addi	a5,a5,72 # 20000048 <timer>
 3aa:	439c                	lw	a5,0(a5)
 3ac:	0007a023          	sw	zero,0(a5)
 3b0:	0001                	nop
 3b2:	40f2                	lw	ra,28(sp)
 3b4:	4462                	lw	s0,24(sp)
 3b6:	6105                	addi	sp,sp,32
 3b8:	8082                	ret

000003ba <get_timer_counter>:
 3ba:	1141                	addi	sp,sp,-16
 3bc:	c622                	sw	s0,12(sp)
 3be:	0800                	addi	s0,sp,16
 3c0:	200007b7          	lui	a5,0x20000
 3c4:	04878793          	addi	a5,a5,72 # 20000048 <timer>
 3c8:	4b9c                	lw	a5,16(a5)
 3ca:	439c                	lw	a5,0(a5)
 3cc:	853e                	mv	a0,a5
 3ce:	4432                	lw	s0,12(sp)
 3d0:	0141                	addi	sp,sp,16
 3d2:	8082                	ret

000003d4 <end_timer>:
 3d4:	1141                	addi	sp,sp,-16
 3d6:	c622                	sw	s0,12(sp)
 3d8:	0800                	addi	s0,sp,16
 3da:	200007b7          	lui	a5,0x20000
 3de:	04878793          	addi	a5,a5,72 # 20000048 <timer>
 3e2:	439c                	lw	a5,0(a5)
 3e4:	0007a023          	sw	zero,0(a5)
 3e8:	200007b7          	lui	a5,0x20000
 3ec:	04878793          	addi	a5,a5,72 # 20000048 <timer>
 3f0:	4b9c                	lw	a5,16(a5)
 3f2:	439c                	lw	a5,0(a5)
 3f4:	853e                	mv	a0,a5
 3f6:	4432                	lw	s0,12(sp)
 3f8:	0141                	addi	sp,sp,16
 3fa:	8082                	ret

000003fc <uart_init>:
 3fc:	1101                	addi	sp,sp,-32
 3fe:	ce22                	sw	s0,28(sp)
 400:	1000                	addi	s0,sp,32
 402:	fea42623          	sw	a0,-20(s0)
 406:	200007b7          	lui	a5,0x20000
 40a:	03c7a783          	lw	a5,60(a5) # 2000003c <uart_bauddiv>
 40e:	fec42703          	lw	a4,-20(s0)
 412:	c398                	sw	a4,0(a5)
 414:	200007b7          	lui	a5,0x20000
 418:	0387a783          	lw	a5,56(a5) # 20000038 <uart_ctrl>
 41c:	4705                	li	a4,1
 41e:	c398                	sw	a4,0(a5)
 420:	0001                	nop
 422:	4472                	lw	s0,28(sp)
 424:	6105                	addi	sp,sp,32
 426:	8082                	ret

00000428 <uart_putc>:
 428:	1101                	addi	sp,sp,-32
 42a:	ce22                	sw	s0,28(sp)
 42c:	1000                	addi	s0,sp,32
 42e:	87aa                	mv	a5,a0
 430:	fef407a3          	sb	a5,-17(s0)
 434:	0001                	nop
 436:	200007b7          	lui	a5,0x20000
 43a:	0407a783          	lw	a5,64(a5) # 20000040 <uart_status>
 43e:	439c                	lw	a5,0(a5)
 440:	dbfd                	beqz	a5,436 <uart_putc+0xe>
 442:	200007b7          	lui	a5,0x20000
 446:	0447a783          	lw	a5,68(a5) # 20000044 <uart_data>
 44a:	fef44703          	lbu	a4,-17(s0)
 44e:	c398                	sw	a4,0(a5)
 450:	200007b7          	lui	a5,0x20000
 454:	0387a783          	lw	a5,56(a5) # 20000038 <uart_ctrl>
 458:	4398                	lw	a4,0(a5)
 45a:	200007b7          	lui	a5,0x20000
 45e:	0387a783          	lw	a5,56(a5) # 20000038 <uart_ctrl>
 462:	00276713          	ori	a4,a4,2
 466:	c398                	sw	a4,0(a5)
 468:	0001                	nop
 46a:	4472                	lw	s0,28(sp)
 46c:	6105                	addi	sp,sp,32
 46e:	8082                	ret

00000470 <uart_puts>:
 470:	7179                	addi	sp,sp,-48
 472:	d606                	sw	ra,44(sp)
 474:	d422                	sw	s0,40(sp)
 476:	1800                	addi	s0,sp,48
 478:	fca42e23          	sw	a0,-36(s0)
 47c:	fe042623          	sw	zero,-20(s0)
 480:	a839                	j	49e <uart_puts+0x2e>
 482:	fec42783          	lw	a5,-20(s0)
 486:	fdc42703          	lw	a4,-36(s0)
 48a:	97ba                	add	a5,a5,a4
 48c:	0007c783          	lbu	a5,0(a5)
 490:	853e                	mv	a0,a5
 492:	3f59                	jal	428 <uart_putc>
 494:	fec42783          	lw	a5,-20(s0)
 498:	0785                	addi	a5,a5,1
 49a:	fef42623          	sw	a5,-20(s0)
 49e:	fec42783          	lw	a5,-20(s0)
 4a2:	fdc42703          	lw	a4,-36(s0)
 4a6:	97ba                	add	a5,a5,a4
 4a8:	0007c783          	lbu	a5,0(a5)
 4ac:	fbf9                	bnez	a5,482 <uart_puts+0x12>
 4ae:	0001                	nop
 4b0:	0001                	nop
 4b2:	50b2                	lw	ra,44(sp)
 4b4:	5422                	lw	s0,40(sp)
 4b6:	6145                	addi	sp,sp,48
 4b8:	8082                	ret

000004ba <uart_puti8>:
 4ba:	1101                	addi	sp,sp,-32
 4bc:	ce22                	sw	s0,28(sp)
 4be:	1000                	addi	s0,sp,32
 4c0:	87aa                	mv	a5,a0
 4c2:	fef407a3          	sb	a5,-17(s0)
 4c6:	0001                	nop
 4c8:	200007b7          	lui	a5,0x20000
 4cc:	0407a783          	lw	a5,64(a5) # 20000040 <uart_status>
 4d0:	439c                	lw	a5,0(a5)
 4d2:	dbfd                	beqz	a5,4c8 <uart_puti8+0xe>
 4d4:	200007b7          	lui	a5,0x20000
 4d8:	0447a783          	lw	a5,68(a5) # 20000044 <uart_data>
 4dc:	fef44703          	lbu	a4,-17(s0)
 4e0:	c398                	sw	a4,0(a5)
 4e2:	200007b7          	lui	a5,0x20000
 4e6:	0387a783          	lw	a5,56(a5) # 20000038 <uart_ctrl>
 4ea:	4398                	lw	a4,0(a5)
 4ec:	200007b7          	lui	a5,0x20000
 4f0:	0387a783          	lw	a5,56(a5) # 20000038 <uart_ctrl>
 4f4:	00276713          	ori	a4,a4,2
 4f8:	c398                	sw	a4,0(a5)
 4fa:	0001                	nop
 4fc:	4472                	lw	s0,28(sp)
 4fe:	6105                	addi	sp,sp,32
 500:	8082                	ret

00000502 <uart_puti>:
 502:	7179                	addi	sp,sp,-48
 504:	d606                	sw	ra,44(sp)
 506:	d422                	sw	s0,40(sp)
 508:	1800                	addi	s0,sp,48
 50a:	fca42e23          	sw	a0,-36(s0)
 50e:	fe042623          	sw	zero,-20(s0)
 512:	a01d                	j	538 <uart_puti+0x36>
 514:	fec42783          	lw	a5,-20(s0)
 518:	078e                	slli	a5,a5,0x3
 51a:	fdc42703          	lw	a4,-36(s0)
 51e:	40f757b3          	sra	a5,a4,a5
 522:	fef405a3          	sb	a5,-21(s0)
 526:	feb44783          	lbu	a5,-21(s0)
 52a:	853e                	mv	a0,a5
 52c:	3779                	jal	4ba <uart_puti8>
 52e:	fec42783          	lw	a5,-20(s0)
 532:	0785                	addi	a5,a5,1
 534:	fef42623          	sw	a5,-20(s0)
 538:	fec42703          	lw	a4,-20(s0)
 53c:	478d                	li	a5,3
 53e:	fce7dbe3          	bge	a5,a4,514 <uart_puti+0x12>
 542:	0001                	nop
 544:	0001                	nop
 546:	50b2                	lw	ra,44(sp)
 548:	5422                	lw	s0,40(sp)
 54a:	6145                	addi	sp,sp,48
 54c:	8082                	ret
	...

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
