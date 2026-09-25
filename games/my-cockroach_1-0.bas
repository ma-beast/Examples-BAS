5 screen 1,0
7 paper 0
10 data "/o/","\O\","-X/","\o\","/O/","\x-"
15 xr=11
18 px=100
20 for i=0 to 39
25 ink 20+rnd*236
30 print tab xr;"@........@"
40 next
41 ink 255
42 print at 3,1;"ПОСТАВЬ ПАЛЕЦ НА ДОРОГУ"
43 print at 4,2;"УПРАВЛЯЙ ТАРАКАШКОЙ!!!"
45 pause
50 x=14
55 px=120
70 for d=1 to 100000000
75 ink 20+rnd*236
80 print at xr,39;"@........@"
90 print at 29,39;"  "
95 read c$
98 ink 63
100 print at x,0;c$
105 read c$
110 print at x,1;c$
115 read c$
120 print at x,2;c$
130 print at 0,0;"шагов ";d
140 if not d mod 2 then 155
150 restore
155 px=point(int(x)*8+12,28)
170 rem print at 55,39;px
160 if px > 19 then 1000
180 tx=touchx/8
190 if tx>x-1 then 210
200 x=x-1
210 if tx<x+1 then 230
220 x=x+1
230 xr=xr+rnd*2.01-1
240 if xr<15 then 260
250 xr=15
260 if xr>1 then 280
270 xr=1
280 for i=0 to 1000-(d/100000)
290 next
300 next

1000 for i=0 to 30
1010 ink rnd*256
1020 pcircle rnd*240,rnd*320,rnd*50
1030 print at rnd*15,rnd*39;"ВЫ ПРОБЕЖАЛИ ";d
1040 next
1050 pause
1055 restore
1060 goto 5

