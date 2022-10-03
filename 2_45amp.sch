<Qucs Schematic 0.0.20>
<Properties>
  <View=10,85,1177,754,1.26158,0,0>
  <Grid=10,10,1>
  <DataSet=2_45amp.dat>
  <DataDisplay=2_45amp.dpl>
  <OpenDisplay=1>
  <Script=2_45amp.m>
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
  <Eqn Load_Stub_Length 1 890 190 -31 19 0 0 "load_stub=1000*0.145732*3E8/2.4E9" 1 "yes" 0>
  <Eqn Load_Series_Length 1 890 300 -31 19 0 0 "load_series=1000*0.258049*3E+8/2.4E+9" 1 "yes" 0>
  <Eqn Source_Stub_length 1 900 420 -31 19 0 0 "source_stub=100*0.174063*3E8/2.4E9" 1 "yes" 0>
  <Eqn Serial_source_line 1 910 530 -31 19 0 0 "serial_source=1000*0.027160*3E8/2.4E9" 1 "yes" 0>
  <TLIN LoadStub 1 620 200 -26 20 0 0 "50 Ohm" 1 "18.216 mm" 1 "0 dB" 0 "26.85" 0>
  <TLIN LoadSeries 1 510 300 -26 20 0 0 "50 Ohm" 1 "32.256 mm" 1 "0 dB" 0 "26.85" 0>
  <TLIN SourceStub 1 160 202 -26 -77 0 2 "50 Ohm" 1 "2.1758 mm" 1 "0 dB" 0 "26.85" 0>
  <TLIN SourceSeries 1 250 300 -26 20 0 0 "50 Ohm" 1 "3.3950 mm" 1 "0 dB" 0 "26.85" 0>
  <.SP SP1 1 60 460 0 79 0 0 "lin" 1 "0.3 GHz" 1 "3 GHz" 1 "2701" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Sparam1 1 280 480 -30 16 0 0 "S12dB=dB(S[1,2])" 1 "S12=(S[1,2])" 1 "S11dB=dB(S[1,1])" 1 "S11=(S[1,1])" 1 "S21dB=dB(S[2,1])" 1 "S21=(S[2,1])" 1 "S22dB=dB(S[2,2])" 1 "S22=(S[2,2])" 1 "yes" 0>
  <Eqn Eqn1 1 480 590 -31 19 0 0 "GT=(abs(S[2,1])/abs(S[1,2]))*(Rollet(S)-sqrt(Rollet(S)^2-1)" 1 "yes" 0>
  <Eqn Eqn2 1 650 500 -31 19 0 0 "y=1" 1 "yes" 0>
</Components>
<Wires>
  <400 300 480 300 "" 0 0 0 "">
  <190 200 190 202 "" 0 0 0 "">
  <280 300 340 300 "" 0 0 0 "">
  <190 300 220 300 "" 0 0 0 "">
  <540 300 590 300 "" 0 0 0 "">
  <590 200 590 300 "" 0 0 0 "">
  <190 202 190 300 "" 0 0 0 "">
  <90 360 90 370 "" 0 0 0 "">
  <90 300 90 310 "" 0 0 0 "">
  <90 300 190 300 "" 0 0 0 "">
  <590 300 670 300 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
