; ==============================================================================
; Archivo:     snake.asm
; Propósito:   Version pre alfa juego de snake
; Entorno:     DOS 16-bit (Ensamblador: MASM/TASM)
; Autor:       Juan Pablo Strelli (StrelliPablo)
; Fecha:       12 de enero 2012
; Notas:       primera version del juego de snake en assembler, con la posibilidad de moverse por la pantalla con las flechas del teclado.
; ==============================================================================
.model small
.stack 64
.data
        col db 1
        fil db 1

.code
  Inicio:
        mov ax, @data
        mov ds, ax
        mov es, ax
;-----------------------------
        call clrscr
        call gotoxy
    call tam
    for1:
        mov ah,10h
        int 16h
        cmp ah,4fh
        je d5
        cmp ah,48h
        je d2
        cmp ah,4bh
        je d3
        cmp ah,4dh
        je d4
        cmp ah,50h
        je d1

        jmp for1

      d1:
         add fil,1
         call tam
         call gotoxy
         mov dl,254
         mov ah,02h
         int 21h
         jmp for1
      d2:
         sub fil,1
         call tam
         call gotoxy
         mov dl,254
         mov ah,02h
         int 21h
         jmp for1

      d3:
         sub col,1
         call tam
         call gotoxy
         mov dl,254
         mov ah,02h
         int 21h
         jmp for1

      d4:
         add col,1
         call tam
         call gotoxy
         mov dl,254
         mov ah,02h
         int 21h
         jmp for1

      d5:
         call clrscr
;-----------------------------
        mov ah,4ch
        int 21h

tam proc
        mov ah,01h
        mov ch,00
        mov cl, 7
        int 10h
        ret
tam endp

clrscr proc
        mov ah, 06h
        mov bh,61h
        mov cx,0000
        mov dx,184fh
        int 10h
        ret
clrscr endp
;-------
gotoxy proc
        mov ah,02h
        mov bh,00
        mov dh,fil
        mov dl,col
        int 10h
        ret
gotoxy endp

end Inicio
