10 REM Fandal & Pedro 2020 a8.fandal.cz

20 GRAPHICS 0
25 SAVMSC=PEEK(88)+PEEK(89)*256
30 SAVMSC = SAVMSC + 5*40

35 ? "FINE SCROLL 0/1:"; : INPUT TYPE
40 RESTORE 100
45 IF TYPE=1 THEN RESTORE 200

50 FOR I=0 TO 32 : READ A : POKE 1536+I,A : NEXT I
55 POKE 1536+6,(SAVMSC-INT(SAVMSC/256)*256) : POKE 1536+7,INT(SAVMSC/256)
60 POKE 560,0:POKE 561,6

65 DIM A$(40)
70 FOR I=0 TO 39 : POKE 1600+I,0 : NEXT I
75 A$="TITLE" : FOR I=1 TO LEN(A$) : POKE 1600+I-1,ASC(A$(I,I))-32 : NEXT I
80 FOR I=0 TO 39 : POKE 1640+I,0 : NEXT I
85 A$="STATUS BAR" : FOR I=1 TO LEN(A$) : POKE 1640+I-1,ASC(A$(I,I))-32 : NEXT I

90 IF TYPE=1 THEN POKE 622,1
95 L.

100 REM FINE SCROLL 0
110 DATA 112,67, 64,6,112
120 DATA 67,64,188
130 DATA 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
140 DATA 112,67,104,6
150 DATA 65,0,6

200 REM FINE SCROLL 1
210 DATA 112,67, 64,6,112
220 DATA 99,64,188
230 DATA 35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,3
240 DATA 112,67,104,6
250 DATA 65,0,6
