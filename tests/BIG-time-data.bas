5 h=15
10 d=4
12 paper 0
15 cls
20 paper 0
30 ink 1

50 print at 0,0;time$
60 print at 0,1;date$

100 for y=0 to h
110 for x=0 to 79

150 p=point(x,y)

200 ink 0
210 pcircle x*d+d,y*d*2+50,d
220 ink 255
230 if y>7 then ink 195
240 if p then pcircle x*d+d,y*d*2+50,d

300 next x
310 next y

400 h=7

500 if touch then 1000

600 goto 20
1000 paper 48
1010 ink 132
1020 print at 5,28;"НАЖМИ КНОПКУ НАЗАД ДЛЯ ВЫХОДА"
1050 end


    