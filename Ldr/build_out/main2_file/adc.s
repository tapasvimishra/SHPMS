	.file	"adc.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_f2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.init_adc,"ax",@progbits
	.align	1
	.globl	init_adc
	.type	init_adc, @function
init_adc:
.LFB29:
	.file 1 "D:/BL602/final_code/build_2/main2_file/adc.c"
	.loc 1 122 28
	.cfi_startproc
.LVL0:
	.loc 1 124 3
	li	a5,15
	bgtu	a0,a5,.L7
	.loc 1 122 28 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s1,4(sp)
	li	a4,65536
	.cfi_offset 9, -12
	li	s1,1
	sll	a5,s1,a0
	addi	a4,a4,-400
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	and	a5,a5,a4
	beq	a5,zero,.L1
	mv	s0,a0
	.loc 1 135 7 is_stmt 1
	.loc 1 142 3
	li	a1,4096
	li	a0,1
.LVL1:
	call	bl_adc_freq_init
.LVL2:
	.loc 1 145 3
	mv	a1,s0
	li	a0,1
	call	bl_adc_init
.LVL3:
	.loc 1 148 3
.LBB6:
.LBB7:
	.loc 1 93 3
	.loc 1 93 12 is_stmt 0
	li	a3,1073807360
	lw	a5,-1772(a3)
.LVL4:
	.loc 1 96 3 is_stmt 1
	.loc 1 97 3
	.loc 1 100 3
	.loc 1 101 5
	.loc 1 107 3
	li	a4,-264355840
	addi	a4,a4,-1
	and	a5,a5,a4
.LVL5:
	.loc 1 108 3
	.loc 1 109 5
	.loc 1 109 9 is_stmt 0
	li	a4,37822464
	or	a5,a5,a4
.LVL6:
	.loc 1 115 3 is_stmt 1
	.loc 1 115 59 is_stmt 0
	sw	a5,-1772(a3)
	.loc 1 116 3 is_stmt 1
.LVL7:
.LBE7:
.LBE6:
	.loc 1 151 3
	li	a1,1024
	li	a0,1
	call	bl_adc_dma_init
.LVL8:
	.loc 1 154 3
	mv	a0,s0
	call	bl_adc_gpio_init
.LVL9:
	.loc 1 157 3
	.loc 1 157 17 is_stmt 0
	mv	a0,s0
	call	bl_adc_get_channel_by_gpio
.LVL10:
	mv	s0,a0
.LVL11:
	.loc 1 158 3 is_stmt 1
	.loc 1 158 20 is_stmt 0
	li	a0,1
	call	bl_dma_find_ctx_by_channel
.LVL12:
	.loc 1 159 3 is_stmt 1
	.loc 1 159 26 is_stmt 0
	lw	a5,16(a0)
	.loc 1 159 32
	sll	s1,s1,s0
	.loc 1 159 26
	or	s1,a5,s1
	sw	s1,16(a0)
	.loc 1 162 3 is_stmt 1
	.loc 1 163 1 is_stmt 0
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
.LVL13:
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	.loc 1 162 3
	tail	bl_adc_start
.LVL14:
.L1:
	.cfi_restore_state
	.loc 1 163 1
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L7:
	ret
	.cfi_endproc
.LFE29:
	.size	init_adc, .-init_adc
	.section	.text.read_adc,"ax",@progbits
	.align	1
	.globl	read_adc
	.type	read_adc, @function
read_adc:
.LFB30:
	.loc 1 165 21 is_stmt 1
	.cfi_startproc
	.loc 1 167 3
	.loc 1 170 3
	.loc 1 165 21 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 170 20
	li	a0,1
	.loc 1 165 21
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.loc 1 170 20
	call	bl_dma_find_ctx_by_channel
.LVL15:
	.loc 1 173 3 is_stmt 1
	.loc 1 173 11 is_stmt 0
	lw	a1,4(a0)
	li	a0,0
.LVL16:
	.loc 1 173 6
	beq	a1,zero,.L10
	.loc 1 178 3 is_stmt 1
	lui	s0,%hi(adc_data.4430)
	li	a2,4096
	addi	a0,s0,%lo(adc_data.4430)
	call	memcpy
.LVL17:
	.loc 1 185 3
	.loc 1 186 3
	.loc 1 186 8
	addi	a5,s0,%lo(adc_data.4430)
	li	a3,4096
.LBB12:
.LBB13:
.LBB14:
.LBB15:
	.loc 1 188 37 is_stmt 0
	li	a1,65536
	.loc 1 188 47
	li	a2,32768
	add	a3,a5,a3
.LBE15:
.LBE14:
	.loc 1 185 12
	li	a0,0
.LBB17:
.LBB16:
	.loc 1 188 37
	addi	a1,a1,-1
	.loc 1 188 47
	addi	a2,a2,-768
.LVL18:
.L12:
	.loc 1 188 5 is_stmt 1
	.loc 1 189 5
	.loc 1 188 37 is_stmt 0
	lw	a4,0(a5)
	addi	a5,a5,4
.LVL19:
	and	a4,a4,a1
.LVL20:
	.loc 1 188 47
	mul	a4,a4,a2
	.loc 1 188 14
	srli	a4,a4,16
	.loc 1 189 9
	add	a0,a0,a4
.LVL21:
.LBE16:
	.loc 1 186 3
	bne	a3,a5,.L12
.LBE17:
	.loc 1 192 3 is_stmt 1
	.loc 1 192 13 is_stmt 0
	srli	a0,a0,10
.LVL22:
.L10:
.LBE13:
.LBE12:
	.loc 1 193 1
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE30:
	.size	read_adc, .-read_adc
	.section	.text.task_adc,"ax",@progbits
	.align	1
	.globl	task_adc
	.type	task_adc, @function
task_adc:
.LFB27:
	.loc 1 37 1 is_stmt 1
	.cfi_startproc
.LVL23:
	.loc 1 41 3
	.loc 1 37 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	.loc 1 41 3
	li	a0,5
.LVL24:
	.loc 1 37 1
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s3,12(sp)
	sw	s2,16(sp)
	sw	s4,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 19, -20
	.cfi_offset 18, -16
	.cfi_offset 20, -24
	.loc 1 41 3
	call	init_adc
.LVL25:
	.loc 1 45 3 is_stmt 1
	li	a5,114688
	addi	a5,a5,512
	li	a4,255
	li	a3,255
	li	a2,3
	li	a1,4
	li	a0,1
.LBB18:
	.loc 1 61 5 is_stmt 0
	li	s0,4096
	.loc 1 64 8
	li	s1,12288
.LBE18:
	.loc 1 45 3
	call	bl_uart_init
.LVL26:
.LBB19:
	.loc 1 61 5
	addi	s0,s0,904
	.loc 1 62 5
	lui	s3,%hi(.LC0)
	.loc 1 64 8
	addi	s1,s1,1712
.L20:
.LBE19:
	.loc 1 54 3 is_stmt 1
.LBB20:
	.loc 1 55 5
	li	a2,0
	li	a1,0
	li	a0,11
	call	bl_gpio_enable_output
.LVL27:
	.loc 1 56 5
	li	a2,0
	li	a1,0
	li	a0,14
	call	bl_gpio_enable_output
.LVL28:
	.loc 1 57 5
	.loc 1 57 29 is_stmt 0
	call	read_adc
.LVL29:
	.loc 1 57 13
	slli	s2,a0,16
	.loc 1 60 28
	li	a0,1
	call	bl_uart_data_recv
.LVL30:
	mv	s4,a0
	.loc 1 61 5
	mv	a0,s0
	call	vTaskDelay
.LVL31:
	.loc 1 57 13
	srai	s2,s2,16
.LVL32:
	.loc 1 60 5 is_stmt 1
	.loc 1 61 5
	.loc 1 62 5
	slli	a1,s4,16
	mv	a2,s2
	srai	a1,a1,16
	addi	a0,s3,%lo(.LC0)
	call	printf
.LVL33:
	.loc 1 64 5
	.loc 1 64 8 is_stmt 0
	ble	s2,s1,.L18
	.loc 1 65 7 is_stmt 1
	li	a1,1
	li	a0,11
	call	bl_gpio_output_set
.LVL34:
	.loc 1 66 7
	li	a1,0
.L22:
	.loc 1 76 7 is_stmt 0
	li	a0,14
	call	bl_gpio_output_set
.LVL35:
	.loc 1 83 5 is_stmt 1
	mv	a0,s0
	call	vTaskDelay
.LVL36:
.LBE20:
	.loc 1 54 13 is_stmt 0
	j	.L20
.L18:
.LBB21:
	.loc 1 75 7 is_stmt 1
	li	a1,0
	li	a0,11
	call	bl_gpio_output_set
.LVL37:
	.loc 1 76 7
	li	a1,1
	j	.L22
.LBE21:
	.cfi_endproc
.LFE27:
	.size	task_adc, .-task_adc
	.section	.bss.adc_data.4430,"aw",@nobits
	.align	2
	.type	adc_data.4430, @object
	.size	adc_data.4430, 4096
adc_data.4430:
	.zero	4096
	.section	.rodata.task_adc.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"LDR=%d:SOIL_M=%d\n"
	.text
.Letext0:
	.file 2 "d:\\bl602\\newbl602_sdk\\bl_iot_sdk\\toolchain\\riscv\\msys\\lib\\gcc\\riscv64-unknown-elf\\8.3.0\\include\\stdint-gcc.h"
	.file 3 "D:/BL602/NewBl602_sdk/bl_iot_sdk/components/bl602/freertos_riscv_ram/portable/GCC/RISC-V/portmacro.h"
	.file 4 "d:\\bl602\\newbl602_sdk\\bl_iot_sdk\\toolchain\\riscv\\msys\\lib\\gcc\\riscv64-unknown-elf\\8.3.0\\include\\stddef.h"
	.file 5 "d:\\bl602\\newbl602_sdk\\bl_iot_sdk\\toolchain\\riscv\\msys\\riscv64-unknown-elf\\include\\sys\\_types.h"
	.file 6 "d:\\bl602\\newbl602_sdk\\bl_iot_sdk\\toolchain\\riscv\\msys\\riscv64-unknown-elf\\include\\sys\\reent.h"
	.file 7 "d:\\bl602\\newbl602_sdk\\bl_iot_sdk\\toolchain\\riscv\\msys\\riscv64-unknown-elf\\include\\sys\\lock.h"
	.file 8 "D:/BL602/NewBl602_sdk/bl_iot_sdk/components/bl602/bl602_std/bl602_std/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.h"
	.file 9 "D:/BL602/NewBl602_sdk/bl_iot_sdk/components/bl602/bl602_std/bl602_std/StdDriver/Inc/bl602_common.h"
	.file 10 "D:/BL602/NewBl602_sdk/bl_iot_sdk/components/hal_drv/bl602_hal/bl_adc.h"
	.file 11 "D:/BL602/NewBl602_sdk/bl_iot_sdk/components/hal_drv/bl602_hal/bl_dma.h"
	.file 12 "D:/BL602/NewBl602_sdk/bl_iot_sdk/components/hal_drv/bl602_hal/bl_gpio.h"
	.file 13 "D:/BL602/NewBl602_sdk/bl_iot_sdk/components/hal_drv/bl602_hal/bl_uart.h"
	.file 14 "D:/BL602/NewBl602_sdk/bl_iot_sdk/components/bl602/freertos_riscv_ram/config/task.h"
	.file 15 "d:\\bl602\\newbl602_sdk\\bl_iot_sdk\\toolchain\\riscv\\msys\\riscv64-unknown-elf\\include\\stdio.h"
	.file 16 "d:\\bl602\\newbl602_sdk\\bl_iot_sdk\\toolchain\\riscv\\msys\\riscv64-unknown-elf\\include\\string.h"
	.file 17 "D:/BL602/NewBl602_sdk/bl_iot_sdk/components/bl602/bl602_std/bl602_std/StdDriver/Inc/bl602_adc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xef4
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF170
	.byte	0xc
	.4byte	.LASF171
	.4byte	.LASF172
	.4byte	.Ldebug_ranges0+0x58
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
	.byte	0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF9
	.byte	0x4
	.4byte	.LASF10
	.byte	0x2
	.byte	0x34
	.byte	0x1b
	.4byte	0x8d
	.byte	0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.byte	0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF12
	.byte	0x5
	.byte	0x4
	.byte	0x4
	.4byte	.LASF13
	.byte	0x3
	.byte	0x3f
	.byte	0x11
	.4byte	0x4d
	.byte	0x4
	.4byte	.LASF14
	.byte	0x3
	.byte	0x41
	.byte	0x12
	.4byte	0x81
	.byte	0x6
	.4byte	.LASF123
	.byte	0x3
	.byte	0x54
	.byte	0x13
	.4byte	0x9d
	.byte	0x7
	.byte	0x4
	.4byte	0xce
	.byte	0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF15
	.byte	0x8
	.4byte	0xc7
	.byte	0x9
	.4byte	.LASF16
	.byte	0x4
	.2byte	0x165
	.byte	0x16
	.4byte	0x2c
	.byte	0x4
	.4byte	.LASF17
	.byte	0x5
	.byte	0x2e
	.byte	0xe
	.4byte	0x59
	.byte	0x4
	.4byte	.LASF18
	.byte	0x5
	.byte	0x74
	.byte	0xe
	.4byte	0x59
	.byte	0x4
	.4byte	.LASF19
	.byte	0x5
	.byte	0x93
	.byte	0x14
	.4byte	0x25
	.byte	0xa
	.byte	0x4
	.byte	0x5
	.byte	0xa5
	.byte	0x3
	.4byte	0x126
	.byte	0xb
	.4byte	.LASF20
	.byte	0x5
	.byte	0xa7
	.byte	0xc
	.4byte	0xd3
	.byte	0xb
	.4byte	.LASF21
	.byte	0x5
	.byte	0xa8
	.byte	0x13
	.4byte	0x126
	.byte	0
	.byte	0xc
	.4byte	0x73
	.4byte	0x136
	.byte	0xd
	.4byte	0x2c
	.byte	0x3
	.byte	0
	.byte	0xe
	.byte	0x8
	.byte	0x5
	.byte	0xa2
	.byte	0x9
	.4byte	0x15a
	.byte	0xf
	.4byte	.LASF22
	.byte	0x5
	.byte	0xa4
	.byte	0x7
	.4byte	0x25
	.byte	0
	.byte	0xf
	.4byte	.LASF23
	.byte	0x5
	.byte	0xa9
	.byte	0x5
	.4byte	0x104
	.byte	0x4
	.byte	0
	.byte	0x4
	.4byte	.LASF24
	.byte	0x5
	.byte	0xaa
	.byte	0x3
	.4byte	0x136
	.byte	0x4
	.4byte	.LASF25
	.byte	0x6
	.byte	0x16
	.byte	0x17
	.4byte	0x8d
	.byte	0x4
	.4byte	.LASF26
	.byte	0x7
	.byte	0xc
	.byte	0xd
	.4byte	0x25
	.byte	0x4
	.4byte	.LASF27
	.byte	0x6
	.byte	0x23
	.byte	0x1b
	.4byte	0x172
	.byte	0x10
	.4byte	.LASF32
	.byte	0x18
	.byte	0x6
	.byte	0x34
	.byte	0x8
	.4byte	0x1e4
	.byte	0xf
	.4byte	.LASF28
	.byte	0x6
	.byte	0x36
	.byte	0x13
	.4byte	0x1e4
	.byte	0
	.byte	0x11
	.string	"_k"
	.byte	0x6
	.byte	0x37
	.byte	0x7
	.4byte	0x25
	.byte	0x4
	.byte	0xf
	.4byte	.LASF29
	.byte	0x6
	.byte	0x37
	.byte	0xb
	.4byte	0x25
	.byte	0x8
	.byte	0xf
	.4byte	.LASF30
	.byte	0x6
	.byte	0x37
	.byte	0x14
	.4byte	0x25
	.byte	0xc
	.byte	0xf
	.4byte	.LASF31
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
	.4byte	0x1ea
	.byte	0x14
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x18a
	.byte	0xc
	.4byte	0x166
	.4byte	0x1fa
	.byte	0xd
	.4byte	0x2c
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF33
	.byte	0x24
	.byte	0x6
	.byte	0x3c
	.byte	0x8
	.4byte	0x27d
	.byte	0xf
	.4byte	.LASF34
	.byte	0x6
	.byte	0x3e
	.byte	0x7
	.4byte	0x25
	.byte	0
	.byte	0xf
	.4byte	.LASF35
	.byte	0x6
	.byte	0x3f
	.byte	0x7
	.4byte	0x25
	.byte	0x4
	.byte	0xf
	.4byte	.LASF36
	.byte	0x6
	.byte	0x40
	.byte	0x7
	.4byte	0x25
	.byte	0x8
	.byte	0xf
	.4byte	.LASF37
	.byte	0x6
	.byte	0x41
	.byte	0x7
	.4byte	0x25
	.byte	0xc
	.byte	0xf
	.4byte	.LASF38
	.byte	0x6
	.byte	0x42
	.byte	0x7
	.4byte	0x25
	.byte	0x10
	.byte	0xf
	.4byte	.LASF39
	.byte	0x6
	.byte	0x43
	.byte	0x7
	.4byte	0x25
	.byte	0x14
	.byte	0xf
	.4byte	.LASF40
	.byte	0x6
	.byte	0x44
	.byte	0x7
	.4byte	0x25
	.byte	0x18
	.byte	0xf
	.4byte	.LASF41
	.byte	0x6
	.byte	0x45
	.byte	0x7
	.4byte	0x25
	.byte	0x1c
	.byte	0xf
	.4byte	.LASF42
	.byte	0x6
	.byte	0x46
	.byte	0x7
	.4byte	0x25
	.byte	0x20
	.byte	0
	.byte	0x12
	.4byte	.LASF43
	.2byte	0x108
	.byte	0x6
	.byte	0x4f
	.byte	0x8
	.4byte	0x2c2
	.byte	0xf
	.4byte	.LASF44
	.byte	0x6
	.byte	0x50
	.byte	0x9
	.4byte	0x2c2
	.byte	0
	.byte	0xf
	.4byte	.LASF45
	.byte	0x6
	.byte	0x51
	.byte	0x9
	.4byte	0x2c2
	.byte	0x80
	.byte	0x13
	.4byte	.LASF46
	.byte	0x6
	.byte	0x53
	.byte	0xa
	.4byte	0x166
	.2byte	0x100
	.byte	0x13
	.4byte	.LASF47
	.byte	0x6
	.byte	0x56
	.byte	0xa
	.4byte	0x166
	.2byte	0x104
	.byte	0
	.byte	0xc
	.4byte	0x9b
	.4byte	0x2d2
	.byte	0xd
	.4byte	0x2c
	.byte	0x1f
	.byte	0
	.byte	0x12
	.4byte	.LASF48
	.2byte	0x190
	.byte	0x6
	.byte	0x62
	.byte	0x8
	.4byte	0x315
	.byte	0xf
	.4byte	.LASF28
	.byte	0x6
	.byte	0x63
	.byte	0x12
	.4byte	0x315
	.byte	0
	.byte	0xf
	.4byte	.LASF49
	.byte	0x6
	.byte	0x64
	.byte	0x6
	.4byte	0x25
	.byte	0x4
	.byte	0xf
	.4byte	.LASF50
	.byte	0x6
	.byte	0x66
	.byte	0x9
	.4byte	0x31b
	.byte	0x8
	.byte	0xf
	.4byte	.LASF43
	.byte	0x6
	.byte	0x67
	.byte	0x1e
	.4byte	0x27d
	.byte	0x88
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x2d2
	.byte	0xc
	.4byte	0x32b
	.4byte	0x32b
	.byte	0xd
	.4byte	0x2c
	.byte	0x1f
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x331
	.byte	0x14
	.byte	0x10
	.4byte	.LASF51
	.byte	0x8
	.byte	0x6
	.byte	0x7a
	.byte	0x8
	.4byte	0x35a
	.byte	0xf
	.4byte	.LASF52
	.byte	0x6
	.byte	0x7b
	.byte	0x11
	.4byte	0x35a
	.byte	0
	.byte	0xf
	.4byte	.LASF53
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
	.4byte	.LASF54
	.byte	0x68
	.byte	0x6
	.byte	0xba
	.byte	0x8
	.4byte	0x4a3
	.byte	0x11
	.string	"_p"
	.byte	0x6
	.byte	0xbb
	.byte	0x12
	.4byte	0x35a
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
	.4byte	.LASF55
	.byte	0x6
	.byte	0xbe
	.byte	0x9
	.4byte	0x46
	.byte	0xc
	.byte	0xf
	.4byte	.LASF56
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
	.4byte	0x332
	.byte	0x10
	.byte	0xf
	.4byte	.LASF57
	.byte	0x6
	.byte	0xc1
	.byte	0x7
	.4byte	0x25
	.byte	0x18
	.byte	0xf
	.4byte	.LASF58
	.byte	0x6
	.byte	0xc8
	.byte	0xa
	.4byte	0x9b
	.byte	0x1c
	.byte	0xf
	.4byte	.LASF59
	.byte	0x6
	.byte	0xca
	.byte	0xe
	.4byte	0x61b
	.byte	0x20
	.byte	0xf
	.4byte	.LASF60
	.byte	0x6
	.byte	0xcc
	.byte	0xe
	.4byte	0x63f
	.byte	0x24
	.byte	0xf
	.4byte	.LASF61
	.byte	0x6
	.byte	0xcf
	.byte	0xd
	.4byte	0x663
	.byte	0x28
	.byte	0xf
	.4byte	.LASF62
	.byte	0x6
	.byte	0xd0
	.byte	0x9
	.4byte	0x67d
	.byte	0x2c
	.byte	0x11
	.string	"_ub"
	.byte	0x6
	.byte	0xd3
	.byte	0x11
	.4byte	0x332
	.byte	0x30
	.byte	0x11
	.string	"_up"
	.byte	0x6
	.byte	0xd4
	.byte	0x12
	.4byte	0x35a
	.byte	0x38
	.byte	0x11
	.string	"_ur"
	.byte	0x6
	.byte	0xd5
	.byte	0x7
	.4byte	0x25
	.byte	0x3c
	.byte	0xf
	.4byte	.LASF63
	.byte	0x6
	.byte	0xd8
	.byte	0x11
	.4byte	0x683
	.byte	0x40
	.byte	0xf
	.4byte	.LASF64
	.byte	0x6
	.byte	0xd9
	.byte	0x11
	.4byte	0x693
	.byte	0x43
	.byte	0x11
	.string	"_lb"
	.byte	0x6
	.byte	0xdc
	.byte	0x11
	.4byte	0x332
	.byte	0x44
	.byte	0xf
	.4byte	.LASF65
	.byte	0x6
	.byte	0xdf
	.byte	0x7
	.4byte	0x25
	.byte	0x4c
	.byte	0xf
	.4byte	.LASF66
	.byte	0x6
	.byte	0xe0
	.byte	0xa
	.4byte	0xe0
	.byte	0x50
	.byte	0xf
	.4byte	.LASF67
	.byte	0x6
	.byte	0xe3
	.byte	0x12
	.4byte	0x4c1
	.byte	0x54
	.byte	0xf
	.4byte	.LASF68
	.byte	0x6
	.byte	0xe7
	.byte	0xc
	.4byte	0x17e
	.byte	0x58
	.byte	0xf
	.4byte	.LASF69
	.byte	0x6
	.byte	0xe9
	.byte	0xe
	.4byte	0x15a
	.byte	0x5c
	.byte	0xf
	.4byte	.LASF70
	.byte	0x6
	.byte	0xea
	.byte	0x7
	.4byte	0x25
	.byte	0x64
	.byte	0
	.byte	0x15
	.4byte	0xf8
	.4byte	0x4c1
	.byte	0x16
	.4byte	0x4c1
	.byte	0x16
	.4byte	0x9b
	.byte	0x16
	.4byte	0x615
	.byte	0x16
	.4byte	0x25
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x4cc
	.byte	0x8
	.4byte	0x4c1
	.byte	0x17
	.4byte	.LASF71
	.2byte	0x428
	.byte	0x6
	.2byte	0x265
	.byte	0x8
	.4byte	0x615
	.byte	0x18
	.4byte	.LASF72
	.byte	0x6
	.2byte	0x267
	.byte	0x7
	.4byte	0x25
	.byte	0
	.byte	0x18
	.4byte	.LASF73
	.byte	0x6
	.2byte	0x26c
	.byte	0xb
	.4byte	0x6ef
	.byte	0x4
	.byte	0x18
	.4byte	.LASF74
	.byte	0x6
	.2byte	0x26c
	.byte	0x14
	.4byte	0x6ef
	.byte	0x8
	.byte	0x18
	.4byte	.LASF75
	.byte	0x6
	.2byte	0x26c
	.byte	0x1e
	.4byte	0x6ef
	.byte	0xc
	.byte	0x18
	.4byte	.LASF76
	.byte	0x6
	.2byte	0x26e
	.byte	0x7
	.4byte	0x25
	.byte	0x10
	.byte	0x18
	.4byte	.LASF77
	.byte	0x6
	.2byte	0x26f
	.byte	0x8
	.4byte	0x8ef
	.byte	0x14
	.byte	0x18
	.4byte	.LASF78
	.byte	0x6
	.2byte	0x272
	.byte	0x7
	.4byte	0x25
	.byte	0x30
	.byte	0x18
	.4byte	.LASF79
	.byte	0x6
	.2byte	0x273
	.byte	0x16
	.4byte	0x904
	.byte	0x34
	.byte	0x18
	.4byte	.LASF80
	.byte	0x6
	.2byte	0x275
	.byte	0x7
	.4byte	0x25
	.byte	0x38
	.byte	0x18
	.4byte	.LASF81
	.byte	0x6
	.2byte	0x277
	.byte	0xa
	.4byte	0x915
	.byte	0x3c
	.byte	0x18
	.4byte	.LASF82
	.byte	0x6
	.2byte	0x27a
	.byte	0x13
	.4byte	0x1e4
	.byte	0x40
	.byte	0x18
	.4byte	.LASF83
	.byte	0x6
	.2byte	0x27b
	.byte	0x7
	.4byte	0x25
	.byte	0x44
	.byte	0x18
	.4byte	.LASF84
	.byte	0x6
	.2byte	0x27c
	.byte	0x13
	.4byte	0x1e4
	.byte	0x48
	.byte	0x18
	.4byte	.LASF85
	.byte	0x6
	.2byte	0x27d
	.byte	0x14
	.4byte	0x91b
	.byte	0x4c
	.byte	0x18
	.4byte	.LASF86
	.byte	0x6
	.2byte	0x280
	.byte	0x7
	.4byte	0x25
	.byte	0x50
	.byte	0x18
	.4byte	.LASF87
	.byte	0x6
	.2byte	0x281
	.byte	0x9
	.4byte	0x615
	.byte	0x54
	.byte	0x18
	.4byte	.LASF88
	.byte	0x6
	.2byte	0x2a4
	.byte	0x7
	.4byte	0x8ca
	.byte	0x58
	.byte	0x19
	.4byte	.LASF48
	.byte	0x6
	.2byte	0x2a8
	.byte	0x13
	.4byte	0x315
	.2byte	0x148
	.byte	0x19
	.4byte	.LASF89
	.byte	0x6
	.2byte	0x2a9
	.byte	0x12
	.4byte	0x2d2
	.2byte	0x14c
	.byte	0x19
	.4byte	.LASF90
	.byte	0x6
	.2byte	0x2ad
	.byte	0xc
	.4byte	0x92c
	.2byte	0x2dc
	.byte	0x19
	.4byte	.LASF91
	.byte	0x6
	.2byte	0x2b2
	.byte	0x10
	.4byte	0x6b0
	.2byte	0x2e0
	.byte	0x19
	.4byte	.LASF92
	.byte	0x6
	.2byte	0x2b4
	.byte	0xa
	.4byte	0x938
	.2byte	0x2ec
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0xc7
	.byte	0x7
	.byte	0x4
	.4byte	0x4a3
	.byte	0x15
	.4byte	0xf8
	.4byte	0x63f
	.byte	0x16
	.4byte	0x4c1
	.byte	0x16
	.4byte	0x9b
	.byte	0x16
	.4byte	0xc1
	.byte	0x16
	.4byte	0x25
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x621
	.byte	0x15
	.4byte	0xec
	.4byte	0x663
	.byte	0x16
	.4byte	0x4c1
	.byte	0x16
	.4byte	0x9b
	.byte	0x16
	.4byte	0xec
	.byte	0x16
	.4byte	0x25
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x645
	.byte	0x15
	.4byte	0x25
	.4byte	0x67d
	.byte	0x16
	.4byte	0x4c1
	.byte	0x16
	.4byte	0x9b
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x669
	.byte	0xc
	.4byte	0x73
	.4byte	0x693
	.byte	0xd
	.4byte	0x2c
	.byte	0x2
	.byte	0
	.byte	0xc
	.4byte	0x73
	.4byte	0x6a3
	.byte	0xd
	.4byte	0x2c
	.byte	0
	.byte	0
	.byte	0x9
	.4byte	.LASF93
	.byte	0x6
	.2byte	0x124
	.byte	0x18
	.4byte	0x360
	.byte	0x1a
	.4byte	.LASF94
	.byte	0xc
	.byte	0x6
	.2byte	0x128
	.byte	0x8
	.4byte	0x6e9
	.byte	0x18
	.4byte	.LASF28
	.byte	0x6
	.2byte	0x12a
	.byte	0x11
	.4byte	0x6e9
	.byte	0
	.byte	0x18
	.4byte	.LASF95
	.byte	0x6
	.2byte	0x12b
	.byte	0x7
	.4byte	0x25
	.byte	0x4
	.byte	0x18
	.4byte	.LASF96
	.byte	0x6
	.2byte	0x12c
	.byte	0xb
	.4byte	0x6ef
	.byte	0x8
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x6b0
	.byte	0x7
	.byte	0x4
	.4byte	0x6a3
	.byte	0x1a
	.4byte	.LASF97
	.byte	0xe
	.byte	0x6
	.2byte	0x144
	.byte	0x8
	.4byte	0x72e
	.byte	0x18
	.4byte	.LASF98
	.byte	0x6
	.2byte	0x145
	.byte	0x12
	.4byte	0x72e
	.byte	0
	.byte	0x18
	.4byte	.LASF99
	.byte	0x6
	.2byte	0x146
	.byte	0x12
	.4byte	0x72e
	.byte	0x6
	.byte	0x18
	.4byte	.LASF100
	.byte	0x6
	.2byte	0x147
	.byte	0x12
	.4byte	0x7a
	.byte	0xc
	.byte	0
	.byte	0xc
	.4byte	0x7a
	.4byte	0x73e
	.byte	0xd
	.4byte	0x2c
	.byte	0x2
	.byte	0
	.byte	0x1b
	.byte	0xd0
	.byte	0x6
	.2byte	0x285
	.byte	0x7
	.4byte	0x853
	.byte	0x18
	.4byte	.LASF101
	.byte	0x6
	.2byte	0x287
	.byte	0x18
	.4byte	0x2c
	.byte	0
	.byte	0x18
	.4byte	.LASF102
	.byte	0x6
	.2byte	0x288
	.byte	0x12
	.4byte	0x615
	.byte	0x4
	.byte	0x18
	.4byte	.LASF103
	.byte	0x6
	.2byte	0x289
	.byte	0x10
	.4byte	0x853
	.byte	0x8
	.byte	0x18
	.4byte	.LASF104
	.byte	0x6
	.2byte	0x28a
	.byte	0x17
	.4byte	0x1fa
	.byte	0x24
	.byte	0x18
	.4byte	.LASF105
	.byte	0x6
	.2byte	0x28b
	.byte	0xf
	.4byte	0x25
	.byte	0x48
	.byte	0x18
	.4byte	.LASF106
	.byte	0x6
	.2byte	0x28c
	.byte	0x2c
	.4byte	0x94
	.byte	0x50
	.byte	0x18
	.4byte	.LASF107
	.byte	0x6
	.2byte	0x28d
	.byte	0x1a
	.4byte	0x6f5
	.byte	0x58
	.byte	0x18
	.4byte	.LASF108
	.byte	0x6
	.2byte	0x28e
	.byte	0x16
	.4byte	0x15a
	.byte	0x68
	.byte	0x18
	.4byte	.LASF109
	.byte	0x6
	.2byte	0x28f
	.byte	0x16
	.4byte	0x15a
	.byte	0x70
	.byte	0x18
	.4byte	.LASF110
	.byte	0x6
	.2byte	0x290
	.byte	0x16
	.4byte	0x15a
	.byte	0x78
	.byte	0x18
	.4byte	.LASF111
	.byte	0x6
	.2byte	0x291
	.byte	0x10
	.4byte	0x863
	.byte	0x80
	.byte	0x18
	.4byte	.LASF112
	.byte	0x6
	.2byte	0x292
	.byte	0x10
	.4byte	0x873
	.byte	0x88
	.byte	0x18
	.4byte	.LASF113
	.byte	0x6
	.2byte	0x293
	.byte	0xf
	.4byte	0x25
	.byte	0xa0
	.byte	0x18
	.4byte	.LASF114
	.byte	0x6
	.2byte	0x294
	.byte	0x16
	.4byte	0x15a
	.byte	0xa4
	.byte	0x18
	.4byte	.LASF115
	.byte	0x6
	.2byte	0x295
	.byte	0x16
	.4byte	0x15a
	.byte	0xac
	.byte	0x18
	.4byte	.LASF116
	.byte	0x6
	.2byte	0x296
	.byte	0x16
	.4byte	0x15a
	.byte	0xb4
	.byte	0x18
	.4byte	.LASF117
	.byte	0x6
	.2byte	0x297
	.byte	0x16
	.4byte	0x15a
	.byte	0xbc
	.byte	0x18
	.4byte	.LASF118
	.byte	0x6
	.2byte	0x298
	.byte	0x16
	.4byte	0x15a
	.byte	0xc4
	.byte	0x18
	.4byte	.LASF119
	.byte	0x6
	.2byte	0x299
	.byte	0x8
	.4byte	0x25
	.byte	0xcc
	.byte	0
	.byte	0xc
	.4byte	0xc7
	.4byte	0x863
	.byte	0xd
	.4byte	0x2c
	.byte	0x19
	.byte	0
	.byte	0xc
	.4byte	0xc7
	.4byte	0x873
	.byte	0xd
	.4byte	0x2c
	.byte	0x7
	.byte	0
	.byte	0xc
	.4byte	0xc7
	.4byte	0x883
	.byte	0xd
	.4byte	0x2c
	.byte	0x17
	.byte	0
	.byte	0x1b
	.byte	0xf0
	.byte	0x6
	.2byte	0x29e
	.byte	0x7
	.4byte	0x8aa
	.byte	0x18
	.4byte	.LASF120
	.byte	0x6
	.2byte	0x2a1
	.byte	0x1b
	.4byte	0x8aa
	.byte	0
	.byte	0x18
	.4byte	.LASF121
	.byte	0x6
	.2byte	0x2a2
	.byte	0x18
	.4byte	0x8ba
	.byte	0x78
	.byte	0
	.byte	0xc
	.4byte	0x35a
	.4byte	0x8ba
	.byte	0xd
	.4byte	0x2c
	.byte	0x1d
	.byte	0
	.byte	0xc
	.4byte	0x2c
	.4byte	0x8ca
	.byte	0xd
	.4byte	0x2c
	.byte	0x1d
	.byte	0
	.byte	0x1c
	.byte	0xf0
	.byte	0x6
	.2byte	0x283
	.byte	0x3
	.4byte	0x8ef
	.byte	0x1d
	.4byte	.LASF71
	.byte	0x6
	.2byte	0x29a
	.byte	0xb
	.4byte	0x73e
	.byte	0x1d
	.4byte	.LASF122
	.byte	0x6
	.2byte	0x2a3
	.byte	0xb
	.4byte	0x883
	.byte	0
	.byte	0xc
	.4byte	0xc7
	.4byte	0x8ff
	.byte	0xd
	.4byte	0x2c
	.byte	0x18
	.byte	0
	.byte	0x1e
	.4byte	.LASF173
	.byte	0x7
	.byte	0x4
	.4byte	0x8ff
	.byte	0x1f
	.4byte	0x915
	.byte	0x16
	.4byte	0x4c1
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x90a
	.byte	0x7
	.byte	0x4
	.4byte	0x1e4
	.byte	0x1f
	.4byte	0x92c
	.byte	0x16
	.4byte	0x25
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x932
	.byte	0x7
	.byte	0x4
	.4byte	0x921
	.byte	0xc
	.4byte	0x6a3
	.4byte	0x948
	.byte	0xd
	.4byte	0x2c
	.byte	0x2
	.byte	0
	.byte	0x20
	.4byte	.LASF124
	.byte	0x6
	.2byte	0x333
	.byte	0x17
	.4byte	0x4c1
	.byte	0x20
	.4byte	.LASF125
	.byte	0x6
	.2byte	0x334
	.byte	0x1d
	.4byte	0x4c7
	.byte	0x6
	.4byte	.LASF126
	.byte	0x8
	.byte	0x8
	.byte	0x11
	.4byte	0x81
	.byte	0x4
	.4byte	.LASF127
	.byte	0x9
	.byte	0x7c
	.byte	0xf
	.4byte	0x331
	.byte	0xc
	.4byte	0x985
	.4byte	0x985
	.byte	0x21
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x98b
	.byte	0x7
	.byte	0x4
	.4byte	0x96e
	.byte	0x6
	.4byte	.LASF128
	.byte	0x9
	.byte	0x84
	.byte	0x1c
	.4byte	0x97a
	.byte	0x22
	.byte	0x7
	.byte	0x1
	.4byte	0x73
	.byte	0x11
	.byte	0x88
	.byte	0xe
	.4byte	0x9d6
	.byte	0x23
	.4byte	.LASF129
	.byte	0
	.byte	0x23
	.4byte	.LASF130
	.byte	0x1
	.byte	0x23
	.4byte	.LASF131
	.byte	0x2
	.byte	0x23
	.4byte	.LASF132
	.byte	0x3
	.byte	0x23
	.4byte	.LASF133
	.byte	0x4
	.byte	0x23
	.4byte	.LASF134
	.byte	0x5
	.byte	0x23
	.4byte	.LASF135
	.byte	0x6
	.byte	0
	.byte	0x3
	.byte	0x4
	.byte	0x4
	.4byte	.LASF136
	.byte	0x4
	.4byte	.LASF137
	.byte	0xa
	.byte	0x24
	.byte	0x10
	.4byte	0x9e9
	.byte	0x7
	.byte	0x4
	.4byte	0x9ef
	.byte	0x1f
	.4byte	0xa04
	.byte	0x16
	.4byte	0x25
	.byte	0x16
	.4byte	0xa04
	.byte	0x16
	.4byte	0x81
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x81
	.byte	0x10
	.4byte	.LASF138
	.byte	0x1c
	.byte	0xa
	.byte	0x25
	.byte	0x10
	.4byte	0xa72
	.byte	0xf
	.4byte	.LASF139
	.byte	0xa
	.byte	0x26
	.byte	0x9
	.4byte	0x25
	.byte	0
	.byte	0xf
	.4byte	.LASF140
	.byte	0xa
	.byte	0x27
	.byte	0xf
	.4byte	0xa04
	.byte	0x4
	.byte	0xf
	.4byte	.LASF141
	.byte	0xa
	.byte	0x28
	.byte	0xb
	.4byte	0x9b
	.byte	0x8
	.byte	0xf
	.4byte	.LASF142
	.byte	0xa
	.byte	0x29
	.byte	0x9
	.4byte	0x25
	.byte	0xc
	.byte	0xf
	.4byte	.LASF143
	.byte	0xa
	.byte	0x2a
	.byte	0xe
	.4byte	0x81
	.byte	0x10
	.byte	0xf
	.4byte	.LASF144
	.byte	0xa
	.byte	0x2b
	.byte	0xe
	.4byte	0x81
	.byte	0x14
	.byte	0x11
	.string	"cb"
	.byte	0xa
	.byte	0x2c
	.byte	0x11
	.4byte	0x9dd
	.byte	0x18
	.byte	0
	.byte	0x4
	.4byte	.LASF145
	.byte	0xa
	.byte	0x2d
	.byte	0x2
	.4byte	0xa0a
	.byte	0x24
	.4byte	.LASF174
	.byte	0x1
	.byte	0xa5
	.byte	0xa
	.4byte	0x81
	.byte	0x1
	.4byte	0xad4
	.byte	0x25
	.4byte	.LASF147
	.byte	0x1
	.byte	0xa7
	.byte	0x13
	.4byte	0xad4
	.byte	0x5
	.byte	0x3
	.4byte	adc_data.4430
	.byte	0x26
	.string	"ctx"
	.byte	0x1
	.byte	0xaa
	.byte	0xe
	.4byte	0xae5
	.byte	0x26
	.string	"sum"
	.byte	0x1
	.byte	0xb9
	.byte	0xc
	.4byte	0x81
	.byte	0x27
	.byte	0x26
	.string	"i"
	.byte	0x1
	.byte	0xba
	.byte	0xc
	.4byte	0x25
	.byte	0x27
	.byte	0x28
	.4byte	.LASF146
	.byte	0x1
	.byte	0xbc
	.byte	0xe
	.4byte	0x81
	.byte	0
	.byte	0
	.byte	0
	.byte	0xc
	.4byte	0x81
	.4byte	0xae5
	.byte	0x29
	.4byte	0x2c
	.2byte	0x3ff
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0xa72
	.byte	0x2a
	.4byte	.LASF151
	.byte	0x1
	.byte	0x7a
	.byte	0x6
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.byte	0x1
	.byte	0x9c
	.4byte	0xc01
	.byte	0x2b
	.string	"pin"
	.byte	0x1
	.byte	0x7a
	.byte	0x17
	.4byte	0x67
	.4byte	.LLST0
	.byte	0x2c
	.4byte	.LASF148
	.byte	0x1
	.byte	0x9d
	.byte	0x7
	.4byte	0x25
	.4byte	.LLST1
	.byte	0x2d
	.string	"ctx"
	.byte	0x1
	.byte	0x9e
	.byte	0xe
	.4byte	0xae5
	.4byte	.LLST2
	.byte	0x2e
	.4byte	0xc01
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.byte	0x1
	.byte	0x94
	.byte	0x3
	.4byte	0xb6b
	.byte	0x2f
	.4byte	0xc12
	.4byte	.LLST3
	.byte	0x2f
	.4byte	0xc1e
	.4byte	.LLST3
	.byte	0x30
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.byte	0x31
	.4byte	0xc2a
	.4byte	.LLST5
	.byte	0
	.byte	0
	.byte	0x32
	.4byte	.LVL2
	.4byte	0xe4e
	.4byte	0xb86
	.byte	0x33
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0x33
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xa
	.2byte	0x1000
	.byte	0
	.byte	0x32
	.4byte	.LVL3
	.4byte	0xe5a
	.4byte	0xba0
	.byte	0x33
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0x33
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x32
	.4byte	.LVL8
	.4byte	0xe66
	.4byte	0xbbb
	.byte	0x33
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0x33
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xa
	.2byte	0x400
	.byte	0
	.byte	0x32
	.4byte	.LVL9
	.4byte	0xe72
	.4byte	0xbcf
	.byte	0x33
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x32
	.4byte	.LVL10
	.4byte	0xe7e
	.4byte	0xbe3
	.byte	0x33
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x32
	.4byte	.LVL12
	.4byte	0xe8a
	.4byte	0xbf7
	.byte	0x33
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x34
	.4byte	.LVL14
	.4byte	0xe96
	.byte	0
	.byte	0x35
	.4byte	.LASF175
	.byte	0x1
	.byte	0x5b
	.byte	0xc
	.4byte	0x25
	.byte	0x1
	.4byte	0xc37
	.byte	0x36
	.4byte	.LASF149
	.byte	0x1
	.byte	0x5b
	.byte	0x22
	.4byte	0x81
	.byte	0x36
	.4byte	.LASF150
	.byte	0x1
	.byte	0x5b
	.byte	0x32
	.4byte	0x81
	.byte	0x26
	.string	"reg"
	.byte	0x1
	.byte	0x5d
	.byte	0xc
	.4byte	0x81
	.byte	0
	.byte	0x2a
	.4byte	.LASF152
	.byte	0x1
	.byte	0x24
	.byte	0x6
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.byte	0x1
	.byte	0x9c
	.4byte	0xda8
	.byte	0x37
	.4byte	.LASF153
	.byte	0x1
	.byte	0x24
	.byte	0x15
	.4byte	0x9b
	.4byte	.LLST11
	.byte	0x38
	.4byte	.Ldebug_ranges0+0x30
	.4byte	0xd67
	.byte	0x25
	.4byte	.LASF154
	.byte	0x1
	.byte	0x39
	.byte	0xd
	.4byte	0x3a
	.byte	0x1
	.byte	0x62
	.byte	0x25
	.4byte	.LASF155
	.byte	0x1
	.byte	0x3c
	.byte	0xd
	.4byte	0x3a
	.byte	0x1
	.byte	0x64
	.byte	0x32
	.4byte	.LVL27
	.4byte	0xea2
	.4byte	0xc9f
	.byte	0x33
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x3b
	.byte	0x33
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0x33
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x32
	.4byte	.LVL28
	.4byte	0xea2
	.4byte	0xcbc
	.byte	0x33
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x3e
	.byte	0x33
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0x33
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x39
	.4byte	.LVL29
	.4byte	0xa7e
	.byte	0x32
	.4byte	.LVL30
	.4byte	0xeae
	.4byte	0xcd8
	.byte	0x33
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x32
	.4byte	.LVL31
	.4byte	0xeba
	.4byte	0xcec
	.byte	0x33
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x32
	.4byte	.LVL33
	.4byte	0xec7
	.4byte	0xd13
	.byte	0x33
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0x33
	.byte	0x1
	.byte	0x5b
	.byte	0x6
	.byte	0x84
	.byte	0
	.byte	0x40
	.byte	0x24
	.byte	0x40
	.byte	0x26
	.byte	0x33
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x32
	.4byte	.LVL34
	.4byte	0xed3
	.4byte	0xd2b
	.byte	0x33
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x3b
	.byte	0x33
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x32
	.4byte	.LVL35
	.4byte	0xed3
	.4byte	0xd3e
	.byte	0x33
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x3e
	.byte	0
	.byte	0x32
	.4byte	.LVL36
	.4byte	0xeba
	.4byte	0xd52
	.byte	0x33
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x3a
	.4byte	.LVL37
	.4byte	0xed3
	.byte	0x33
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x3b
	.byte	0x33
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0x32
	.4byte	.LVL25
	.4byte	0xaeb
	.4byte	0xd7a
	.byte	0x33
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x35
	.byte	0
	.byte	0x3a
	.4byte	.LVL26
	.4byte	0xedf
	.byte	0x33
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x33
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x34
	.byte	0x33
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x33
	.byte	0x33
	.byte	0x1
	.byte	0x5d
	.byte	0x2
	.byte	0x9
	.byte	0xff
	.byte	0x33
	.byte	0x1
	.byte	0x5e
	.byte	0x2
	.byte	0x9
	.byte	0xff
	.byte	0x33
	.byte	0x1
	.byte	0x5f
	.byte	0x4
	.byte	0x8
	.byte	0xe1
	.byte	0x39
	.byte	0x24
	.byte	0
	.byte	0
	.byte	0x3b
	.4byte	0xa7e
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.byte	0x1
	.byte	0x9c
	.4byte	0xe4e
	.byte	0x31
	.4byte	0xaa1
	.4byte	.LLST6
	.byte	0x31
	.4byte	0xaad
	.4byte	.LLST7
	.byte	0x2e
	.4byte	0xa7e
	.4byte	.LBB12
	.4byte	.LBE12-.LBB12
	.byte	0x1
	.byte	0xa5
	.byte	0xa
	.4byte	0xe20
	.byte	0x30
	.4byte	.LBB13
	.4byte	.LBE13-.LBB13
	.byte	0x3c
	.4byte	0xaa1
	.byte	0x31
	.4byte	0xaad
	.4byte	.LLST8
	.byte	0x3d
	.4byte	0xab9
	.4byte	.Ldebug_ranges0+0
	.byte	0x31
	.4byte	0xaba
	.4byte	.LLST9
	.byte	0x3d
	.4byte	0xac4
	.4byte	.Ldebug_ranges0+0x18
	.byte	0x31
	.4byte	0xac5
	.4byte	.LLST10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x32
	.4byte	.LVL15
	.4byte	0xe8a
	.4byte	0xe33
	.byte	0x33
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x3a
	.4byte	.LVL17
	.4byte	0xeeb
	.byte	0x33
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	adc_data.4430
	.byte	0x33
	.byte	0x1
	.byte	0x5c
	.byte	0x3
	.byte	0xa
	.2byte	0x1000
	.byte	0
	.byte	0
	.byte	0x3e
	.4byte	.LASF156
	.4byte	.LASF156
	.byte	0xa
	.byte	0x3a
	.byte	0x5
	.byte	0x3e
	.4byte	.LASF157
	.4byte	.LASF157
	.byte	0xa
	.byte	0x35
	.byte	0x5
	.byte	0x3e
	.4byte	.LASF158
	.4byte	.LASF158
	.byte	0xa
	.byte	0x36
	.byte	0x5
	.byte	0x3e
	.4byte	.LASF159
	.4byte	.LASF159
	.byte	0xa
	.byte	0x38
	.byte	0x5
	.byte	0x3e
	.4byte	.LASF160
	.4byte	.LASF160
	.byte	0xa
	.byte	0x39
	.byte	0x5
	.byte	0x3e
	.4byte	.LASF161
	.4byte	.LASF161
	.byte	0xb
	.byte	0x4e
	.byte	0x7
	.byte	0x3e
	.4byte	.LASF162
	.4byte	.LASF162
	.byte	0xa
	.byte	0x37
	.byte	0x5
	.byte	0x3e
	.4byte	.LASF163
	.4byte	.LASF163
	.byte	0xc
	.byte	0x2c
	.byte	0x5
	.byte	0x3e
	.4byte	.LASF164
	.4byte	.LASF164
	.byte	0xd
	.byte	0x35
	.byte	0x5
	.byte	0x3f
	.4byte	.LASF165
	.4byte	.LASF165
	.byte	0xe
	.2byte	0x2f6
	.byte	0x6
	.byte	0x3e
	.4byte	.LASF166
	.4byte	.LASF166
	.byte	0xf
	.byte	0xc8
	.byte	0x5
	.byte	0x3e
	.4byte	.LASF167
	.4byte	.LASF167
	.byte	0xc
	.byte	0x2e
	.byte	0x5
	.byte	0x3e
	.4byte	.LASF168
	.4byte	.LASF168
	.byte	0xd
	.byte	0x26
	.byte	0x5
	.byte	0x3e
	.4byte	.LASF169
	.4byte	.LASF169
	.byte	0x10
	.byte	0x1f
	.byte	0x8
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
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0x22
	.byte	0x4
	.byte	0x1
	.byte	0x3e
	.byte	0xb
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
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
	.byte	0x23
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x24
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
	.byte	0x49
	.byte	0x13
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
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
	.byte	0
	.byte	0
	.byte	0x27
	.byte	0xb
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x28
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
	.byte	0
	.byte	0
	.byte	0x29
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x2a
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
	.byte	0x2b
	.byte	0x5
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
	.byte	0x2c
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
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2d
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
	.byte	0x2e
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2f
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x30
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x31
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x32
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
	.byte	0x33
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x34
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x95,0x42
	.byte	0x19
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x35
	.byte	0x2e
	.byte	0x1
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
	.byte	0x49
	.byte	0x13
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x36
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
	.byte	0
	.byte	0
	.byte	0x37
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
	.byte	0x38
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x39
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3a
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3b
	.byte	0x2e
	.byte	0x1
	.byte	0x31
	.byte	0x13
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
	.byte	0x3c
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3d
	.byte	0xb
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x3e
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
	.byte	0x3f
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
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL1
	.4byte	.LVL14
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LFE29
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL11
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL12
	.4byte	.LVL14-1
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL3
	.4byte	.LVL7
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x10
	.byte	0x7f
	.byte	0
	.byte	0x11
	.byte	0xff,0xff,0xf9,0x81,0x7f
	.byte	0x1a
	.byte	0xc
	.4byte	0x2410000
	.byte	0x21
	.byte	0x9f
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0x9
	.byte	0x7f
	.byte	0
	.byte	0xc
	.4byte	0x2410000
	.byte	0x21
	.byte	0x9f
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x5f
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL23
	.4byte	.LVL24
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL24
	.4byte	.LFE27
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL15
	.4byte	.LVL16
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL17
	.4byte	.LVL22
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL17
	.4byte	.LVL18
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL18
	.4byte	.LVL22
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL17
	.4byte	.LVL18
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL18
	.4byte	.LVL19
	.2byte	0xe
	.byte	0x7f
	.byte	0
	.byte	0x6
	.byte	0xa
	.2byte	0xffff
	.byte	0x1a
	.byte	0xa
	.2byte	0x7d00
	.byte	0x1e
	.byte	0x40
	.byte	0x25
	.byte	0x9f
	.4byte	.LVL19
	.4byte	.LVL20
	.2byte	0xd
	.byte	0x7e
	.byte	0
	.byte	0xa
	.2byte	0xffff
	.byte	0x1a
	.byte	0xa
	.2byte	0x7d00
	.byte	0x1e
	.byte	0x40
	.byte	0x25
	.byte	0x9f
	.4byte	.LVL20
	.4byte	.LVL22
	.2byte	0xe
	.byte	0x7f
	.byte	0x7c
	.byte	0x6
	.byte	0xa
	.2byte	0xffff
	.byte	0x1a
	.byte	0xa
	.2byte	0x7d00
	.byte	0x1e
	.byte	0x40
	.byte	0x25
	.byte	0x9f
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
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LBB14
	.4byte	.LBE14
	.4byte	.LBB17
	.4byte	.LBE17
	.4byte	0
	.4byte	0
	.4byte	.LBB15
	.4byte	.LBE15
	.4byte	.LBB16
	.4byte	.LBE16
	.4byte	0
	.4byte	0
	.4byte	.LBB18
	.4byte	.LBE18
	.4byte	.LBB19
	.4byte	.LBE19
	.4byte	.LBB20
	.4byte	.LBE20
	.4byte	.LBB21
	.4byte	.LBE21
	.4byte	0
	.4byte	0
	.4byte	.LFB29
	.4byte	.LFE29
	.4byte	.LFB30
	.4byte	.LFE30
	.4byte	.LFB27
	.4byte	.LFE27
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF166:
	.string	"printf"
.LASF2:
	.string	"short int"
.LASF49:
	.string	"_ind"
.LASF163:
	.string	"bl_gpio_enable_output"
.LASF44:
	.string	"_fnargs"
.LASF97:
	.string	"_rand48"
.LASF77:
	.string	"_emergency"
.LASF129:
	.string	"ADC_PGA_GAIN_NONE"
.LASF89:
	.string	"_atexit0"
.LASF165:
	.string	"vTaskDelay"
.LASF117:
	.string	"_wcrtomb_state"
.LASF118:
	.string	"_wcsrtombs_state"
.LASF123:
	.string	"TrapNetCounter"
.LASF130:
	.string	"ADC_PGA_GAIN_1"
.LASF131:
	.string	"ADC_PGA_GAIN_2"
.LASF132:
	.string	"ADC_PGA_GAIN_4"
.LASF149:
	.string	"gain1"
.LASF150:
	.string	"gain2"
.LASF133:
	.string	"ADC_PGA_GAIN_8"
.LASF173:
	.string	"__locale_t"
.LASF175:
	.string	"set_adc_gain"
.LASF115:
	.string	"_mbrtowc_state"
.LASF110:
	.string	"_wctomb_state"
.LASF34:
	.string	"__tm_sec"
.LASF3:
	.string	"int16_t"
.LASF172:
	.string	"D:\\\\BL602\\\\final_code\\\\build_2\\\\build_out\\\\main2_file"
.LASF62:
	.string	"_close"
.LASF1:
	.string	"signed char"
.LASF152:
	.string	"task_adc"
.LASF12:
	.string	"long long unsigned int"
.LASF36:
	.string	"__tm_hour"
.LASF92:
	.string	"__sf"
.LASF43:
	.string	"_on_exit_args"
.LASF58:
	.string	"_cookie"
.LASF91:
	.string	"__sglue"
.LASF168:
	.string	"bl_uart_init"
.LASF5:
	.string	"long int"
.LASF55:
	.string	"_flags"
.LASF47:
	.string	"_is_cxa"
.LASF73:
	.string	"_stdin"
.LASF63:
	.string	"_ubuf"
.LASF83:
	.string	"_result_k"
.LASF6:
	.string	"long long int"
.LASF140:
	.string	"channel_data"
.LASF13:
	.string	"BaseType_t"
.LASF87:
	.string	"_cvtbuf"
.LASF66:
	.string	"_offset"
.LASF116:
	.string	"_mbsrtowcs_state"
.LASF114:
	.string	"_mbrlen_state"
.LASF9:
	.string	"short unsigned int"
.LASF50:
	.string	"_fns"
.LASF30:
	.string	"_sign"
.LASF124:
	.string	"_impure_ptr"
.LASF75:
	.string	"_stderr"
.LASF32:
	.string	"_Bigint"
.LASF161:
	.string	"bl_dma_find_ctx_by_channel"
.LASF59:
	.string	"_read"
.LASF33:
	.string	"__tm"
.LASF21:
	.string	"__wchb"
.LASF134:
	.string	"ADC_PGA_GAIN_16"
.LASF74:
	.string	"_stdout"
.LASF86:
	.string	"_cvtlen"
.LASF11:
	.string	"long unsigned int"
.LASF56:
	.string	"_file"
.LASF128:
	.string	"intCbfArra"
.LASF153:
	.string	"pvParameters"
.LASF67:
	.string	"_data"
.LASF95:
	.string	"_niobs"
.LASF106:
	.string	"_rand_next"
.LASF147:
	.string	"adc_data"
.LASF171:
	.string	"D:/BL602/final_code/build_2/main2_file/adc.c"
.LASF112:
	.string	"_signal_buf"
.LASF103:
	.string	"_asctime_buf"
.LASF82:
	.string	"_result"
.LASF20:
	.string	"__wch"
.LASF169:
	.string	"memcpy"
.LASF45:
	.string	"_dso_handle"
.LASF142:
	.string	"lli_flag"
.LASF88:
	.string	"_new"
.LASF68:
	.string	"_lock"
.LASF99:
	.string	"_mult"
.LASF155:
	.string	"ldr_readings"
.LASF156:
	.string	"bl_adc_freq_init"
.LASF60:
	.string	"_write"
.LASF39:
	.string	"__tm_year"
.LASF135:
	.string	"ADC_PGA_GAIN_32"
.LASF121:
	.string	"_nmalloc"
.LASF162:
	.string	"bl_adc_start"
.LASF17:
	.string	"_off_t"
.LASF146:
	.string	"scaled"
.LASF159:
	.string	"bl_adc_gpio_init"
.LASF14:
	.string	"TickType_t"
.LASF120:
	.string	"_nextf"
.LASF38:
	.string	"__tm_mon"
.LASF48:
	.string	"_atexit"
.LASF80:
	.string	"__sdidinit"
.LASF105:
	.string	"_gamma_signgam"
.LASF16:
	.string	"wint_t"
.LASF126:
	.string	"SystemCoreClock"
.LASF85:
	.string	"_freelist"
.LASF24:
	.string	"_mbstate_t"
.LASF26:
	.string	"_LOCK_RECURSIVE_T"
.LASF138:
	.string	"adc_ctx"
.LASF52:
	.string	"_base"
.LASF4:
	.string	"int32_t"
.LASF8:
	.string	"unsigned char"
.LASF96:
	.string	"_iobs"
.LASF145:
	.string	"adc_ctx_t"
.LASF119:
	.string	"_h_errno"
.LASF27:
	.string	"_flock_t"
.LASF41:
	.string	"__tm_yday"
.LASF144:
	.string	"data_size"
.LASF70:
	.string	"_flags2"
.LASF158:
	.string	"bl_adc_dma_init"
.LASF93:
	.string	"__FILE"
.LASF54:
	.string	"__sFILE"
.LASF69:
	.string	"_mbstate"
.LASF108:
	.string	"_mblen_state"
.LASF76:
	.string	"_inc"
.LASF167:
	.string	"bl_gpio_output_set"
.LASF151:
	.string	"init_adc"
.LASF81:
	.string	"__cleanup"
.LASF78:
	.string	"_unspecified_locale_info"
.LASF174:
	.string	"read_adc"
.LASF29:
	.string	"_maxwds"
.LASF170:
	.string	"GNU C99 8.3.0 -march=rv32imfc -mabi=ilp32f -gdwarf -Os -std=gnu99 -ffunction-sections -fdata-sections -fstrict-volatile-bitfields -fshort-enums -ffreestanding -fno-strict-aliasing"
.LASF98:
	.string	"_seed"
.LASF22:
	.string	"__count"
.LASF23:
	.string	"__value"
.LASF61:
	.string	"_seek"
.LASF40:
	.string	"__tm_wday"
.LASF18:
	.string	"_fpos_t"
.LASF136:
	.string	"float"
.LASF72:
	.string	"_errno"
.LASF15:
	.string	"char"
.LASF65:
	.string	"_blksize"
.LASF139:
	.string	"mode"
.LASF164:
	.string	"bl_uart_data_recv"
.LASF53:
	.string	"_size"
.LASF0:
	.string	"unsigned int"
.LASF141:
	.string	"adc_lli"
.LASF46:
	.string	"_fntypes"
.LASF7:
	.string	"uint8_t"
.LASF28:
	.string	"_next"
.LASF102:
	.string	"_strtok_last"
.LASF160:
	.string	"bl_adc_get_channel_by_gpio"
.LASF127:
	.string	"intCallback_Type"
.LASF100:
	.string	"_add"
.LASF25:
	.string	"__ULong"
.LASF113:
	.string	"_getdate_err"
.LASF157:
	.string	"bl_adc_init"
.LASF125:
	.string	"_global_impure_ptr"
.LASF10:
	.string	"uint32_t"
.LASF154:
	.string	"soil_moisture"
.LASF101:
	.string	"_unused_rand"
.LASF31:
	.string	"_wds"
.LASF94:
	.string	"_glue"
.LASF19:
	.string	"_ssize_t"
.LASF111:
	.string	"_l64a_buf"
.LASF148:
	.string	"channel"
.LASF90:
	.string	"_sig_func"
.LASF143:
	.string	"chan_init_table"
.LASF71:
	.string	"_reent"
.LASF64:
	.string	"_nbuf"
.LASF122:
	.string	"_unused"
.LASF42:
	.string	"__tm_isdst"
.LASF104:
	.string	"_localtime_buf"
.LASF35:
	.string	"__tm_min"
.LASF107:
	.string	"_r48"
.LASF137:
	.string	"bl_adc_cb_t"
.LASF109:
	.string	"_mbtowc_state"
.LASF84:
	.string	"_p5s"
.LASF79:
	.string	"_locale"
.LASF57:
	.string	"_lbfsize"
.LASF51:
	.string	"__sbuf"
.LASF37:
	.string	"__tm_mday"
	.ident	"GCC: (SiFive GCC 8.3.0-2019.08.0) 8.3.0"
