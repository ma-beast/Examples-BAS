screen 1,0
ink 255
paper 0

cls

print at 6,4;"ВСЕ ЗНАКИ  ALL CHARS"
dim f$(15)
data "0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"
for i=0 to 15
read f$(i)
next i

for y=0 to 15
for x=0 to 15
c=y*16+x
print at x+8,y*2+6;CHR$(c)
next x
next y
