screen 1,1
ink 255
paper 0

cls

print at 20,10;"ВСЕ ЦВЕТА ALL COLORS"
dim f$(15)
data "0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"
for i=0 to 15
read f$(i)
next i

for y=0 to 15
for x=0 to 15
c=y+x*16
paper c
ink 255-c
print at x*2+14,y+12;f$(y);f$(x)
next x
next y
