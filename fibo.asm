; ==============================================================================
; Archivo:     fibo.asm
; Propósito:   Genera la serie de Fibonacci
; Entorno:     DOS 16-bit (Ensamblador: MASM/TASM)
; Autor:       Juan Pablo Strelli (StrelliPablo)
; Fecha:       7 de octubre 2012
; Notas:       programa que genera la serie de Fibonacci hasta el número 1000, usando macros de procedimientos para E/S y gráficos.
;              Se utiliza la macro de procedimientos para leer una cadena, imprimir una cadena, leer un caracter y imprimir un caracter.
;              Se utiliza la macro de procedimientos para guardar y restaurar los registros.
; ==============================================================================

include mymac.asm
.Model Small
.Stack 256
.Data
 msg db 'El valor de N: $' 
 cad db 10 dup('$') 
 cadnum db 90 dup('$')
 ENTER db 10,13,'$'  
 base dw 10  
 nro dw '?'
 aa db 0001h
 bb db 0000h
.Code
 main Proc Far
  MOV AX,@data
  MOV DS,AX 
  imprimir_cad msg
  leer_cad cad
  imprimir_cad ENTER
  LEA SI,[cad + 2]
  CALL cad_real
  LEA SI,cadnum
  MOV CX,nro    
  for:
   xor ax,ax
   MOV Al,aa
   ADD Al,bb
   CALL real_cad
   imprimir_cad cadnum
   xor bx,bx
   MOV Bl,bb
   MOV aa,Bl
   MOV bb,Al
  LOOP for
  MOV AH,4CH
  INT 21h
 main EndP

 ;convierte una cadena en real [si] tiene que apuntar a la cadena
 ; devuelve el valor en nro
 cad_real Proc Near    
  sal_reg        
  MOV AX,0000h
  MOV nro,AX 
  XOR BX,BX
  while:
  MOV BL,byte PTR [SI]
  MOV AX,nro
  CMP BL,13
  JE fin
  SUB BL,30h
  MUL base
  ADD AX,BX
  MOV nro,AX
  INC SI
  JMP while
  fin:
   res_reg   
   RET
 cad_real EndP  

 ;combierte de un real en caddena [si] apunta a la cadena
 ;ax esta el numero
 real_cad Proc Near 
  sal_reg
  XOR CX,CX
  while1:
   CMP AX,0
   JE fin1
   XOR DX,DX
   DIV base
   PUSH DX
   INC CX
  JMP while1
  fin1:    
  ;lea si,cadnum    
  while3:
   CMP CX,0
   JE fin3
   POP BX
   ADD BX,30h
   MOV [SI],BX
   DEC CX
   INC SI
   JMP while3
 fin3:
  res_reg 
  RET
 real_cad EndP
End 