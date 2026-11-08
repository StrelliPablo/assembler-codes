; ==============================================================================
; Archivo:     archivo.asm
; Propósito:   Creación y escritura en un archivo de texto
; Entorno:     DOS 16-bit (Ensamblador: MASM/TASM)
; Autor:       Juan Pablo Strelli (StrelliPablo)
; Fecha:       3 de enero 2014
; Notas:       El programa crea un archivo y escribe datos en él mismo directorio donde se ejecuta con los datos que escribe.
; ==============================================================================

.model small
.stack 256
.data
archivo1 db "archivo1.txt"
;D:\auxiliaturas
manejador dw ?
msg db "error en la escritura del archivo$"
ok db "Introducir datos al Archivo s/n",10,13,"$"
nombres db "Assembler$"
datos db 35 dup(' ')
.code
mov ax,@data
mov ds,ax
mov es,ax
;crear el archivo
mov ah,3ch
mov cx,00
lea dx,archivo1
int 21h
mov manejador,ax
jc error
seguir:
mov ah,09h
lea dx,ok
int 21h
mov ah,01h
int 21h
cmp al,'n'
je fin
mov ah,0ah
lea dx,datos
int 21h

mov ah,40h
mov bx,manejador
mov cx,0009d
lea dx,datos+2
int 21h

jmp seguir
fin:
mov ah,4ch
int 21h
error:
mov ah,09h
lea dx,msg
int 21h
end 