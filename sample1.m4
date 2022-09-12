%\begin{filecontents*}[noheader,force]{sample1.m4}
include(pgf.m4)
.PS
cct_init
elen = 0.75
Origin: Here
source(up_ elen); llabel(-,v_s,+)
resistor(right_ elen); rlabel(,R,)
dot
{
capacitor(down_ to (Here,Origin))
rlabel(+,v,-);llabel(,C,)
dot
}
line right_ elen*3/3
inductor(down_ Here.y-Origin.y); rlabel(,L,);b_current(i)
line to Origin
.PE
