10 REM DL The Neverending Story - Datasoft 1985

20 POKE 106,PEEK(106)-16 : GRAPHICS 0 : RAMTOP=PEEK(106) : REM rezervovanie pamate 8kb (16*256)
30 SAVMSC=PEEK(88)+PEEK(89)*256 : REM odloz adresu aktualnej VRAM
40 SAVMSC = SAVMSC + 9*40 : REM posun grafickej pamate o 9 riadkov
50 ADRDL=1536 : DLLENGTH=105 : REM adresa noveho DL $600=1536 a jeho dlzka

60 FOR I=0 TO DLLENGTH-1 : REM nacitaj data DL na adresu ADRDL
61   READ A
62   IF A>-1 THEN POKE ADRDL+I,A 
63 NEXT I

64 POKE ADRDL+4,0 : POKE ADRDL+5,RAMTOP : REM adresa grafickej pamate horneho okna
65 POKE ADRDL+86,(SAVMSC-INT(SAVMSC/256)*256) : POKE ADRDL+87,INT(SAVMSC/256) : REM adresa grafickej pamate textoveho spodneho okna
66 POKE ADRDL+DLLENGTH-2,(ADRDL-INT(ADRDL/256)*256) : POKE ADRDL+DLLENGTH-1,INT(ADRDL/256) : REM startovna adresa samotneho DL

100 POKE 560,(ADRDL-INT(ADRDL/256)*256) : POKE 561,INT(ADRDL/256) : REM zapnutie DL

1000 DATA 112,112,48,78,-1,-1,14,14,14,14,14,14,14,14,14,14
1100 DATA 14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14
1200 DATA 14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14
1300 DATA 14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14
1400 DATA 14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14
1500 DATA 14,14,14,14,142,98,-1,-1,34,34,34,34,34,34,34,34
1600 DATA 34,34,34,34,34,2,65,-1,-1

2229 POKE 712,96 : POKE 708,116 : POKE 709,120 : POKE 710,36 : POKE 82,0 : REM nastav farby a okraj

2230 SIZE=3200 : OPEN #1,4,0,"H:def.MIC"
2240   FOR I=0 TO SIZE-1 : GET #1,P : POKE (RAMTOP*256)+I,P : NEXT I: REM Atari Basic
2240   BGET #1,(RAMTOP*256),SIZE : REM Turbo Basic
2290 CLOSE #1


2400 FOR I=0 TO 10:?:NEXT I
2401 ? "INPUT TYPE 0-2:"; : INPUT TYPE

2410 IF TYPE<>1 THEN 2430
2420 RESTORE 2425
2421 FOR I=0 TO 19 : REM nacitaj rutinu hned za DL
2422   READ A
2423   IF A>-1 THEN POKE 1536+DLLENGTH+I,A : REM spustenie farbenia urcuje +128 v display liste
2424 NEXT I
2425 DATA 72,138,72,169,30,162,90,141,10,212,141,26,208,141,24,208,104,170,104,64
2426 POKE 1536+DLLENGTH+4,30 : REM farbu urcuje 5 cislo


2430 IF TYPE<>2 THEN 2450
2431 RESTORE 2436
2432 FOR I=0 TO 10 : REM nacitaj rutinu hned za DL
2433   READ A
2434   IF A>-1 THEN POKE 1536+DLLENGTH+I,A : REM spustenie farbenia urcuje +128 v display liste
2435 NEXT I 
2436 DATA 72,169, -1, 141,10,212,141,24,208,104,64
2437 POKE 1536+DLLENGTH+2,30 : REM farbu urcuje 3 cislo

2450 IF TYPE<1 OR TYPE>2 THEN 2460
2451 REM nastavenie vektora prerusenia a spustenie (POKE 54286,64 je OFF)
2452 POKE 512,(1536+DLLENGTH)-INT((1536+DLLENGTH)/256)*256:POKE 513,INT((1536+DLLENGTH)/256):POKE 54286,192

2460 POKE 622,1 : L.
