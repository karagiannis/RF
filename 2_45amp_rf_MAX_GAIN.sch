<Qucs Schematic 0.0.20>
<Properties>
  <View=30,-84,1574,667,1.09287,0,0>
  <Grid=10,10,1>
  <DataSet=2_45amp_rf_MAX_GAIN.dat>
  <DataDisplay=2_45amp_rf_MAX_GAIN.dpl>
  <OpenDisplay=1>
  <Script=2_45amp_rf_MAX_GAIN.m>
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
  <GND * 5 520 240 0 0 0 0>
  <Pac P2 1 870 240 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 5 870 270 0 0 0 0>
  <Pac P1 1 180 250 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 5 180 290 0 0 0 0>
  <MLIN StubSource 1 270 60 15 -26 0 1 "RO3003_1" 1 "3.0622 mm" 1 "11.921 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN SeriesSource 1 410 210 -26 15 0 0 "RO3003_1" 1 "3.0622 mm" 1 "1.8601 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN SeriesLoad 1 650 210 -26 15 0 0 "RO3003_1" 1 "3.0622 mm" 1 "17.673 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN StubLoad 1 790 60 15 -26 0 1 "RO3003_1" 1 "3.0622 mm" 1 "9.9806 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Eqn Eqn1 1 1090 40 -31 19 0 0 "K=Rollet(S)" 1 "yes" 0>
  <Eqn Eqn2 1 1220 40 -31 19 0 0 "GT=dB((abs(S[2,1])/abs(S[1,2]))*(K-sqrt(K^2-1)))" 1 "yes" 0>
  <Eqn Eqn3 1 1080 160 -31 19 0 0 "Delta=S[1,1]*S[2,2]-S[1,2]*S[2,1]" 1 "yes" 0>
  <Eqn Eqn4 1 1080 270 -31 19 0 0 "B1=1+abs(S[1,1])^2-abs(S[2,2]-abs(Delta)^2)" 1 "B2=1+abs(S[2,2])^2-abs(S[1,1]-abs(Delta)^2)" 1 "C1=S[1,1]-Delta*conj(S[2,2])" 1 "C2=S[2,2]-Delta*conj(S[1,1])" 1 "GammaS=(B1-sqrt(B1^-4*abs(C1)^2))/(2*C1)" 1 "yes" 0>
  <Eqn Eqn5 1 1080 460 -31 19 0 0 "GammaL=(B2-sqrt(B2^-4*abs(C2)^2))/(2*C2)" 1 "yes" 0>
  <Eqn Eqn6 1 1080 560 -31 19 0 0 "GammaIndB=dB(abs(GammaS))" 1 "GammaOutdB=dB(abs(GammaL))" 1 "yes" 0>
  <SUBST RO3003_1 1 500 -20 -30 24 0 0 "4.4" 1 "1.6  mm" 1 "35 um" 1 "0.0018" 1 "0.022e-6" 1 "1.4e-6" 1>
  <Eqn Sparam 1 120 350 -30 16 0 0 "S12dB=dB(S[1,2])" 1 "S12=(S[1,2])" 1 "S11dB=dB(S[1,1])" 1 "S11=(S[1,1])" 1 "S21dB=dB(S[2,1])" 1 "S21=(S[2,1])" 1 "S22dB=dB(S[2,2])" 1 "S22=(S[2,2])" 1 "yes" 0>
  <SPfile X1 1 520 210 -26 -41 0 0 "/home/lasse/Documents/test M4/Spar_BFG520_commonemitter6V10mA.s2p" 0 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <.SP ss 1 60 -10 0 79 0 0 "lin" 1 "2.0 GHz" 1 "3 GHz" 1 "2701" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
</Components>
<Wires>
  <440 210 490 210 "" 0 0 0 "">
  <270 90 270 210 "" 0 0 0 "">
  <270 210 380 210 "" 0 0 0 "">
  <790 210 870 210 "" 0 0 0 "">
  <180 210 270 210 "" 0 0 0 "">
  <180 210 180 220 "" 0 0 0 "">
  <180 280 180 290 "" 0 0 0 "">
  <680 210 790 210 "" 0 0 0 "">
  <550 210 620 210 "" 0 0 0 "">
  <790 90 790 210 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Rect 320 540 240 160 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"S21dB" #0000ff 0 3 0 0 0>
	<"S22dB" #ff0000 0 3 0 0 0>
	<"S11dB" #ff00ff 0 3 0 0 0>
  </Rect>
  <Rect 670 540 240 160 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"GammaIndB" #0000ff 0 3 0 0 0>
	<"GammaOutdB" #ff0000 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>
