; ==============================================================================
; Archivo:     wipala.asm
; Propósito:   suma de dos números con psp con 30h
; Entorno:     DOS 16-bit (Ensamblador: MASM/TASM)
; Autor:       Juan Pablo Strelli (StrelliPablo)
; Fecha:       12 de enero 2012
; Notas:       dibuja en la terminal cuadros de colores estilo wipala 
; ==============================================================================

.model small
.stack 256
.data
.code
mov ax,@data
mov ds,ax
mov es,ax
mov ah,00h ;modo video
mov al,12h ;Cambio a modo grafico (640 x 480 16 Colores)
int 10h

mov ah,0h   ;establece un modo de video
mov al,03h ;modo texto 80*25
int 10h

mov ah,06h; scroll arriba
mov al,0;numero de lineas
mov bh,0f1h ;4 para el color de caracter 1 para el nible
mov ch,0 ;en una sola linea mov cx,00h
mov cl,0
mov dh,8
mov dl,20;en una linea mov dx,184fh
int 10h

mov ah,06h; scroll arriba
mov al,0;numero de lineas
mov bh,021h ;4 para el color de caracter 1 para el nible
mov ch,0 ;en una sola linea mov cx,00h
mov cl,20
mov dh,8
mov dl,40;en una linea mov dx,184fh
int 10h

mov ah,06h; scroll arriba
mov al,0;numero de lineas
mov bh,041h ;4 para el color de caracter 1 para el nible
mov ch,0 ;en una sola linea mov cx,00h
mov cl,40
mov dh,8
mov dl,60;en una linea mov dx,184fh
int 10h

mov ah,06h; scroll arriba
mov al,0;numero de lineas
mov bh,011h ;4 para el color de caracter 1 para el nible
mov ch,0 ;en una sola linea mov cx,00h
mov cl,60
mov dh,8
mov dl,79;en una linea mov dx,184fh
int 10h

mov ah,06h; scroll arriba
mov al,0;numero de lineas
mov bh,041h ;4 para el color de caracter 1 para el nible
mov ch,8 ;en una sola linea mov cx,00h
mov cl,0
mov dh,16
mov dl,19;en una linea mov dx,184fh
int 10h
mov ah,06h; scroll arriba
mov al,0;numero de lineas
mov bh,0f1h ;4 para el color de caracter 1 para el nible
mov ch,8 ;en una sola linea mov cx,00h
mov cl,20
mov dh,16
mov dl,40;en una linea mov dx,184fh
int 10h

mov ah,06h; scroll arriba
mov al,0;numero de lineas
mov bh,011h ;4 para el color de caracter 1 para el nible
mov ch,8 ;en una sola linea mov cx,00h
mov cl,40
mov dh,16
mov dl,60;en una linea mov dx,184fh
int 10h

mov ah,06h; scroll arriba
mov al,0;numero de lineas
mov bh,021h ;4 para el color de caracter 1 para el nible
mov ch,8 ;en una sola linea mov cx,00h
mov cl,60
mov dh,16
mov dl,79;en una linea mov dx,184fh
int 10h

mov ah,07h; scroll arriba
mov al,0;numero de lineas
mov bh,021h ;4 para el color de caracter 1 para el nible
mov ch,16 ;en una sola linea mov cx,00h
mov cl,0
mov dh,24
mov dl,19;en una linea mov dx,184fh
int 10h

mov ah,07h; scroll arriba
mov al,0;numero de lineas
mov bh,011h ;4 para el color de caracter 1 para el nible
mov ch,16 ;en una sola linea mov cx,00h
mov cl,20
mov dh,24
mov dl,40;en una linea mov dx,184fh
int 10h

mov ah,07h; scroll arriba
mov al,0;numero de lineas
mov bh,0f1h ;4 para el color de caracter 1 para el nible
mov ch,16 ;en una sola linea mov cx,00h
mov cl,40
mov dh,24
mov dl,60;en una linea mov dx,184fh
int 10h

mov ah,07h; scroll arriba
mov al,0;numero de lineas
mov bh,041h ;4 para el color de caracter 1 para el nible
mov ch,16 ;en una sola linea mov cx,00h
mov cl,60
mov dh,24
mov dl,79;en una linea mov dx,184fh
int 10h

mov ah,1
int 21h
mov ah,4ch
int 21h
end