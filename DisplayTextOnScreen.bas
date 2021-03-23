10000 END : REM kontrola pozicie kurzora a posun textu aby bol vidiet
10010 LastVisibleLine=18 : REM posledny viditelny riadok
10020 ROWCRS=PEEK(84) : REM aktualny riadok
10030 ROWCRS=ROWCRS-LastVisibleLine
10040 IF ROWCRS<=0 THEN RETURN : REM zobrazene vsetko
10050 POKE 84,23 : REM presun sa na posledny mozny riadok (LastLine=23)
10060 PRINT : REM scroll
10070 ROWCRS=ROWCRS-1
10080 IF ROWCRS<1 THEN POKE 84,(LastVisibleLine+1) : RETURN
10090 GOTO 10060
