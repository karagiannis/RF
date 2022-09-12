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
line right_ elen*1/3
tline(right_ elen);rlabel(,T-line,)
line right_ elen*1/3
dot
line right_ elen*1/3
resistor(down_ Here.y-Origin.y); rlabel(,R,);label(,25,);

line left_ elen*1/3
dot
line left_ elen*5/3
dot
line to Origin
.PE
