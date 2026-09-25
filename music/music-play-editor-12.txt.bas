TEMPO=180
OCTAVE=4

DIM N$(12)

FOR I=0 TO 12
 READ N$(I)
NEXT I

DATA "&","C","#C","D","#D","E","F","#F","G","#G","A","#A","B"


SCREEN 0,1
INK 251


REM =========================================
REM ОБЩАЯ РАМКА ЭКРАНА

FOR X=0 TO 79
 PRINT AT X,0;CHR$(128)
 PRINT AT X,28;CHR$(128)
NEXT X

FOR Y=1 TO 28
 PRINT AT 0,Y;CHR$(129)
 PRINT AT 79,Y;CHR$(129)
NEXT Y

REM =========================================
REM ГОРИЗОНТАЛЬНЫЕ ЛИНИИ ТАБЛИЦЫ

FOR Y=2 TO 26 STEP 2
 FOR X=0 TO 63
  PRINT AT X,Y;CHR$(128)
 NEXT X
NEXT Y


REM =========================================
REM ВЕРТИКАЛЬНЫЕ ЛИНИИ

FOR X=0 TO 64 STEP 2
 FOR Y=2 TO 26
  PRINT AT X,Y;CHR$(129)
 NEXT Y
NEXT X


REM =========================================
REM ПЕРЕКРЕСТЬЯ В ОБЛАСТИ ТАБЛИЦЫ

FOR Y=4 TO 24 STEP 2
 FOR X=2 TO 62 STEP 2
  PRINT AT X,Y;CHR$(138)
 NEXT X
NEXT Y


REM =========================================
REM ВЕРХНИЕ ПЕРЕКРЕСТЬЯ

FOR X=2 TO 62 STEP 2
 PRINT AT X,2;CHR$(136)
NEXT X


REM =========================================
REM НИЖНИЕ ПЕРЕКРЕСТЬЯ

FOR X=2 TO 62 STEP 2
 PRINT AT X,26;CHR$(137)
NEXT X


REM =========================================
REM УГОЛКИ ТАБЛИЦЫ

PRINT AT 0,0;CHR$(130)
PRINT AT 79,0;CHR$(131)

PRINT AT 0,28;CHR$(132)
PRINT AT 79,28;CHR$(133)


REM =========================================
REM ГРАНИЦА УПРАВЛЕНИЯ

PRINT AT 64,2;CHR$(131)
PRINT AT 64,26;CHR$(133)


REM =========================================
REM НАЗВАНИЯ НОТ

PAPER 255
INK 0

PRINT AT 0,3;" C"

PAPER 0
INK 255
PRINT AT 1,5;"C"

PAPER 255
INK 0
PRINT AT 0,7;" D"

PAPER 0
INK 255
PRINT AT 1,9;"D"

PAPER 255
INK 0
PRINT AT 0,11;" E"
PRINT AT 0,13;" F"

PAPER 0
INK 255
PRINT AT 1,15;"F"

PAPER 255
INK 0
PRINT AT 0,17;" G"

PAPER 0
INK 255
PRINT AT 1,19;"G"

PAPER 255
INK 0
PRINT AT 0,21;" A"

PAPER 0
INK 255
PRINT AT 1,23;"A"

PAPER 255
INK 0
PRINT AT 0,25;" B"

PAPER 0
INK 255

REM =========================================
REM ОБЩАЯ РАМКА УПРАВЛЕНИЯ

INK 51

PRINT AT 66,3;"+----------+"
PRINT AT 66,4;"(  ИГРАТЬ  )"
PRINT AT 66,5;"+----------+"

INK 195

PRINT AT 66,23;"+----------+"
PRINT AT 66,24;"(  ВЫХОД   )"
PRINT AT 66,25;"+----------+"


REM === TEMPO ===

INK 60

PRINT AT 68,9;"ТЕМП-";TEMPO

PRINT AT 66,11;"+----++----+"
PRINT AT 66,12;"| -  || +  |"
PRINT AT 66,13;"+----++----+"


REM === OCTAVE ===

INK 240

PRINT AT 67,16;"ОКТАВА-";OCTAVE

PRINT AT 66,18;"+----++----+"
PRINT AT 66,19;"| -  || +  |"
PRINT AT 66,20;"+----++----+"


REM =========================================
REM MUSIC EDITOR

DIM NOTE(32)

REM =========RANDOMSCHINA=============
FOR I=0 TO 30
NOTE(I)=INT(RND*13)
IF NOTE(I) THEN PRINT AT (I*2+3),(NOTE(I)*2+1);INK 191;"#"
NEXT


100 REM =======EDITOR========

PAUSE

X=TOUCHX/4
Y=TOUCHY/8

IF X>=66 THEN GOTO 200

IF X<3 THEN GOTO 100
IF X>65 THEN GOTO 100
IF Y<3 THEN GOTO 100
IF Y>27 THEN GOTO 100

XT=INT((X-1)/2)
YT=INT((Y-3)/2)

IF XT>31 THEN GOTO 100
IF YT>11 THEN GOTO 100


REM ========== ЗАПОЛНЕНИЕ МАССИВА ==========

OLD=NOTE(XT)

IF OLD<>0 THEN PRINT AT XT*2+1,OLD*2+1;" "


IF OLD=YT+1 THEN GOTO 120

NOTE(XT)=YT+1

PAPER 191
PRINT AT XT*2+1,YT*2+3;" "

PAPER 0

GOTO 100


120 NOTE(XT)=0

GOTO 100


200 REM ========УПРАВЛЕНИЕ КНОПКАМИ=========

REM ==PLAY==

IF X>=66 AND X<=77 AND Y>=3 AND Y<=5 THEN GOSUB 9000


REM ==TEMPO==

IF X>=66 AND X<=71 AND Y>=11 AND Y<=13 AND TEMPO>60 THEN TEMPO=TEMPO-10

IF X>=72 AND X<=77 AND Y>=11 AND Y<=13 AND TEMPO<240 THEN TEMPO=TEMPO+10

PRINT AT 73,9;INK 255;TEMPO;"  "


REM ==OCTAVE==

IF X>=66 AND X<=71 AND Y>=18 AND Y<=20 AND OCTAVE>0 THEN OCTAVE=OCTAVE-1

IF X>=72 AND X<=77 AND Y>=18 AND Y<=20 AND OCTAVE<8 THEN OCTAVE=OCTAVE+1

PRINT AT 74,16;INK 255;OCTAVE


REM ==END==

IF X>=66 AND X<=77 AND Y>=23 AND Y<=25 THEN END

GOTO 100


9000 REM ==========SOBIRAEM PLAY============

MUSIC$="T"+STR$(TEMPO)+" O"+STR$(OCTAVE)+" "

FOR I=0 TO 30

 MUSIC$=MUSIC$+N$(NOTE(I))+" "

110 NEXT I

PLAY MUSIC$

RETURN