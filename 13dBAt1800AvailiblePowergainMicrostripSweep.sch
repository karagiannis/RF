<Qucs Schematic 0.0.20>
<Properties>
  <View=-96,-27,1700,1003,0.946185,47,0>
  <Grid=10,10,1>
  <DataSet=13dBAt1800AvailiblePowergainMicrostripSweep.dat>
  <DataDisplay=13dBAt1800AvailiblePowergainMicrostripSweep.dpl>
  <OpenDisplay=1>
  <Script=13dBAt1800AvailiblePowergainMicrostripSweep.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <GND * 5 370 330 0 0 0 0>
  <GND * 5 670 360 0 0 0 0>
  <GND * 5 90 360 0 0 0 0>
  <Pac P1 1 90 340 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <Pac P2 1 670 330 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <SPfile X1 1 370 300 -26 -41 0 0 "/home/lasse/Documents/test M4/Spar_BFG520_commonemitter6V10mA.s2p" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <Eqn Eqn4 1 900 240 -31 19 0 0 "Delta=S[1,1]*S[2,2]-S[1,2]*S[2,1]" 1 "yes" 0>
  <Eqn Eqn3 1 900 340 -31 19 0 0 "B1=1+abs(S[1,1])^2-abs(S[2,2]-abs(Delta)^2)" 1 "B2=1+abs(S[2,2])^2-abs(S[1,1]-abs(Delta)^2)" 1 "C1=S[1,1]-Delta*conj(S[2,2])" 1 "C2=S[2,2]-Delta*conj(S[1,1])" 1 "GammaS=(B1-sqrt(B1^-4*abs(C1)^2))/(2*C1)" 1 "yes" 0>
  <Eqn Sparam1 1 300 10 -30 16 0 0 "S12dB=dB(S[1,2])" 1 "S12=(S[1,2])" 1 "S11dB=dB(S[1,1])" 1 "S11=(S[1,1])" 1 "S21dB=dB(S[2,1])" 1 "S21=(S[2,1])" 1 "S22dB=dB(S[2,2])" 1 "S22=(S[2,2])" 1 "yes" 0>
  <MLIN MS1 1 80 180 -26 15 0 0 "Subst1" 1 "3.0622 mm" 1 "8.2282 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS3 1 270 300 -26 15 0 0 "Subst1" 1 "3.0622 mm" 1 "11.335 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS2 1 700 200 -26 15 0 0 "Subst1" 1 "3.0622 mm" 1 "10.864 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS4 1 480 300 -26 15 0 0 "Subst1" 1 "3.0622 mm" 1 "23.326 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Eqn Eqn1 1 120 440 -31 19 0 0 "K=Rollet(S)" 1 "yes" 0>
  <Eqn Eqn2 1 290 450 -31 19 0 0 "GT=dB((abs(S[2,1])/abs(S[1,2]))*(K-sqrt(K^2-1)))" 1 "yes" 0>
  <.SP SP1 1 430 10 0 81 0 0 "lin" 1 "1.55 GHz" 1 "3GHz" 1 "1000" 1 "yes" 1 "1" 0 "2" 0 "no" 0 "no" 0>
  <SUBST Subst1 1 1110 50 -30 24 0 0 "4.4" 1 "1.6 mm" 1 "35 um" 1 "0.0018" 1 "0.022e-6" 1 "0.15e-6" 1>
  <Eqn Eqn6 1 1220 100 -31 19 0 0 "GammaL=(B2-sqrt(B2^-4*abs(C2)^2))/(2*C2)" 1 "yes" 0>
  <Eqn Eqn5 1 1230 210 -31 19 0 0 "GammaIndB=dB(abs(GammaIn))" 1 "GammaOutdB=dB(abs(GammaOut))" 1 "yes" 0>
  <Eqn Eqn8 1 1260 350 -31 19 0 0 "phase_GammaOut=phase(GammaOut)" 1 "phase_GammaIn=phase(GammaIn)" 1 "phase_GammaS=phase(GammaS)" 1 "phase_GammaL=phase(GammaL)" 1 "yes" 0>
  <Eqn Eqn7 1 890 540 -31 19 0 0 "GammaIn=S[1,1]+S[1,2]*S[2,1]*GammaL/(1-S[1,1]*GammaL)" 1 "GammaOut=S[2,2]+S[1,2]*S[2,1]*GammaS/(1-S[2,2]*GammaS)" 1 "yes" 0>
</Components>
<Wires>
  <590 200 590 300 "" 0 0 0 "">
  <90 360 90 370 "" 0 0 0 "">
  <90 300 90 310 "" 0 0 0 "">
  <90 300 190 300 "" 0 0 0 "">
  <590 300 670 300 "" 0 0 0 "">
  <190 300 240 300 "" 0 0 0 "">
  <300 300 340 300 "" 0 0 0 "">
  <400 300 450 300 "" 0 0 0 "">
  <510 300 590 300 "" 0 0 0 "">
  <590 200 670 200 "" 0 0 0 "">
  <190 180 190 300 "" 0 0 0 "">
  <110 180 190 180 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Rect 770 150 240 160 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"F" #0000ff 0 3 0 0 0>
	<"Fmin" #ff0000 0 3 0 0 0>
  </Rect>
  <Rect 50 710 240 160 3 #c0c0c0 1 00 1 0 1e+09 5e+09 1 -22.4075 20 20 1 -1 1 1 315 0 225 "" "" "" "">
	<"S11dB" #0000ff 0 3 0 0 0>
	<"S22dB" #ff0000 0 3 0 0 0>
	<"S21dB" #ff00ff 0 3 0 0 0>
  </Rect>
  <Rect 390 690 285 147 3 #c0c0c0 1 00 1 1.5e+09 5e+08 3e+09 1 18.4334 5 32.7376 1 -1 1 1 315 0 225 "" "" "" "">
	<"GT" #0000ff 0 3 0 0 0>
	<"GammaIndB" #0000ff 0 3 0 0 0>
	<"GammaOutdB" #ff00ff 0 3 0 0 0>
  </Rect>
  <Rect 830 820 683 180 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"phase_GammaIn" #0000ff 0 3 0 0 0>
	<"phase_GammaL" #ff0000 0 3 0 0 0>
	<"phase_GammaOut" #ff00ff 0 3 0 0 0>
	<"phase_GammaS" #00ff00 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>
