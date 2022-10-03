<Qucs Schematic 0.0.20>
<Properties>
  <View=-46,-120,1759,920,0.898136,0,0>
  <Grid=10,10,1>
  <DataSet=13dBAt1800AvailiblePowergainMicrostripBendsInteger.dat>
  <DataDisplay=13dBAt1800AvailiblePowergainMicrostripBendsInteger.dpl>
  <OpenDisplay=1>
  <Script=13dBAt1800AvailiblePowergainMicrostripBendsInteger.m>
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
  <SPfile X1 1 370 300 -26 -41 0 0 "/home/lasse/Documents/test M4/Spar_BFG520_commonemitter6V10mA.s2p" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <Eqn Eqn4 1 900 240 -31 19 0 0 "Delta=S[1,1]*S[2,2]-S[1,2]*S[2,1]" 1 "yes" 0>
  <Eqn Sparam1 1 300 10 -30 16 0 0 "S12dB=dB(S[1,2])" 1 "S12=(S[1,2])" 1 "S11dB=dB(S[1,1])" 1 "S11=(S[1,1])" 1 "S21dB=dB(S[2,1])" 1 "S21=(S[2,1])" 1 "S22dB=dB(S[2,2])" 1 "S22=(S[2,2])" 1 "yes" 0>
  <GND * 5 710 420 0 0 0 0>
  <Pac P2 1 710 340 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <Pac P1 1 10 340 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 5 10 410 0 0 0 0>
  <Eqn Eqn1 1 40 10 -31 19 0 0 "K=Rollet(S)" 1 "yes" 0>
  <MLIN MS1 1 40 150 -26 15 0 0 "Subst1" 1 "3 mm" 1 "8 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MTEE MS5 1 150 298 -26 15 0 2 "Subst1" 1 "3 mm" 1 "3 mm" 1 "3 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MLIN MS3 1 270 300 -26 15 0 0 "Subst1" 1 "3 mm" 1 "8 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS4 1 470 300 -26 15 0 0 "Subst1" 1 "3 mm" 1 "24 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MTEE MS6 1 590 298 -26 15 0 2 "Subst1" 1 "3 mm" 1 "3 mm" 1 "3 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MLIN MS2 1 690 140 -26 15 0 0 "Subst1" 1 "3 mm" 1 "11 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Eqn Eqn5 1 1270 700 -31 19 0 0 "absDelta=abs(S[1,1]*S[2,2]-S[1,2]*S[2,1])" 1 "GammaOutdB=dB(abs(Gamma_Out))" 1 "yes" 0>
  <Eqn Eqn6 1 1290 630 -31 19 0 0 "GammaL=(B2-sqrt(B2^-4*abs(C2)^2))/(2*C2)" 1 "yes" 0>
  <Eqn Eqn3 1 870 360 -31 19 0 0 "B1=1+abs(S[1,1])^2-abs(S[2,2]-abs(Delta)^2)" 1 "B2=1+abs(S[2,2])^2-abs(S[1,1]-abs(Delta)^2)" 1 "C1=S[1,1]-Delta*conj(S[2,2])" 1 "C2=S[2,2]-Delta*conj(S[1,1])" 1 "GammaS=(B1-sqrt(B1^-4*abs(C1)^2))/(2*C1)" 1 "yes" 0>
  <SUBST Subst1 1 1480 460 -30 24 0 0 "4.4" 1 "1.6 mm" 1 "35 um" 1 "0.0018" 1 "0.022e-6" 1 "0.15e-6" 1>
  <Eqn Eqn8 1 1220 280 -31 19 0 0 "y=1" 1 "phase_GammaOut=phase(Gamma_Out)" 1 "phase_GammaIn=phase(Gamma_In)" 1 "phase_GammaS=phase(GammaS)" 1 "phase_GammaL=phase(GammaL)" 1 "yes" 0>
  <Eqn Eqn2 1 1020 180 -31 19 0 0 "GT=dB((abs(S[2,1])/abs(S[1,2]))*(K-sqrt(K^2-1)))" 1 "yes" 0>
  <Eqn Eqn7 1 1170 120 -31 19 0 0 "Gamma_Out=S[2,2]+S[1,2]*S[2,1]*GammaS/(1-S[2,2]*GammaS)" 1 "Gamma_In=S[1,1]+S[1,2]*S[2,1]*GammaL/(1-S[1,1]*GammaL)" 1 "yes" 0>
  <.SP SP1 1 430 10 0 81 0 0 "lin" 1 "40 MHz" 1 "3 GHz" 1 "21" 1 "yes" 0 "1" 1 "2" 0 "no" 0 "no" 0>
</Components>
<Wires>
  <300 300 340 300 "" 0 0 0 "">
  <710 370 710 420 "" 0 0 0 "">
  <400 300 440 300 "" 0 0 0 "">
  <10 370 10 410 "" 0 0 0 "">
  <10 310 10 340 "" 0 0 0 "">
  <10 300 10 310 "" 0 0 0 "">
  <10 300 120 300 "" 0 0 0 "">
  <120 298 120 300 "" 0 0 0 "">
  <180 300 240 300 "" 0 0 0 "">
  <180 298 180 300 "" 0 0 0 "">
  <560 298 560 300 "" 0 0 0 "">
  <500 300 560 300 "" 0 0 0 "">
  <620 298 620 300 "" 0 0 0 "">
  <710 310 710 340 "" 0 0 0 "">
  <710 300 710 310 "" 0 0 0 "">
  <620 300 710 300 "" 0 0 0 "">
  <590 140 660 140 "" 0 0 0 "">
  <590 140 590 268 "" 0 0 0 "">
  <150 150 150 268 "" 0 0 0 "">
  <70 150 150 150 "" 0 0 0 "">
  <590 268 590 270 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Rect 100 700 240 160 3 #c0c0c0 1 00 1 0 1e+09 5e+09 1 -22.4075 20 20 1 -1 1 1 315 0 225 "" "" "" "">
	<"S11dB" #0000ff 0 3 0 0 0>
	  <Mkr 1.964e+09 -119 -238 3 0 0>
	<"S22dB" #ff0000 0 3 0 0 0>
	<"S21dB" #ff00ff 0 3 0 0 0>
	  <Mkr 1.964e+09 -90 42 3 0 0>
  </Rect>
  <Rect 820 710 240 160 3 #c0c0c0 1 00 1 1.75e+09 2e+07 1.85e+09 1 -100 100 100 1 -1 1 1 315 0 225 "" "" "" "">
	<"phase_GammaL" #ff0000 0 3 0 0 0>
	  <Mkr 1.964e+09 -10 80 3 0 0>
	<"phase_GammaOut" #ff00ff 0 3 0 0 0>
	  <Mkr 1.964e+09 190 81 3 0 0>
  </Rect>
  <Rect 427 695 240 160 3 #c0c0c0 1 00 1 1.75e+09 2e+07 1.85e+09 1 -11.6386 5 1.77023 1 -1 1 1 315 0 225 "" "" "" "">
	<"phase_GammaIn" #ff00ff 0 3 0 0 0>
	  <Mkr 1.964e+09 140 79 3 0 0>
	<"phase_GammaS" #ffff00 0 3 0 0 0>
	  <Mkr 1.964e+09 -70 77 3 0 0>
  </Rect>
  <Rect 790 120 240 160 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"F" #0000ff 0 3 0 0 0>
	  <Mkr 1.964e+09 -217 -182 3 0 0>
	<"Fmin" #ff0000 0 3 0 0 0>
	  <Mkr 1.964e+09 -217 -57 3 0 0>
	  <Mkr 1.964e+09 270 -93 3 0 0>
  </Rect>
  <Rect 1280 60 240 160 3 #c0c0c0 1 00 1 1.5e+09 5e+08 3e+09 1 0.302595 0.5 1.5 1 -1 1 1 315 0 225 "" "" "" "">
	<"K" #0000ff 0 3 0 0 0>
	<"absDelta" #ff0000 0 3 0 0 0>
	<"K" #ff00ff 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>
