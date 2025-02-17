;BPB - Bios Parameter Block
;times 512 db 0
SECTOR_START:

; Переход к коду:   --------
db 0EBh, 5Ah, 90h          ; 3 байта (0x00 - 0x03)
;jmp CODE
;---------------------------

; Местка ОС(ASCII): --------
db 'MSWIN4.1'              ;
;---------------------------

; Размер сектора:   --------
db 02h, 00h                ; 512 байт
;---------------------------

; Кол-во секторов в кластере:
db 08h                    ; 8 байт
;---------------------------

; Размер резервной области:
db 00h, 20h               ; 32 сектора
;---------------------------

; Кол-во копий таблиц FAT: -
db 02h                    ; 2 копии
;---------------------------

db 00h, 00h, 00h, 00h

; Тип носителя: ------------
db 0F8h                   ; F8 - жёсткий диск (F0 - съёмный диск)
;---------------------------

db 00h, 00h

; Кол-во секторов на дорожке:
db 00h, 3Fh                 ; 512 байт
;---------------------------

; Кол-во головок: ----------
db 000h, 0FFh               ; 512 байт
;---------------------------

; Кол-во секторов перед началом тома:
db 00h, 00h, 00h, 00h               ; 0 секторов
;---------------------------

; Всего секторов в разделе:
db 00h, E6h, B0h, 68h      ;
;---------------------------

; Размер таблицы FAT: ------
db 00h, E6h, B0h, 68h      ; 3696 секторов
;---------------------------

db 00h, 00h
db 00h, 00h

; Смещение до кластера в корневом каталоге:
db 00h, 00h, 00h, 02h      ;
;---------------------------

; Сектор с FSINFO: ---------
db 00h, 01h                ;
;---------------------------

; Сектор с копией служебной информации:
db 00h, 06h                ;
;---------------------------

times 0x43-($-SECTOR_START) db 0

; Номер диска: -------------
db 80h                     ; 80 - жёсткий диск (0 - дискета)
;---------------------------

db 00h

; Статус расширенности: ----
db 29h                     ; 29 - расширенная загрузочная запись (0 - нет)
;---------------------------

; Серийный номер тома: -----
db 1Bh, 04h, 2Fh, 55h      ;
;---------------------------

; Метка тома  : ------------
db 'AtomOS'                ;
;---------------------------

times 0x52-($-SECTOR_START) db 0

; Тип файловой системы  : --
db 'FAT32'                 ;
;---------------------------

times 0x5A-($-SECTOR_START) db 0

CODE:
    mov ax, 1000h
    mov ES, ax
    mov BX, 0h

    mov AH, 2h      ; Выбор функции чтения секторов с диска (прерывание 13h БИОСа)
    mov AL, 1       ; Указываем количество секторов для чтения
    mov DL, 0h      ; Номер диска (0 - первая дискета)
    mov DH, 0       ; Номер головки
    mov CH, 0       ; Номер цилиндра
    mov CL, 3       ; Номер сектора (со второго сектора начинается вторичный загрузчик)
    int 13h

    jmp 1000h:0000h

times 510-($-SECTOR_START) db 0
db 055h, 0AAh