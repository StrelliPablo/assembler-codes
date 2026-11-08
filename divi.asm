; ==============================================================================
; Archivo:     cuentaV.asm
; Propósito:   Contar vocales en una cadena
; Entorno:     DOS 16-bit (Ensamblador: MASM/TASM)
; Autor:       Juan Pablo Strelli (StrelliPablo)
; Fecha:       23 de enero 2013
; Notas:       El programa cuenta las vocales en una cadena introducida por teclado.
; ==============================================================================

include mymacro.asm
.model small
.stack 256
.data 
    dnum1 db 20,0,20 dup('$')
    dnum2 db 20,0,20 dup('$')
    dnum3 db 20 dup(' '),'$'   
    n db '?'
    m db '?' 
    divs db '2'  
    nro dw '?'
    base dw 10 
.code 
   main proc far
    mov ax,@data
    mov ds,ax  
    mov es,ax
    clc     
    
    leer_cad dnum1 
	mov bl,[dnum1+1] 
	mov n,bl
	
	
	enter

	leer_cad dnum2
    lea si,[dnum2+2]   
    call cad_real   
    
    lea si,[dnum1+2]
	lea di,[dnum3]
	enter   
	xor cx,cx           
    
    mov ax,nro
    mov divs,al 
    
    mov cl,n
    xor ax,ax
    dfor:
        Lodsb 
        and al,0fh
        aad
        div divs
        stosb
    loop dfor
    
    lea di,[dnum3] 
    mov cl,n
    dfor1:
         mov al,[di]
         add al,30h
         mov [di],al
         inc di  
    loop dfor1
 mostrar_cad dnum3                     
fin 
   main endp 
    
   cad_real proc near
    
    sal_reg
          
    mov ax,0000h
    mov nro,ax 
    xor bx,bx
    while:
    mov bl,byte PTR [si]
    mov ax,nro
    
    cmp bl,13
    je fine
    sub bl,30h
    mul base
    add ax,bx
    mov nro,ax
    inc si
    jmp while
 fine:
    res_reg   
    ret
cad_real endp
     
end