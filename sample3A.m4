include(pgf.m4)
.PS
cct_init
elen = 0.75
Vs: source(up_ elen,AC); llabel(-,v_s,+)
resistor(right_ elen); rlabel(,R_g`\,'50\Omega,) # rlabel sets math mode
D1: dot
#{
#
#dot
#}
line right_ elen*1/3
tline(right_ elen);rlabel(,\hbox{\sl T-line}`\,'50\Omega,)
line right_ elen*1/3
D2: dot
line right_ elen*1/3
resistor(down_ Here.y-Origin.y); rlabel(,R_L,);llabel(,25\Omega,);

#line left_ elen*1/3
#dot
{ dot(at (D1,Here)) }
{ dot(at (D2,Here)) }
#line left_ elen*5/3
line to Vs.start
.PE
