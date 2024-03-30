	.file	"dht.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_f2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.initiateGPIO,"ax",@progbits
	.align	1
	.globl	initiateGPIO
	.type	initiateGPIO, @function
initiateGPIO:
.LFB4:
	.file 1 "D:/BL602/final_code/build_2/main2_file/dht.c"
	.loc 1 19 1
	.cfi_startproc
	.loc 1 20 3
	li	a2,0
	li	a1,0
	li	a0,17
	tail	bl_gpio_enable_output
.LVL0:
	.cfi_endproc
.LFE4:
	.size	initiateGPIO, .-initiateGPIO
	.section	.text.sendStartSignal,"ax",@progbits
	.align	1
	.globl	sendStartSignal
	.type	sendStartSignal, @function
sendStartSignal:
.LFB5:
	.loc 1 23 1
	.cfi_startproc
	.loc 1 24 3
	.loc 1 23 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 24 3
	li	a1,0
	li	a0,17
	.loc 1 23 1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 24 3
	call	bl_gpio_output_set
.LVL1:
	.loc 1 25 3 is_stmt 1
	li	a0,1
	call	vTaskDelay
.LVL2:
	.loc 1 27 3
	li	a1,1
	li	a0,17
	call	bl_gpio_output_set
.LVL3:
	.loc 1 28 3
	.loc 1 29 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	.loc 1 28 3
	li	a0,30
	.loc 1 29 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	.loc 1 28 3
	tail	bl_timer_delay_us
.LVL4:
	.cfi_endproc
.LFE5:
	.size	sendStartSignal, .-sendStartSignal
	.section	.text.task_dht,"ax",@progbits
	.align	1
	.globl	task_dht
	.type	task_dht, @function
task_dht:
.LFB6:
	.loc 1 32 1 is_stmt 1
	.cfi_startproc
.LVL5:
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s3,44(sp)
	sw	s4,40(sp)
	sw	s5,36(sp)
	sw	s6,32(sp)
	sw	s7,28(sp)
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s8,24(sp)
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 24, -40
.LBB2:
	.loc 1 42 11 is_stmt 0
	li	s1,1
	.loc 1 64 14
	lui	s2,%hi(humidity)
	.loc 1 65 10
	lui	s3,%hi(temp)
	lui	s4,%hi(.LC2)
	lui	s5,%hi(.LC3)
	.loc 1 88 7
	lui	s6,%hi(.LC1)
	.loc 1 76 9
	lui	s7,%hi(.LC0)
.LVL6:
.L16:
.LBE2:
	.loc 1 34 3 is_stmt 1
.LBB4:
	.loc 1 36 5
	call	initiateGPIO
.LVL7:
	.loc 1 37 5
	.loc 1 37 13 is_stmt 0
	sw	zero,8(sp)
	sb	zero,12(sp)
	.loc 1 38 5 is_stmt 1
	call	sendStartSignal
.LVL8:
	.loc 1 40 5
	li	a2,0
	li	a1,0
	li	a0,17
	call	bl_gpio_enable_input
.LVL9:
	.loc 1 42 5
.L5:
	.loc 1 43 7 discriminator 1
	.loc 1 42 12 is_stmt 0 discriminator 1
	li	a0,17
	call	bl_gpio_input_get_value
.LVL10:
	.loc 1 42 11 discriminator 1
	beq	a0,s1,.L5
.L6:
	.loc 1 45 7 is_stmt 1 discriminator 1
	.loc 1 44 12 is_stmt 0 discriminator 1
	li	a0,17
	call	bl_gpio_input_get_value
.LVL11:
	.loc 1 44 11 discriminator 1
	beq	a0,zero,.L6
.L7:
	.loc 1 47 7 is_stmt 1 discriminator 1
	.loc 1 46 12 is_stmt 0 discriminator 1
	li	a0,17
	call	bl_gpio_input_get_value
.LVL12:
	.loc 1 46 11 discriminator 1
	beq	a0,s1,.L7
.LBB3:
	.loc 1 49 14
	li	s8,0
	.loc 1 49 5
	li	s0,40
.L8:
	.loc 1 52 9 is_stmt 1 discriminator 1
	.loc 1 51 14 is_stmt 0 discriminator 1
	li	a0,17
	call	bl_gpio_input_get_value
.LVL13:
	.loc 1 51 13 discriminator 1
	beq	a0,zero,.L8
	.loc 1 54 7 is_stmt 1
	li	a0,30
	call	bl_timer_delay_us
.LVL14:
	.loc 1 56 7
	.loc 1 56 11 is_stmt 0
	li	a0,17
	call	bl_gpio_input_get_value
.LVL15:
	.loc 1 56 10
	beq	a0,zero,.L10
	.loc 1 58 9 is_stmt 1
	.loc 1 58 21 is_stmt 0
	addi	a5,sp,16
	.loc 1 58 16
	srai	a4,s8,3
	.loc 1 58 21
	add	a4,a5,a4
	lbu	a3,-8(a4)
	.loc 1 58 27
	not	a5,s8
	andi	a5,a5,7
	sll	a5,s1,a5
	.loc 1 58 21
	or	a5,a5,a3
	sb	a5,-8(a4)
.L10:
	.loc 1 62 9 is_stmt 1 discriminator 1
	.loc 1 61 14 is_stmt 0 discriminator 1
	li	a0,17
	call	bl_gpio_input_get_value
.LVL16:
	.loc 1 61 13 discriminator 1
	beq	a0,s1,.L10
	.loc 1 49 30 discriminator 2
	addi	s8,s8,1
.LVL17:
	.loc 1 49 5 discriminator 2
	bne	s8,s0,.L8
.LBE3:
	.loc 1 64 5 is_stmt 1
	.loc 1 64 21 is_stmt 0
	lbu	a2,8(sp)
	.loc 1 64 36
	lbu	a5,9(sp)
	.loc 1 65 17
	lbu	a3,10(sp)
	.loc 1 64 25
	slli	a4,a2,8
	.loc 1 64 30
	or	a4,a4,a5
	.loc 1 64 14
	sh	a4,%lo(humidity)(s2)
	.loc 1 65 5 is_stmt 1
	.loc 1 65 32 is_stmt 0
	lbu	a4,11(sp)
	.loc 1 65 21
	slli	a1,a3,8
	.loc 1 70 18
	add	a5,a5,a2
	.loc 1 65 26
	or	a1,a1,a4
	.loc 1 70 28
	add	a5,a5,a3
	.loc 1 65 26
	slli	a1,a1,16
	.loc 1 70 38
	add	a5,a5,a4
	.loc 1 70 49
	lbu	a4,12(sp)
	.loc 1 65 26
	srai	a1,a1,16
	.loc 1 65 10
	sh	a1,%lo(temp)(s3)
	.loc 1 66 5 is_stmt 1
.LVL18:
	.loc 1 70 5
	.loc 1 70 8 is_stmt 0
	bne	a5,a4,.L12
	.loc 1 73 7 is_stmt 1
	.loc 1 73 10 is_stmt 0
	bge	a1,zero,.L13
	.loc 1 75 9 is_stmt 1
	.loc 1 75 14 is_stmt 0
	neg	a1,a1
	slli	s0,a1,16
	srai	s0,s0,16
	.loc 1 76 9
	li	s8,10
.LVL19:
	rem	a0,s0,s8
	.loc 1 75 14
	sh	s0,%lo(temp)(s3)
	.loc 1 76 9 is_stmt 1
	call	abs
.LVL20:
	div	a1,s0,s8
	mv	a2,a0
	addi	a0,s7,%lo(.LC0)
.L29:
	.loc 1 80 9 is_stmt 0
	call	printf
.LVL21:
	.loc 1 83 7 is_stmt 1
	lhu	a1,%lo(humidity)(s2)
	li	a5,10
	remu	a2,a1,a5
	divu	a1,a1,a5
.L30:
	.loc 1 89 7 is_stmt 0
	addi	a0,s4,%lo(.LC2)
	call	printf
.LVL22:
	.loc 1 90 7 is_stmt 1
	addi	a0,s5,%lo(.LC3)
	call	printf
.LVL23:
	.loc 1 93 5
	li	a0,8192
	addi	a0,a0,1808
	call	vTaskDelay
.LVL24:
.LBE4:
	.loc 1 35 3 is_stmt 0
	j	.L16
.LVL25:
.L13:
.LBB5:
	.loc 1 80 9 is_stmt 1
	li	a5,10
	rem	a2,a1,a5
	addi	a0,s6,%lo(.LC1)
	div	a1,a1,a5
	j	.L29
.L12:
	.loc 1 88 7
	li	s0,10
	rem	a2,a1,s0
	addi	a0,s6,%lo(.LC1)
	div	a1,a1,s0
	call	printf
.LVL26:
	.loc 1 89 7
	lhu	a1,%lo(humidity)(s2)
	remu	a2,a1,s0
	divu	a1,a1,s0
	j	.L30
.LBE5:
	.cfi_endproc
.LFE6:
	.size	task_dht, .-task_dht
	.comm	temp,2,2
	.comm	humidity,2,2
	.section	.rodata.task_dht.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"\033[31mTemperature: %d.%d *C\r\n"
	.zero	3
.LC1:
	.string	"\033[36mTemperature: %d.%d *C\r\n"
	.zero	3
.LC2:
	.string	"\033[33mHumidity: %d.%d \r\n"
.LC3:
	.string	"\033[0m"
	.text
.Letext0:
	.file 2 "d:\\bl602\\newbl602_sdk\\bl_iot_sdk\\toolchain\\riscv\\msys\\lib\\gcc\\riscv64-unknown-elf\\8.3.0\\include\\stdint-gcc.h"
	.file 3 "D:/BL602/NewBl602_sdk/bl_iot_sdk/components/bl602/freertos_riscv_ram/portable/GCC/RISC-V/portmacro.h"
	.file 4 "d:\\bl602\\newbl602_sdk\\bl_iot_sdk\\toolchain\\riscv\\msys\\lib\\gcc\\riscv64-unknown-elf\\8.3.0\\include\\stddef.h"
	.file 5 "d:\\bl602\\newbl602_sdk\\bl_iot_sdk\\toolchain\\riscv\\msys\\riscv64-unknown-elf\\include\\sys\\_types.h"
	.file 6 "d:\\bl602\\newbl602_sdk\\bl_iot_sdk\\toolchain\\riscv\\msys\\riscv64-unknown-elf\\include\\sys\\reent.h"
	.file 7 "d:\\bl602\\newbl602_sdk\\bl_iot_sdk\\toolchain\\riscv\\msys\\riscv64-unknown-elf\\include\\sys\\lock.h"
	.file 8 "d:\\bl602\\newbl602_sdk\\bl_iot_sdk\\toolchain\\riscv\\msys\\riscv64-unknown-elf\\include\\stdlib.h"
	.file 9 "D:/BL602/NewBl602_sdk/bl_iot_sdk/components/hal_drv/bl602_hal/bl_gpio.h"
	.file 10 "D:/BL602/NewBl602_sdk/bl_iot_sdk/components/hal_drv/bl602_hal/bl_timer.h"
	.file 11 "d:\\bl602\\newbl602_sdk\\bl_iot_sdk\\toolchain\\riscv\\msys\\riscv64-unknown-elf\\include\\stdio.h"
	.file 12 "D:/BL602/NewBl602_sdk/bl_iot_sdk/components/bl602/freertos_riscv_ram/config/task.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xc84
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF142
	.byte	0xc
	.4byte	.LASF143
	.4byte	.LASF144
	.4byte	.Ldebug_ranges0+0x20
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.byte	0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF1
	.byte	0x4
	.4byte	.LASF3
	.byte	0x2
	.byte	0x25
	.byte	0x13
	.4byte	0x46
	.byte	0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.byte	0x4
	.4byte	.LASF4
	.byte	0x2
	.byte	0x28
	.byte	0x12
	.4byte	0x59
	.byte	0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF5
	.byte	0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.byte	0x4
	.4byte	.LASF7
	.byte	0x2
	.byte	0x2e
	.byte	0x17
	.4byte	0x73
	.byte	0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF8
	.byte	0x4
	.4byte	.LASF9
	.byte	0x2
	.byte	0x31
	.byte	0x1c
	.4byte	0x86
	.byte	0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF10
	.byte	0x4
	.4byte	.LASF11
	.byte	0x2
	.byte	0x34
	.byte	0x1b
	.4byte	0x99
	.byte	0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.byte	0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF13
	.byte	0x5
	.byte	0x4
	.byte	0x4
	.4byte	.LASF14
	.byte	0x3
	.byte	0x3f
	.byte	0x11
	.4byte	0x4d
	.byte	0x4
	.4byte	.LASF15
	.byte	0x3
	.byte	0x41
	.byte	0x12
	.4byte	0x8d
	.byte	0x6
	.4byte	.LASF124
	.byte	0x3
	.byte	0x54
	.byte	0x13
	.4byte	0xa9
	.byte	0x7
	.byte	0x4
	.4byte	0xda
	.byte	0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF16
	.byte	0x8
	.4byte	0xd3
	.byte	0x9
	.4byte	.LASF17
	.byte	0x4
	.2byte	0x165
	.byte	0x16
	.4byte	0x2c
	.byte	0x4
	.4byte	.LASF18
	.byte	0x5
	.byte	0x2e
	.byte	0xe
	.4byte	0x59
	.byte	0x4
	.4byte	.LASF19
	.byte	0x5
	.byte	0x74
	.byte	0xe
	.4byte	0x59
	.byte	0x4
	.4byte	.LASF20
	.byte	0x5
	.byte	0x93
	.byte	0x14
	.4byte	0x25
	.byte	0xa
	.byte	0x4
	.byte	0x5
	.byte	0xa5
	.byte	0x3
	.4byte	0x132
	.byte	0xb
	.4byte	.LASF21
	.byte	0x5
	.byte	0xa7
	.byte	0xc
	.4byte	0xdf
	.byte	0xb
	.4byte	.LASF22
	.byte	0x5
	.byte	0xa8
	.byte	0x13
	.4byte	0x132
	.byte	0
	.byte	0xc
	.4byte	0x73
	.4byte	0x142
	.byte	0xd
	.4byte	0x2c
	.byte	0x3
	.byte	0
	.byte	0xe
	.byte	0x8
	.byte	0x5
	.byte	0xa2
	.byte	0x9
	.4byte	0x166
	.byte	0xf
	.4byte	.LASF23
	.byte	0x5
	.byte	0xa4
	.byte	0x7
	.4byte	0x25
	.byte	0
	.byte	0xf
	.4byte	.LASF24
	.byte	0x5
	.byte	0xa9
	.byte	0x5
	.4byte	0x110
	.byte	0x4
	.byte	0
	.byte	0x4
	.4byte	.LASF25
	.byte	0x5
	.byte	0xaa
	.byte	0x3
	.4byte	0x142
	.byte	0x4
	.4byte	.LASF26
	.byte	0x6
	.byte	0x16
	.byte	0x17
	.4byte	0x99
	.byte	0x4
	.4byte	.LASF27
	.byte	0x7
	.byte	0xc
	.byte	0xd
	.4byte	0x25
	.byte	0x4
	.4byte	.LASF28
	.byte	0x6
	.byte	0x23
	.byte	0x1b
	.4byte	0x17e
	.byte	0x10
	.4byte	.LASF33
	.byte	0x18
	.byte	0x6
	.byte	0x34
	.byte	0x8
	.4byte	0x1f0
	.byte	0xf
	.4byte	.LASF29
	.byte	0x6
	.byte	0x36
	.byte	0x13
	.4byte	0x1f0
	.byte	0
	.byte	0x11
	.string	"_k"
	.byte	0x6
	.byte	0x37
	.byte	0x7
	.4byte	0x25
	.byte	0x4
	.byte	0xf
	.4byte	.LASF30
	.byte	0x6
	.byte	0x37
	.byte	0xb
	.4byte	0x25
	.byte	0x8
	.byte	0xf
	.4byte	.LASF31
	.byte	0x6
	.byte	0x37
	.byte	0x14
	.4byte	0x25
	.byte	0xc
	.byte	0xf
	.4byte	.LASF32
	.byte	0x6
	.byte	0x37
	.byte	0x1b
	.4byte	0x25
	.byte	0x10
	.byte	0x11
	.string	"_x"
	.byte	0x6
	.byte	0x38
	.byte	0xb
	.4byte	0x1f6
	.byte	0x14
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x196
	.byte	0xc
	.4byte	0x172
	.4byte	0x206
	.byte	0xd
	.4byte	0x2c
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF34
	.byte	0x24
	.byte	0x6
	.byte	0x3c
	.byte	0x8
	.4byte	0x289
	.byte	0xf
	.4byte	.LASF35
	.byte	0x6
	.byte	0x3e
	.byte	0x7
	.4byte	0x25
	.byte	0
	.byte	0xf
	.4byte	.LASF36
	.byte	0x6
	.byte	0x3f
	.byte	0x7
	.4byte	0x25
	.byte	0x4
	.byte	0xf
	.4byte	.LASF37
	.byte	0x6
	.byte	0x40
	.byte	0x7
	.4byte	0x25
	.byte	0x8
	.byte	0xf
	.4byte	.LASF38
	.byte	0x6
	.byte	0x41
	.byte	0x7
	.4byte	0x25
	.byte	0xc
	.byte	0xf
	.4byte	.LASF39
	.byte	0x6
	.byte	0x42
	.byte	0x7
	.4byte	0x25
	.byte	0x10
	.byte	0xf
	.4byte	.LASF40
	.byte	0x6
	.byte	0x43
	.byte	0x7
	.4byte	0x25
	.byte	0x14
	.byte	0xf
	.4byte	.LASF41
	.byte	0x6
	.byte	0x44
	.byte	0x7
	.4byte	0x25
	.byte	0x18
	.byte	0xf
	.4byte	.LASF42
	.byte	0x6
	.byte	0x45
	.byte	0x7
	.4byte	0x25
	.byte	0x1c
	.byte	0xf
	.4byte	.LASF43
	.byte	0x6
	.byte	0x46
	.byte	0x7
	.4byte	0x25
	.byte	0x20
	.byte	0
	.byte	0x12
	.4byte	.LASF44
	.2byte	0x108
	.byte	0x6
	.byte	0x4f
	.byte	0x8
	.4byte	0x2ce
	.byte	0xf
	.4byte	.LASF45
	.byte	0x6
	.byte	0x50
	.byte	0x9
	.4byte	0x2ce
	.byte	0
	.byte	0xf
	.4byte	.LASF46
	.byte	0x6
	.byte	0x51
	.byte	0x9
	.4byte	0x2ce
	.byte	0x80
	.byte	0x13
	.4byte	.LASF47
	.byte	0x6
	.byte	0x53
	.byte	0xa
	.4byte	0x172
	.2byte	0x100
	.byte	0x13
	.4byte	.LASF48
	.byte	0x6
	.byte	0x56
	.byte	0xa
	.4byte	0x172
	.2byte	0x104
	.byte	0
	.byte	0xc
	.4byte	0xa7
	.4byte	0x2de
	.byte	0xd
	.4byte	0x2c
	.byte	0x1f
	.byte	0
	.byte	0x12
	.4byte	.LASF49
	.2byte	0x190
	.byte	0x6
	.byte	0x62
	.byte	0x8
	.4byte	0x321
	.byte	0xf
	.4byte	.LASF29
	.byte	0x6
	.byte	0x63
	.byte	0x12
	.4byte	0x321
	.byte	0
	.byte	0xf
	.4byte	.LASF50
	.byte	0x6
	.byte	0x64
	.byte	0x6
	.4byte	0x25
	.byte	0x4
	.byte	0xf
	.4byte	.LASF51
	.byte	0x6
	.byte	0x66
	.byte	0x9
	.4byte	0x327
	.byte	0x8
	.byte	0xf
	.4byte	.LASF44
	.byte	0x6
	.byte	0x67
	.byte	0x1e
	.4byte	0x289
	.byte	0x88
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x2de
	.byte	0xc
	.4byte	0x337
	.4byte	0x337
	.byte	0xd
	.4byte	0x2c
	.byte	0x1f
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x33d
	.byte	0x14
	.byte	0x10
	.4byte	.LASF52
	.byte	0x8
	.byte	0x6
	.byte	0x7a
	.byte	0x8
	.4byte	0x366
	.byte	0xf
	.4byte	.LASF53
	.byte	0x6
	.byte	0x7b
	.byte	0x11
	.4byte	0x366
	.byte	0
	.byte	0xf
	.4byte	.LASF54
	.byte	0x6
	.byte	0x7c
	.byte	0x6
	.4byte	0x25
	.byte	0x4
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x73
	.byte	0x10
	.4byte	.LASF55
	.byte	0x68
	.byte	0x6
	.byte	0xba
	.byte	0x8
	.4byte	0x4af
	.byte	0x11
	.string	"_p"
	.byte	0x6
	.byte	0xbb
	.byte	0x12
	.4byte	0x366
	.byte	0
	.byte	0x11
	.string	"_r"
	.byte	0x6
	.byte	0xbc
	.byte	0x7
	.4byte	0x25
	.byte	0x4
	.byte	0x11
	.string	"_w"
	.byte	0x6
	.byte	0xbd
	.byte	0x7
	.4byte	0x25
	.byte	0x8
	.byte	0xf
	.4byte	.LASF56
	.byte	0x6
	.byte	0xbe
	.byte	0x9
	.4byte	0x46
	.byte	0xc
	.byte	0xf
	.4byte	.LASF57
	.byte	0x6
	.byte	0xbf
	.byte	0x9
	.4byte	0x46
	.byte	0xe
	.byte	0x11
	.string	"_bf"
	.byte	0x6
	.byte	0xc0
	.byte	0x11
	.4byte	0x33e
	.byte	0x10
	.byte	0xf
	.4byte	.LASF58
	.byte	0x6
	.byte	0xc1
	.byte	0x7
	.4byte	0x25
	.byte	0x18
	.byte	0xf
	.4byte	.LASF59
	.byte	0x6
	.byte	0xc8
	.byte	0xa
	.4byte	0xa7
	.byte	0x1c
	.byte	0xf
	.4byte	.LASF60
	.byte	0x6
	.byte	0xca
	.byte	0xe
	.4byte	0x627
	.byte	0x20
	.byte	0xf
	.4byte	.LASF61
	.byte	0x6
	.byte	0xcc
	.byte	0xe
	.4byte	0x64b
	.byte	0x24
	.byte	0xf
	.4byte	.LASF62
	.byte	0x6
	.byte	0xcf
	.byte	0xd
	.4byte	0x66f
	.byte	0x28
	.byte	0xf
	.4byte	.LASF63
	.byte	0x6
	.byte	0xd0
	.byte	0x9
	.4byte	0x689
	.byte	0x2c
	.byte	0x11
	.string	"_ub"
	.byte	0x6
	.byte	0xd3
	.byte	0x11
	.4byte	0x33e
	.byte	0x30
	.byte	0x11
	.string	"_up"
	.byte	0x6
	.byte	0xd4
	.byte	0x12
	.4byte	0x366
	.byte	0x38
	.byte	0x11
	.string	"_ur"
	.byte	0x6
	.byte	0xd5
	.byte	0x7
	.4byte	0x25
	.byte	0x3c
	.byte	0xf
	.4byte	.LASF64
	.byte	0x6
	.byte	0xd8
	.byte	0x11
	.4byte	0x68f
	.byte	0x40
	.byte	0xf
	.4byte	.LASF65
	.byte	0x6
	.byte	0xd9
	.byte	0x11
	.4byte	0x69f
	.byte	0x43
	.byte	0x11
	.string	"_lb"
	.byte	0x6
	.byte	0xdc
	.byte	0x11
	.4byte	0x33e
	.byte	0x44
	.byte	0xf
	.4byte	.LASF66
	.byte	0x6
	.byte	0xdf
	.byte	0x7
	.4byte	0x25
	.byte	0x4c
	.byte	0xf
	.4byte	.LASF67
	.byte	0x6
	.byte	0xe0
	.byte	0xa
	.4byte	0xec
	.byte	0x50
	.byte	0xf
	.4byte	.LASF68
	.byte	0x6
	.byte	0xe3
	.byte	0x12
	.4byte	0x4cd
	.byte	0x54
	.byte	0xf
	.4byte	.LASF69
	.byte	0x6
	.byte	0xe7
	.byte	0xc
	.4byte	0x18a
	.byte	0x58
	.byte	0xf
	.4byte	.LASF70
	.byte	0x6
	.byte	0xe9
	.byte	0xe
	.4byte	0x166
	.byte	0x5c
	.byte	0xf
	.4byte	.LASF71
	.byte	0x6
	.byte	0xea
	.byte	0x7
	.4byte	0x25
	.byte	0x64
	.byte	0
	.byte	0x15
	.4byte	0x104
	.4byte	0x4cd
	.byte	0x16
	.4byte	0x4cd
	.byte	0x16
	.4byte	0xa7
	.byte	0x16
	.4byte	0x621
	.byte	0x16
	.4byte	0x25
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x4d8
	.byte	0x8
	.4byte	0x4cd
	.byte	0x17
	.4byte	.LASF72
	.2byte	0x428
	.byte	0x6
	.2byte	0x265
	.byte	0x8
	.4byte	0x621
	.byte	0x18
	.4byte	.LASF73
	.byte	0x6
	.2byte	0x267
	.byte	0x7
	.4byte	0x25
	.byte	0
	.byte	0x18
	.4byte	.LASF74
	.byte	0x6
	.2byte	0x26c
	.byte	0xb
	.4byte	0x6fb
	.byte	0x4
	.byte	0x18
	.4byte	.LASF75
	.byte	0x6
	.2byte	0x26c
	.byte	0x14
	.4byte	0x6fb
	.byte	0x8
	.byte	0x18
	.4byte	.LASF76
	.byte	0x6
	.2byte	0x26c
	.byte	0x1e
	.4byte	0x6fb
	.byte	0xc
	.byte	0x18
	.4byte	.LASF77
	.byte	0x6
	.2byte	0x26e
	.byte	0x7
	.4byte	0x25
	.byte	0x10
	.byte	0x18
	.4byte	.LASF78
	.byte	0x6
	.2byte	0x26f
	.byte	0x8
	.4byte	0x8fb
	.byte	0x14
	.byte	0x18
	.4byte	.LASF79
	.byte	0x6
	.2byte	0x272
	.byte	0x7
	.4byte	0x25
	.byte	0x30
	.byte	0x18
	.4byte	.LASF80
	.byte	0x6
	.2byte	0x273
	.byte	0x16
	.4byte	0x910
	.byte	0x34
	.byte	0x18
	.4byte	.LASF81
	.byte	0x6
	.2byte	0x275
	.byte	0x7
	.4byte	0x25
	.byte	0x38
	.byte	0x18
	.4byte	.LASF82
	.byte	0x6
	.2byte	0x277
	.byte	0xa
	.4byte	0x921
	.byte	0x3c
	.byte	0x18
	.4byte	.LASF83
	.byte	0x6
	.2byte	0x27a
	.byte	0x13
	.4byte	0x1f0
	.byte	0x40
	.byte	0x18
	.4byte	.LASF84
	.byte	0x6
	.2byte	0x27b
	.byte	0x7
	.4byte	0x25
	.byte	0x44
	.byte	0x18
	.4byte	.LASF85
	.byte	0x6
	.2byte	0x27c
	.byte	0x13
	.4byte	0x1f0
	.byte	0x48
	.byte	0x18
	.4byte	.LASF86
	.byte	0x6
	.2byte	0x27d
	.byte	0x14
	.4byte	0x927
	.byte	0x4c
	.byte	0x18
	.4byte	.LASF87
	.byte	0x6
	.2byte	0x280
	.byte	0x7
	.4byte	0x25
	.byte	0x50
	.byte	0x18
	.4byte	.LASF88
	.byte	0x6
	.2byte	0x281
	.byte	0x9
	.4byte	0x621
	.byte	0x54
	.byte	0x18
	.4byte	.LASF89
	.byte	0x6
	.2byte	0x2a4
	.byte	0x7
	.4byte	0x8d6
	.byte	0x58
	.byte	0x19
	.4byte	.LASF49
	.byte	0x6
	.2byte	0x2a8
	.byte	0x13
	.4byte	0x321
	.2byte	0x148
	.byte	0x19
	.4byte	.LASF90
	.byte	0x6
	.2byte	0x2a9
	.byte	0x12
	.4byte	0x2de
	.2byte	0x14c
	.byte	0x19
	.4byte	.LASF91
	.byte	0x6
	.2byte	0x2ad
	.byte	0xc
	.4byte	0x938
	.2byte	0x2dc
	.byte	0x19
	.4byte	.LASF92
	.byte	0x6
	.2byte	0x2b2
	.byte	0x10
	.4byte	0x6bc
	.2byte	0x2e0
	.byte	0x19
	.4byte	.LASF93
	.byte	0x6
	.2byte	0x2b4
	.byte	0xa
	.4byte	0x944
	.2byte	0x2ec
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0xd3
	.byte	0x7
	.byte	0x4
	.4byte	0x4af
	.byte	0x15
	.4byte	0x104
	.4byte	0x64b
	.byte	0x16
	.4byte	0x4cd
	.byte	0x16
	.4byte	0xa7
	.byte	0x16
	.4byte	0xcd
	.byte	0x16
	.4byte	0x25
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x62d
	.byte	0x15
	.4byte	0xf8
	.4byte	0x66f
	.byte	0x16
	.4byte	0x4cd
	.byte	0x16
	.4byte	0xa7
	.byte	0x16
	.4byte	0xf8
	.byte	0x16
	.4byte	0x25
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x651
	.byte	0x15
	.4byte	0x25
	.4byte	0x689
	.byte	0x16
	.4byte	0x4cd
	.byte	0x16
	.4byte	0xa7
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x675
	.byte	0xc
	.4byte	0x73
	.4byte	0x69f
	.byte	0xd
	.4byte	0x2c
	.byte	0x2
	.byte	0
	.byte	0xc
	.4byte	0x73
	.4byte	0x6af
	.byte	0xd
	.4byte	0x2c
	.byte	0
	.byte	0
	.byte	0x9
	.4byte	.LASF94
	.byte	0x6
	.2byte	0x124
	.byte	0x18
	.4byte	0x36c
	.byte	0x1a
	.4byte	.LASF95
	.byte	0xc
	.byte	0x6
	.2byte	0x128
	.byte	0x8
	.4byte	0x6f5
	.byte	0x18
	.4byte	.LASF29
	.byte	0x6
	.2byte	0x12a
	.byte	0x11
	.4byte	0x6f5
	.byte	0
	.byte	0x18
	.4byte	.LASF96
	.byte	0x6
	.2byte	0x12b
	.byte	0x7
	.4byte	0x25
	.byte	0x4
	.byte	0x18
	.4byte	.LASF97
	.byte	0x6
	.2byte	0x12c
	.byte	0xb
	.4byte	0x6fb
	.byte	0x8
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x6bc
	.byte	0x7
	.byte	0x4
	.4byte	0x6af
	.byte	0x1a
	.4byte	.LASF98
	.byte	0xe
	.byte	0x6
	.2byte	0x144
	.byte	0x8
	.4byte	0x73a
	.byte	0x18
	.4byte	.LASF99
	.byte	0x6
	.2byte	0x145
	.byte	0x12
	.4byte	0x73a
	.byte	0
	.byte	0x18
	.4byte	.LASF100
	.byte	0x6
	.2byte	0x146
	.byte	0x12
	.4byte	0x73a
	.byte	0x6
	.byte	0x18
	.4byte	.LASF101
	.byte	0x6
	.2byte	0x147
	.byte	0x12
	.4byte	0x86
	.byte	0xc
	.byte	0
	.byte	0xc
	.4byte	0x86
	.4byte	0x74a
	.byte	0xd
	.4byte	0x2c
	.byte	0x2
	.byte	0
	.byte	0x1b
	.byte	0xd0
	.byte	0x6
	.2byte	0x285
	.byte	0x7
	.4byte	0x85f
	.byte	0x18
	.4byte	.LASF102
	.byte	0x6
	.2byte	0x287
	.byte	0x18
	.4byte	0x2c
	.byte	0
	.byte	0x18
	.4byte	.LASF103
	.byte	0x6
	.2byte	0x288
	.byte	0x12
	.4byte	0x621
	.byte	0x4
	.byte	0x18
	.4byte	.LASF104
	.byte	0x6
	.2byte	0x289
	.byte	0x10
	.4byte	0x85f
	.byte	0x8
	.byte	0x18
	.4byte	.LASF105
	.byte	0x6
	.2byte	0x28a
	.byte	0x17
	.4byte	0x206
	.byte	0x24
	.byte	0x18
	.4byte	.LASF106
	.byte	0x6
	.2byte	0x28b
	.byte	0xf
	.4byte	0x25
	.byte	0x48
	.byte	0x18
	.4byte	.LASF107
	.byte	0x6
	.2byte	0x28c
	.byte	0x2c
	.4byte	0xa0
	.byte	0x50
	.byte	0x18
	.4byte	.LASF108
	.byte	0x6
	.2byte	0x28d
	.byte	0x1a
	.4byte	0x701
	.byte	0x58
	.byte	0x18
	.4byte	.LASF109
	.byte	0x6
	.2byte	0x28e
	.byte	0x16
	.4byte	0x166
	.byte	0x68
	.byte	0x18
	.4byte	.LASF110
	.byte	0x6
	.2byte	0x28f
	.byte	0x16
	.4byte	0x166
	.byte	0x70
	.byte	0x18
	.4byte	.LASF111
	.byte	0x6
	.2byte	0x290
	.byte	0x16
	.4byte	0x166
	.byte	0x78
	.byte	0x18
	.4byte	.LASF112
	.byte	0x6
	.2byte	0x291
	.byte	0x10
	.4byte	0x86f
	.byte	0x80
	.byte	0x18
	.4byte	.LASF113
	.byte	0x6
	.2byte	0x292
	.byte	0x10
	.4byte	0x87f
	.byte	0x88
	.byte	0x18
	.4byte	.LASF114
	.byte	0x6
	.2byte	0x293
	.byte	0xf
	.4byte	0x25
	.byte	0xa0
	.byte	0x18
	.4byte	.LASF115
	.byte	0x6
	.2byte	0x294
	.byte	0x16
	.4byte	0x166
	.byte	0xa4
	.byte	0x18
	.4byte	.LASF116
	.byte	0x6
	.2byte	0x295
	.byte	0x16
	.4byte	0x166
	.byte	0xac
	.byte	0x18
	.4byte	.LASF117
	.byte	0x6
	.2byte	0x296
	.byte	0x16
	.4byte	0x166
	.byte	0xb4
	.byte	0x18
	.4byte	.LASF118
	.byte	0x6
	.2byte	0x297
	.byte	0x16
	.4byte	0x166
	.byte	0xbc
	.byte	0x18
	.4byte	.LASF119
	.byte	0x6
	.2byte	0x298
	.byte	0x16
	.4byte	0x166
	.byte	0xc4
	.byte	0x18
	.4byte	.LASF120
	.byte	0x6
	.2byte	0x299
	.byte	0x8
	.4byte	0x25
	.byte	0xcc
	.byte	0
	.byte	0xc
	.4byte	0xd3
	.4byte	0x86f
	.byte	0xd
	.4byte	0x2c
	.byte	0x19
	.byte	0
	.byte	0xc
	.4byte	0xd3
	.4byte	0x87f
	.byte	0xd
	.4byte	0x2c
	.byte	0x7
	.byte	0
	.byte	0xc
	.4byte	0xd3
	.4byte	0x88f
	.byte	0xd
	.4byte	0x2c
	.byte	0x17
	.byte	0
	.byte	0x1b
	.byte	0xf0
	.byte	0x6
	.2byte	0x29e
	.byte	0x7
	.4byte	0x8b6
	.byte	0x18
	.4byte	.LASF121
	.byte	0x6
	.2byte	0x2a1
	.byte	0x1b
	.4byte	0x8b6
	.byte	0
	.byte	0x18
	.4byte	.LASF122
	.byte	0x6
	.2byte	0x2a2
	.byte	0x18
	.4byte	0x8c6
	.byte	0x78
	.byte	0
	.byte	0xc
	.4byte	0x366
	.4byte	0x8c6
	.byte	0xd
	.4byte	0x2c
	.byte	0x1d
	.byte	0
	.byte	0xc
	.4byte	0x2c
	.4byte	0x8d6
	.byte	0xd
	.4byte	0x2c
	.byte	0x1d
	.byte	0
	.byte	0x1c
	.byte	0xf0
	.byte	0x6
	.2byte	0x283
	.byte	0x3
	.4byte	0x8fb
	.byte	0x1d
	.4byte	.LASF72
	.byte	0x6
	.2byte	0x29a
	.byte	0xb
	.4byte	0x74a
	.byte	0x1d
	.4byte	.LASF123
	.byte	0x6
	.2byte	0x2a3
	.byte	0xb
	.4byte	0x88f
	.byte	0
	.byte	0xc
	.4byte	0xd3
	.4byte	0x90b
	.byte	0xd
	.4byte	0x2c
	.byte	0x18
	.byte	0
	.byte	0x1e
	.4byte	.LASF145
	.byte	0x7
	.byte	0x4
	.4byte	0x90b
	.byte	0x1f
	.4byte	0x921
	.byte	0x16
	.4byte	0x4cd
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x916
	.byte	0x7
	.byte	0x4
	.4byte	0x1f0
	.byte	0x1f
	.4byte	0x938
	.byte	0x16
	.4byte	0x25
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x93e
	.byte	0x7
	.byte	0x4
	.4byte	0x92d
	.byte	0xc
	.4byte	0x6af
	.4byte	0x954
	.byte	0xd
	.4byte	0x2c
	.byte	0x2
	.byte	0
	.byte	0x20
	.4byte	.LASF125
	.byte	0x6
	.2byte	0x333
	.byte	0x17
	.4byte	0x4cd
	.byte	0x20
	.4byte	.LASF126
	.byte	0x6
	.2byte	0x334
	.byte	0x1d
	.4byte	0x4d3
	.byte	0x6
	.4byte	.LASF127
	.byte	0x8
	.byte	0x67
	.byte	0xe
	.4byte	0x621
	.byte	0x21
	.4byte	.LASF128
	.byte	0x1
	.byte	0xf
	.byte	0xa
	.4byte	0x7a
	.byte	0x5
	.byte	0x3
	.4byte	humidity
	.byte	0x21
	.4byte	.LASF129
	.byte	0x1
	.byte	0x10
	.byte	0x9
	.4byte	0x3a
	.byte	0x5
	.byte	0x3
	.4byte	temp
	.byte	0x6
	.4byte	.LASF130
	.byte	0x1
	.byte	0x11
	.byte	0xc
	.4byte	0x25
	.byte	0x22
	.4byte	.LASF146
	.byte	0x1
	.byte	0x1f
	.byte	0x6
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0xb7d
	.byte	0x23
	.4byte	.LASF147
	.byte	0x1
	.byte	0x1f
	.byte	0x15
	.4byte	0xa7
	.4byte	.LLST0
	.byte	0x24
	.4byte	.Ldebug_ranges0+0
	.byte	0x25
	.4byte	.LASF131
	.byte	0x1
	.byte	0x25
	.byte	0xd
	.4byte	0xb7d
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x25
	.4byte	.LASF132
	.byte	0x1
	.byte	0x42
	.byte	0xd
	.4byte	0x67
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0x26
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.4byte	0xa57
	.byte	0x27
	.string	"i"
	.byte	0x1
	.byte	0x31
	.byte	0xe
	.4byte	0x25
	.4byte	.LLST1
	.byte	0x28
	.4byte	.LVL13
	.4byte	0xc26
	.4byte	0xa21
	.byte	0x29
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x41
	.byte	0
	.byte	0x28
	.4byte	.LVL14
	.4byte	0xc32
	.4byte	0xa34
	.byte	0x29
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x4e
	.byte	0
	.byte	0x28
	.4byte	.LVL15
	.4byte	0xc26
	.4byte	0xa47
	.byte	0x29
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x41
	.byte	0
	.byte	0x2a
	.4byte	.LVL16
	.4byte	0xc26
	.byte	0x29
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x41
	.byte	0
	.byte	0
	.byte	0x2b
	.4byte	.LVL7
	.4byte	0xbf6
	.byte	0x2b
	.4byte	.LVL8
	.4byte	0xb8d
	.byte	0x28
	.4byte	.LVL9
	.4byte	0xc3e
	.4byte	0xa8c
	.byte	0x29
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x41
	.byte	0x29
	.byte	0x1
	.byte	0x5b
	.byte	0x4
	.byte	0x91
	.byte	0x48
	.byte	0x94
	.byte	0x1
	.byte	0x29
	.byte	0x1
	.byte	0x5c
	.byte	0x4
	.byte	0x91
	.byte	0x48
	.byte	0x94
	.byte	0x1
	.byte	0
	.byte	0x28
	.4byte	.LVL10
	.4byte	0xc26
	.4byte	0xa9f
	.byte	0x29
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x41
	.byte	0
	.byte	0x28
	.4byte	.LVL11
	.4byte	0xc26
	.4byte	0xab2
	.byte	0x29
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x41
	.byte	0
	.byte	0x28
	.4byte	.LVL12
	.4byte	0xc26
	.4byte	0xac5
	.byte	0x29
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x41
	.byte	0
	.byte	0x28
	.4byte	.LVL20
	.4byte	0xc4a
	.4byte	0xae0
	.byte	0x29
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x78
	.byte	0
	.byte	0x88
	.byte	0
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0
	.byte	0x2b
	.4byte	.LVL21
	.4byte	0xc56
	.byte	0x28
	.4byte	.LVL22
	.4byte	0xc56
	.4byte	0xb00
	.byte	0x29
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC2
	.byte	0
	.byte	0x28
	.4byte	.LVL23
	.4byte	0xc56
	.4byte	0xb17
	.byte	0x29
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC3
	.byte	0
	.byte	0x28
	.4byte	.LVL24
	.4byte	0xc62
	.4byte	0xb2c
	.byte	0x29
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xa
	.2byte	0x2710
	.byte	0
	.byte	0x2a
	.4byte	.LVL26
	.4byte	0xc56
	.byte	0x29
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0x29
	.byte	0x1
	.byte	0x5b
	.byte	0x18
	.byte	0x91
	.byte	0x4a
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x38
	.byte	0x24
	.byte	0x91
	.byte	0x4b
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x21
	.byte	0x40
	.byte	0x24
	.byte	0x40
	.byte	0x26
	.byte	0x78
	.byte	0
	.byte	0x1b
	.byte	0x29
	.byte	0x1
	.byte	0x5c
	.byte	0x1c
	.byte	0x91
	.byte	0x4a
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x38
	.byte	0x24
	.byte	0x91
	.byte	0x4b
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x21
	.byte	0x40
	.byte	0x24
	.byte	0x40
	.byte	0x26
	.byte	0x78
	.byte	0
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0
	.byte	0
	.byte	0
	.byte	0xc
	.4byte	0x67
	.4byte	0xb8d
	.byte	0xd
	.4byte	0x2c
	.byte	0x4
	.byte	0
	.byte	0x2c
	.4byte	.LASF133
	.byte	0x1
	.byte	0x16
	.byte	0x6
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0xbf6
	.byte	0x28
	.4byte	.LVL1
	.4byte	0xc6f
	.4byte	0xbbb
	.byte	0x29
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x41
	.byte	0x29
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x28
	.4byte	.LVL2
	.4byte	0xc62
	.4byte	0xbce
	.byte	0x29
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x28
	.4byte	.LVL3
	.4byte	0xc6f
	.4byte	0xbe6
	.byte	0x29
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x41
	.byte	0x29
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x2d
	.4byte	.LVL4
	.4byte	0xc32
	.byte	0x29
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x4e
	.byte	0
	.byte	0
	.byte	0x2c
	.4byte	.LASF134
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0xc26
	.byte	0x2d
	.4byte	.LVL0
	.4byte	0xc7b
	.byte	0x29
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x41
	.byte	0x29
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0x29
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0x2e
	.4byte	.LASF135
	.4byte	.LASF135
	.byte	0x9
	.byte	0x30
	.byte	0x5
	.byte	0x2e
	.4byte	.LASF136
	.4byte	.LASF136
	.byte	0xa
	.byte	0x22
	.byte	0x6
	.byte	0x2e
	.4byte	.LASF137
	.4byte	.LASF137
	.byte	0x9
	.byte	0x2d
	.byte	0x5
	.byte	0x2f
	.string	"abs"
	.string	"abs"
	.byte	0x8
	.byte	0x46
	.byte	0x5
	.byte	0x2e
	.4byte	.LASF138
	.4byte	.LASF138
	.byte	0xb
	.byte	0xc8
	.byte	0x5
	.byte	0x30
	.4byte	.LASF139
	.4byte	.LASF139
	.byte	0xc
	.2byte	0x2f6
	.byte	0x6
	.byte	0x2e
	.4byte	.LASF140
	.4byte	.LASF140
	.byte	0x9
	.byte	0x2e
	.byte	0x5
	.byte	0x2e
	.4byte	.LASF141
	.4byte	.LASF141
	.byte	0x9
	.byte	0x2c
	.byte	0x5
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0x1b
	.byte	0xe
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x17
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x13
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x13
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0x17
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x13
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x1f
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x20
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x21
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x22
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x23
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x24
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x25
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x26
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x27
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x28
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x29
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x2a
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2b
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2c
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2d
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x95,0x42
	.byte	0x19
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2e
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0x6e
	.byte	0xe
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x2f
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0x6e
	.byte	0x8
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x30
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0x6e
	.byte	0xe
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL6
	.4byte	.LFE6
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL17
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x68
	.4byte	.LVL25
	.4byte	.LFE6
	.2byte	0x1
	.byte	0x68
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LBB2
	.4byte	.LBE2
	.4byte	.LBB4
	.4byte	.LBE4
	.4byte	.LBB5
	.4byte	.LBE5
	.4byte	0
	.4byte	0
	.4byte	.LFB4
	.4byte	.LFE4
	.4byte	.LFB5
	.4byte	.LFE5
	.4byte	.LFB6
	.4byte	.LFE6
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF44:
	.string	"_on_exit_args"
.LASF133:
	.string	"sendStartSignal"
.LASF111:
	.string	"_wctomb_state"
.LASF108:
	.string	"_r48"
.LASF144:
	.string	"D:\\\\BL602\\\\final_code\\\\build_2\\\\build_out\\\\main2_file"
.LASF113:
	.string	"_signal_buf"
.LASF0:
	.string	"unsigned int"
.LASF58:
	.string	"_lbfsize"
.LASF56:
	.string	"_flags"
.LASF73:
	.string	"_errno"
.LASF27:
	.string	"_LOCK_RECURSIVE_T"
.LASF60:
	.string	"_read"
.LASF115:
	.string	"_mbrlen_state"
.LASF75:
	.string	"_stdout"
.LASF19:
	.string	"_fpos_t"
.LASF51:
	.string	"_fns"
.LASF59:
	.string	"_cookie"
.LASF33:
	.string	"_Bigint"
.LASF41:
	.string	"__tm_wday"
.LASF83:
	.string	"_result"
.LASF11:
	.string	"uint32_t"
.LASF37:
	.string	"__tm_hour"
.LASF23:
	.string	"__count"
.LASF132:
	.string	"checksum"
.LASF36:
	.string	"__tm_min"
.LASF125:
	.string	"_impure_ptr"
.LASF121:
	.string	"_nextf"
.LASF3:
	.string	"int16_t"
.LASF98:
	.string	"_rand48"
.LASF84:
	.string	"_result_k"
.LASF13:
	.string	"long long unsigned int"
.LASF104:
	.string	"_asctime_buf"
.LASF55:
	.string	"__sFILE"
.LASF32:
	.string	"_wds"
.LASF94:
	.string	"__FILE"
.LASF67:
	.string	"_offset"
.LASF78:
	.string	"_emergency"
.LASF143:
	.string	"D:/BL602/final_code/build_2/main2_file/dht.c"
.LASF124:
	.string	"TrapNetCounter"
.LASF35:
	.string	"__tm_sec"
.LASF127:
	.string	"suboptarg"
.LASF42:
	.string	"__tm_yday"
.LASF77:
	.string	"_inc"
.LASF50:
	.string	"_ind"
.LASF29:
	.string	"_next"
.LASF117:
	.string	"_mbsrtowcs_state"
.LASF139:
	.string	"vTaskDelay"
.LASF24:
	.string	"__value"
.LASF135:
	.string	"bl_gpio_input_get_value"
.LASF85:
	.string	"_p5s"
.LASF119:
	.string	"_wcsrtombs_state"
.LASF109:
	.string	"_mblen_state"
.LASF16:
	.string	"char"
.LASF38:
	.string	"__tm_mday"
.LASF91:
	.string	"_sig_func"
.LASF116:
	.string	"_mbrtowc_state"
.LASF90:
	.string	"_atexit0"
.LASF28:
	.string	"_flock_t"
.LASF146:
	.string	"task_dht"
.LASF21:
	.string	"__wch"
.LASF97:
	.string	"_iobs"
.LASF7:
	.string	"uint8_t"
.LASF63:
	.string	"_close"
.LASF81:
	.string	"__sdidinit"
.LASF74:
	.string	"_stdin"
.LASF106:
	.string	"_gamma_signgam"
.LASF6:
	.string	"long long int"
.LASF138:
	.string	"printf"
.LASF53:
	.string	"_base"
.LASF86:
	.string	"_freelist"
.LASF100:
	.string	"_mult"
.LASF26:
	.string	"__ULong"
.LASF118:
	.string	"_wcrtomb_state"
.LASF14:
	.string	"BaseType_t"
.LASF57:
	.string	"_file"
.LASF82:
	.string	"__cleanup"
.LASF25:
	.string	"_mbstate_t"
.LASF142:
	.string	"GNU C99 8.3.0 -march=rv32imfc -mabi=ilp32f -gdwarf -Os -std=gnu99 -ffunction-sections -fdata-sections -fstrict-volatile-bitfields -fshort-enums -ffreestanding -fno-strict-aliasing"
.LASF45:
	.string	"_fnargs"
.LASF43:
	.string	"__tm_isdst"
.LASF120:
	.string	"_h_errno"
.LASF15:
	.string	"TickType_t"
.LASF131:
	.string	"data"
.LASF137:
	.string	"bl_gpio_enable_input"
.LASF39:
	.string	"__tm_mon"
.LASF9:
	.string	"uint16_t"
.LASF61:
	.string	"_write"
.LASF130:
	.string	"buzz"
.LASF49:
	.string	"_atexit"
.LASF70:
	.string	"_mbstate"
.LASF140:
	.string	"bl_gpio_output_set"
.LASF2:
	.string	"short int"
.LASF147:
	.string	"pvParameters"
.LASF5:
	.string	"long int"
.LASF93:
	.string	"__sf"
.LASF31:
	.string	"_sign"
.LASF129:
	.string	"temp"
.LASF68:
	.string	"_data"
.LASF22:
	.string	"__wchb"
.LASF126:
	.string	"_global_impure_ptr"
.LASF40:
	.string	"__tm_year"
.LASF105:
	.string	"_localtime_buf"
.LASF123:
	.string	"_unused"
.LASF89:
	.string	"_new"
.LASF87:
	.string	"_cvtlen"
.LASF30:
	.string	"_maxwds"
.LASF112:
	.string	"_l64a_buf"
.LASF136:
	.string	"bl_timer_delay_us"
.LASF66:
	.string	"_blksize"
.LASF34:
	.string	"__tm"
.LASF69:
	.string	"_lock"
.LASF12:
	.string	"long unsigned int"
.LASF96:
	.string	"_niobs"
.LASF17:
	.string	"wint_t"
.LASF4:
	.string	"int32_t"
.LASF46:
	.string	"_dso_handle"
.LASF88:
	.string	"_cvtbuf"
.LASF8:
	.string	"unsigned char"
.LASF114:
	.string	"_getdate_err"
.LASF101:
	.string	"_add"
.LASF52:
	.string	"__sbuf"
.LASF141:
	.string	"bl_gpio_enable_output"
.LASF95:
	.string	"_glue"
.LASF92:
	.string	"__sglue"
.LASF103:
	.string	"_strtok_last"
.LASF110:
	.string	"_mbtowc_state"
.LASF80:
	.string	"_locale"
.LASF20:
	.string	"_ssize_t"
.LASF1:
	.string	"signed char"
.LASF72:
	.string	"_reent"
.LASF10:
	.string	"short unsigned int"
.LASF134:
	.string	"initiateGPIO"
.LASF47:
	.string	"_fntypes"
.LASF54:
	.string	"_size"
.LASF18:
	.string	"_off_t"
.LASF65:
	.string	"_nbuf"
.LASF102:
	.string	"_unused_rand"
.LASF79:
	.string	"_unspecified_locale_info"
.LASF128:
	.string	"humidity"
.LASF71:
	.string	"_flags2"
.LASF48:
	.string	"_is_cxa"
.LASF99:
	.string	"_seed"
.LASF107:
	.string	"_rand_next"
.LASF145:
	.string	"__locale_t"
.LASF62:
	.string	"_seek"
.LASF76:
	.string	"_stderr"
.LASF122:
	.string	"_nmalloc"
.LASF64:
	.string	"_ubuf"
	.ident	"GCC: (SiFive GCC 8.3.0-2019.08.0) 8.3.0"
