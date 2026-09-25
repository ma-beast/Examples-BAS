' -----ПОЗДРАВЛЕНЬЕ-----

paper 0
ink 255
screen 1,0

for i=0 to 10000
x=rnd*120+60
y=rnd*220+50
ink rnd*256
ptriangle x-30,y,x+25,y-5,x+5,y+30
pcircle x-15,y,13
pcircle x+13,y-3,13
print at x/8-5,y/8;"HAPPY DAY!!!"
next

pause

