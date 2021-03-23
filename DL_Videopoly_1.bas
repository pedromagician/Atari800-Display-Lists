10 REM DL Videopoly - Radek Sterba 1992

20 POKE 106,PEEK(106)-16 : GRAPHICS 0 : RAMTOP=PEEK(106) : REM rezervovanie pamate 8kb (16*256)
30 SAVMSC=PEEK(88)+PEEK(89)*256 : REM odloz adresu aktualnej VRAM
40 SAVMSC = SAVMSC + 5*40 : REM posun grafickej pamate o 5 riadkov
50 ADRDL=1536 : DLLENGTH=88 : REM adresa noveho DL $600=1536 a jeho dlzka

60 FOR I=0 TO DLLENGTH-1 : REM nacitaj data DL na adresu ADRDL
61   READ A
62   IF A>-1 THEN POKE ADRDL+I,A 
63 NEXT I

64 POKE ADRDL+6,0 : POKE ADRDL+7,RAMTOP : REM adresa grafickej pamate horneho okna
65 POKE ADRDL+65,(SAVMSC-INT(SAVMSC/256)*256) : POKE ADRDL+66,INT(SAVMSC/256) : REM adresa grafickej pamate textoveho spodneho okna
66 POKE ADRDL+DLLENGTH-2,(ADRDL-INT(ADRDL/256)*256) : POKE ADRDL+DLLENGTH-1,INT(ADRDL/256) : REM startovna adresa samotneho DL

100 POKE 560,(ADRDL-INT(ADRDL/256)*256) : POKE 561,INT(ADRDL/256) : REM zapnutie DL

1000 DATA 112,0,0,16,112,78,-1,-1,14,14,14,14,14,14,14,14
1020 DATA 14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14
1030 DATA 14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14 
1040 REM DATA 14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,208
1041 DATA 14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,144
1050 DATA 98,-1,-1,34,34,34,34,34,34,34,34,34,34,34,34,34 
1060 DATA 34,34,34,162,2,65,-1,-1

2229 POKE 712,96 : POKE 708,116 : POKE 709,120 : POKE 710,36 : POKE 82,0 : REM nastav farby a okraj

2230 SIZE=3200 : OPEN #1,4,0,"H:def.MIC"
2240   FOR I=0 TO SIZE-1 : GET #1,P : POKE (RAMTOP*256)+I,P : NEXT I: REM Atari Basic
2240   BGET #1,(RAMTOP*256),SIZE : REM Turbo Basic
2290 CLOSE #1
2300 POKE 622,1 : L.
