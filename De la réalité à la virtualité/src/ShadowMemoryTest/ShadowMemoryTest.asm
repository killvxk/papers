.386
.model flat, stdcall

include windows.inc

include kernel32.inc
include msvcrt.inc

includelib kernel32.lib
includelib msvcrt.lib

.data

	myString db "Je suis actuellement dans la page 2 mais si je me lit moi meme je vois la page %d !",0Ah,0h
	myString2 db "Dump de la page 2 se trouvant a l'adresse %x : ",0Ah,0h
	myChar db  "%x ",0h
	myChar2 db 0Ah,0h


.code Page02

	NbPage_ db 02

MaFonction proc

	xor eax, eax

	mov al, byte ptr[NbPage_]

	INVOKE crt_printf, ADDR myString,eax

	ret
MaFonction endp


.code Page01

	NbPage db 01
	
DumPage proc AddrStart   :DWORD,
            		 AddrEnd	:DWORD
            
 	mov eax, AddrStart
 	cmp eax, AddrEnd
 	je Exit
 	
 	xor eax, eax
 	xor ebx,ebx
 	
 	mov ebx, AddrStart
 	
 	mov al, byte ptr[ebx]
 	
 	invoke crt_printf, ADDR myChar,eax
  	
  	inc AddrStart
  	
  	invoke DumPage, AddrStart ,AddrEnd
  	
Exit:
	ret
DumPage endp

Start:
	invoke MaFonction

	invoke Sleep, 2000
	
	invoke crt_printf, ADDR myString2,MaFonction-1
	
	invoke DumPage,MaFonction-1,MaFonction+20
	
	invoke crt_printf, ADDR myChar2
	
	invoke Sleep, 2000

	jmp Start

end Start


