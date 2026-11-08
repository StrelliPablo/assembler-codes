; ==============================================================================
; Archivo:     cuentaV.asm
; Propósito:   Contar vocales en una cadena
; Entorno:     DOS 16-bit (Ensamblador: MASM/TASM)
; Autor:       Juan Pablo Strelli (StrelliPablo)
; Fecha:       23 de enero 2013
; Notas:       El programa cuenta las vocales en una cadena introducida por teclado.
; ==============================================================================
.model small
.stack 256
.data
cad db 10,0,9 dup("$")
enter db 10,13,"$"
res db 5 dup("$")
.code
mov ax,@data
mov ds,ax

mov ah,0ah
lea dx,cad
int 21h
xor dx,dx
xor cx,cx
xor bx,bx
mov cl,[cad+1]
lea si,[cad+2]
fore:
mov dl,[si]
inc si
cmp dl,'a'
je incrementar
cmp dl,'e'
je incrementar
cmp dl,'i'
je incrementar
cmp dl,'o'
je incrementar
cmp dl,'u'
je incrementar 

loop fore
add bl,48
mov res,bl
mov ah,09h
lea dx,enter
int 21h
mov ah,09h
lea dx,res
int 21h

mov ah,4ch
int 21h
 
incrementar:
inc bl
loop fore  
end