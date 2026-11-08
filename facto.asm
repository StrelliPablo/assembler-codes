; ==============================================================================
; Archivo:     facto.asm
; Propósito:   encuentra el factorial de un número
; Entorno:     DOS 16-bit (Ensamblador: MASM/TASM)
; Autor:       Juan Pablo Strelli (StrelliPablo)
; Fecha:       12 de marzo 2012
; Notas:       calculo del factorial en assembler sin offset de memoria, con la funcion real_cad para convertir a número y cad_real para convertir a cadena.
; ==============================================================================

include mymacro.asm
.model small
.stack 256
.data
    num db 5,0, 3 dup ('$')
	cadnum db 20 dup ('$')
	cadnum1 db 20 dup ('$')
	nro dw '?'
	ph dw 0000h
	pl dw 0001d 
	veces db 00h
	;enter db 10,13,'$'
	a db 35h,13
	base dw 10
.code
	
		mov ax,@data
		mov ds,ax
		leer_cad num
		
		lea si,[num+2]
		call cad_real
	    xor cx,cx
		enter 
        foor:
        inc cx 
        cmp cx,nro   
        ja fiin
        
        call multi
                     
        jmp foor
	    fiin:
	    
	    mov ax,ph
	    
		lea si,cadnum
		call real_cad

	    mov ax,pl	    

		
		call real_cad
		mostrar_cad cadnum 
		fin
multi proc near 
        push cx
        mov ax,ph
        mov bx,pl
        dec cx
        ffor:
        cmp cx,0h
        je finn
        add bx,pl
        adc ax,ph
        dec cx
        jmp ffor
        finn:     
        
        mov ph,ax
        mov pl,bx
        pop cx
        ret
multi endp

;convierte una cadena en real [si] tiene que apuntar a la cadena
; devuelve el valor en nro
cad_real proc near 
    mov ax,0000h
    mov nro,ax
    while:
    mov bl,byte PTR [si]
    mov ax,nro
    mov bh,0
    cmp bl,13
    je fina
    sub bl,30h
    mul base
    add ax,bx
    mov nro,ax
    xor dx,dx
    inc si
    jmp while
 fina:
    ret
cad_real endp
;tiene que estar apuntando a si a la cadena
;combierte de un real en caddena
real_cad proc near    
    xor cx,cx
 while1:
    cmp ax,0
    je fin1
    xor dx,dx
    div base
    push dx
    inc cx
    jmp while1
 fin1:    
    ;lea si,cadnum     
 while3:
    cmp cx,0
    je fin3
    pop bx
    add bx,30h
    mov [si],bx
    dec cx
    inc si
    jmp while3
 fin3:
    ret
real_cad endp 
end 