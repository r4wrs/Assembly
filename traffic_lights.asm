
        OUTPUT  2500AD

        ORG     2000H
START:  MOV     AL,80H              ; I/ Mode 0
        MOV     DX,0FFE6H
        OUT     DX,AL               ; Tüm portları çıkış olarak belirleme

AGAIN:  MOV     SI,2038H            ; Port değerlerine ait tablonun adresi
NEXTST: MOV     AL,[SI]
        MOV     DX,0FFE0H
        OUT     DX,AL               ; PortA değeri
        INC     SI
        ADD     DX,2
        MOV     AL,[SI]
        OUT     DX,AL               ; PortB değeri
        INC     SI
        ADD     DX,2
        MOV     AL,[SI]
        OUT     DX,AL               ; PortC değeri
        INC     SI
        CALL    DELAY               ; Gecikme çağırma
        CMP     SI,2056H            ; Veri değerlerinin sonunu kontrol etme
        JNZ     NEXTST
        JMP     AGAIN

DELAY:  MOV     CX,0FFH             ; Gecikme
DLY5:   PUSH    CX
        MOV     CX,03FFH
DLY10:  NOP
        LOOP    DLY10
        POP     CX
        LOOP    DLY5
        RET

        ORG     2038H
PORTVALUES: DB      10H,81H,7AH         ; Durum 1
            DB      44H,44H,0F0H        ; Tüm sarılar açık
            DB      08H,11H,0E5H        ; Durum 2
            DB      44H,44H,0F0H        ; Tüm sarılar açık
            DB      81H,10H,0DAH        ; Durum 3
            DB      44H,44H,0F0H        ; Tüm sarılar açık
            DB      11H,08H,0B5H        ; Durum 4
            DB      44H,44H,0F0H        ; Tüm sarılar açık
            DB      88H,88H,00H         ; Durum 5
            DB      44H,44H,0F0H        ; Tüm sarılar açık
            DB      00H