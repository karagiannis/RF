%\begin{filecontents*}[noheader,force]{sample1.m4}
include(pgf.m4)
.PS
cct_init
elen = 0.75
Origin: Here
source(up_ elen,AC); llabel(-,v_s,+)
resistor(right_ elen); rlabel(,R,)
dot
{

dot
}
line right_ elen*3/3
resistor(down_ Here.y-Origin.y); rlabel(,R,);

line left_ elen*3/3
dot
line to Origin
.PE
