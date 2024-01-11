[org 0x0100]

jmp start       

data: dw   6, 2, 4, 5
swap: db   0    ; use this as a flag 

start: 
    ; mov  cx, 4                           

    outerloop: 
        mov  bx, 0    
        mov  byte [swap], 0              
        
        innerloop: 
            mov  ax, [data + bx]
            cmp  ax, [data + bx + 2]     
            
            jbe  noswap                  

                ; the swap potion 
                mov  dx, [data + bx + 2]
                mov  [data + bx + 2], ax     
                mov  [data + bx], dx
                mov  byte [swap], 1 

            noswap:
            add  bx, 2
            cmp  bx, 6
            jne  innerloop

        cmp  byte [swap], 1   
        je   outerloop 

        ; sub cx, 1 
        ; jnz outerloop 


    mov  ax, 0x4c00
    int  0x21