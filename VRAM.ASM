include lib1.asm
.model large
.data
	s1 	db 13, 10, '                         '
		db 'DIA CHI CO SO CUA VIDEORAM'
		db 13, 10, '                         '
		db '--------------------------'
		db 13, 10, 13, 10, '                    '
		db 'Dia chi co so cua VIDEORAM la: $'
	mono 	db 'b000h$'
	color 	db 'b800h$'
.code
include lib2.asm
	public @VRAM$qv
	@VRAM$qv proc
		CLRSCR
		HienString s1
		int 11h
		shl al, 2
		shr al, 6
		xor al, 00000011h
		jz Step0
		HienString color
		jmp Exit
	Step0:
		HienString mono
	Exit:
		ret
	@VRAM$qv endp
end