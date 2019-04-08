INCLUDE lib1.asm
.MODEL large
.STACK 100h
.DATA
        hx db  13,10,'               CHUC NANG TYPE|more'
           db 13, 10, '              -------------------'
           db 13,10,13,10,'     Hay vao ten tep can hien : $'

        Err_O       db 13,10,'     Khong mo duoc tep !$'
        Err_R       db 13,10,'     Khong doc duoc tep !$'
        Err_W       db 13,10,'     Khong ghi duoc tep !$'
        Err_C       db 13,10,'     Khong dong duoc tep !$'
        buff        db 30
                    db ?
        file_name   db 30 dup(?)
        the_tep     dw ?
        dem         db 512 dup(?)
        more        db 13,10,'More ...$'
        tieptuc     db 13,10,'     Co tiep tuc CT (c/k) ?$'
        sai db 13,10,'    Chua vao ten tep. Hay vao lai!$'
.CODE
INCLUDE lib3.asm    ; lib3.asm chứa CT con GET_FILE_NAME
PUBLIC @TYPEMORE$qv
@TYPEMORE$qv PROC
    P0:
        CLRSCR
        HienString hx                          
        lea dx,buff
        call GET_FILE_NAME
        mov si,dx
        mov al,[si+2]
        and al,al
        jnz LX
        HienString sai
        mov ah,1
        int 21h
        jmp P0

    LX:
        lea dx,file_name
        mov al,0
        mov ah,3dh
        int 21h
        jnc P1
        HienString Err_O
        jmp Thoat
    P1:
        mov the_tep,ax
        CLRSCR
    P2:
        mov bx,the_tep
        mov cx,512
        lea dx,dem
        mov ah,3fh
        int 21h
        jnc P3
        HienString Err_R
        jmp DONG_TEP
    P3:
        and ax,ax
        jz DONG_TEP     
        mov  bx,1   ; còn không bằng 0 thì tiến hành đưa ra màn hình với thẻ têp=1
        mov  cx,ax    ; Đưa số lượng byte đọc được vào CX
        lea    dx,dem   ; Trỏ đến vùng đệm chứa số liệu cần đưa ra màn hình
        mov  ah,40h   ; Chức năng hiện (ghi tệp với thẻ tệp bằng 1)
        int     21h
        jnc    P4    ; Ghi tệp tốt nhì nhảy
        HienString Err_W  ; Hiện thông báo Err_W nếu không ghi được tệp (CF=1),
        jmp  DONG_TEP
    P4:
        HienString more  ; Hiện chữ More… lên màn hình
        mov  ah,1    ; Chờ 1 ký tự từ bàn phím
        int     21h
        jmp  P2   ; Nhảy về tiếp tục đọc và hiện
    DONG_TEP:
        mov  bx,the_tep ; Chức năng đóng tệp
        mov  ah,3eh
        int     21h
        jnc    Thoat
        HienString Err_C
    Thoat:
        HienString tieptuc      ; Hiện thông báo tieptuc
        mov  ah,1                   ; Chờ 1 ký tự từ bàn phím
        int     21h                         
        cmp   al,'c'                 ; Ký tự vào có phải 'c'
        jne    Thoat_CT         ; Không phải 'c' thì nhảy đế Thoat_CT,
        jmp    P0    ; còn đúng là 'c' thì nhảy về L_CT0
    Thoat_CT:                     
        ret

@TYPEMORE$qv ENDP
END
