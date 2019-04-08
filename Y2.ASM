INCLUDE lib1.asm
.MODEL large
.DATA
    gt     db  13,10,'               TINH GIA TRI BIEU THUC a LUY THUA n'
           db 13, 10, '              -----------------------------------'
           db 13,10,13,10,'     Hay vao a: $'
 	m2 db 13,10,'     Hay vao n: $'
 	xh db 13,10,'     $'
 	m3 db ' luy thua $'
 	m4 db ' la: $'
 	tieptuc db 13,10,'     Co tiep tuc CT (c/k)? $'
    sai db 13,10,'     Sai, nhap lai!$'
.CODE
    INCLUDE lib2.asm
    PUBLIC @LT$qv
    @LT$qv PROC
      L0:
        CLRSCR
        HienString gt
        call VAO_SO_N
        mov bx,ax               ; bx=a
        HienString m2
        call VAO_SO_N
        mov cx,ax
        and cx,cx
        jge Lx
        HienString sai
        mov ah,1
        int 21h
        jmp L0 
      Lx:
        HienString xh
        mov ax,bx
        call HIEN_SO_N
        HienString m3
        mov ax,cx
        call HIEN_SO_N
        HienString m4
        mov ax,1
        and cx,cx
        jz L2
      L1:
        mul bx                  ; ax*bx->ax
        loop L1
      L2:
        call HIEN_SO_N
        HienString tieptuc
        mov ah,1
        int 21h
        cmp al,'c'
        jne Thoat
        jmp L0
      Thoat:
        ret
    @LT$qv ENDP
END 
