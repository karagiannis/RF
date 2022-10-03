<Qucs Schematic 0.0.20>
<Properties>
  <View=-126,-45,1832,943,0.946185,87,24>
  <Grid=10,10,1>
  <DataSet=13dBAt1800AvailiblePowergainSweep.dat>
  <DataDisplay=13dBAt1800AvailiblePowergainSweep.dpl>
  <OpenDisplay=1>
  <Script=13dBAt1800AvailiblePowergainSweep.m>
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
  <TLIN SourceStub 1 160 202 -45 -90 0 2 "50 Ohm" 1 "15.015 mm" 1 "0 dB" 0 "26.85" 0>
  <TLIN SourceSeries 1 250 300 -26 20 0 0 "50 Ohm" 1 "20.685 mm" 1 "0 dB" 0 "26.85" 0>
  <TLIN LoadStub 1 620 200 -26 20 0 0 "50 Ohm" 1 "19.825 mm" 1 "0 dB" 0 "26.85" 0>
  <TLIN LoadSeries 1 510 300 -26 20 0 0 "50 Ohm" 1 "42.568 mm" 1 "0 dB" 0 "26.85" 0>
  <Eqn Eqn1 1 190 430 -31 19 0 0 "K=Rollet(S)" 1 "yes" 0>
  <Eqn Eqn2 1 450 430 -31 19 0 0 "GT=dB((abs(S[2,1])/abs(S[1,2]))*(K-sqrt(K^2-1)))" 1 "yes" 0>
  <Eqn Eqn5 1 1290 630 -31 19 0 0 "GammaIndB=dB(abs(GammaS))" 1 "GammaOutdB=dB(abs(GammaL))" 1 "yes" 0>
  <Eqn Eqn7 1 1260 280 -31 19 0 0 "Gamma_out=S[2,2]+S[1,2]*S[2,1]*GammaS/(1-S[1,1]*GammaS)" 1 "phase_Gamma_out=phase(S[2,2]+S[1,2]*S[2,1]*GammaS/(1-S[1,1]*GammaS))" 1 "Gamma_in=S[1,1]+S[1,2]*S[2,1]*GammaL/(1-S[2,2]*GammaL)" 1 "Phase_Gamma_in=phase(S[1,1]+S[1,2]*S[2,1]*GammaL/(1-S[2,2]*GammaL))" 1 "yes" 0>
  <Eqn Eqn6 1 1260 470 -31 19 0 0 "GammaL=(B2-sqrt(B2^-4*abs(C2)^2))/(2*C2)" 1 "phase_GammaL=phase((B2-sqrt(B2^-4*abs(C2)^2))/(2*C2))" 1 "phase_GammaS=phase(GammaS)" 1 "yes" 0>
  <.SP SP1 1 430 10 0 81 0 0 "lin" 1 "1.5GHz" 1 "3GHz" 1 "1000" 1 "yes" 1 "1" 0 "2" 0 "no" 0 "no" 0>
</Components>
<Wires>
  <190 200 190 202 "" 0 0 0 "">
  <280 300 340 300 "" 0 0 0 "">
  <190 300 220 300 "" 0 0 0 "">
  <590 200 590 300 "" 0 0 0 "">
  <190 202 190 300 "" 0 0 0 "">
  <90 360 90 370 "" 0 0 0 "">
  <90 300 90 310 "" 0 0 0 "">
  <90 300 190 300 "" 0 0 0 "">
  <590 300 670 300 "" 0 0 0 "">
  <540 300 590 300 "" 0 0 0 "">
  <400 300 480 300 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Rect 20 700 240 160 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"S11dB" #0000ff 0 3 0 0 0>
	<"S22dB" #ff0000 0 3 0 0 0>
	<"S21dB" #ff00ff 0 3 0 0 0>
  </Rect>
  <Rect 680 170 240 160 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"F" #0000ff 0 3 0 0 0>
	<"Fmin" #ff0000 0 3 0 0 0>
  </Rect>
  <Rect 340 700 240 160 3 #c0c0c0 1 00 1 1.75e+09 2e+07 1.85e+09 1 -6.95388 5 2.93507 1 -1 1 1 315 0 225 "" "" "" "">
	<"GammaIndB" #0000ff 0 3 0 0 0>
	<"GammaOutdB" #ff0000 0 3 0 0 0>
  </Rect>
  <Rect 732 700 418 154 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"phase_GammaL" #0000ff 0 3 0 0 0>
	<"phase_Gamma_out" #ff0000 0 3 0 0 0>
  </Rect>
  <Rect 1020 181 374 161 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "" "">
	<"phase_GammaS" #ff0000 0 3 0 0 0>
	<"Phase_Gamma_in" #ff00ff 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>
