i=sqrt(-1);
%S-Params at 2.4GHz
disp("S-Params at 2.4GHz BFG520 Common Emitter 6V10mA")
S11_r = 0.535
Theta_S11_grad=147.6
Theta_S11_rad = Theta_S11_grad*pi/180
S11 = S11_r*(cos(Theta_S11_rad)+i*sin(Theta_S11_rad))
disp("")

S21_r=2.798
Theta_S21_grad=64.2
Theta_S21_rad=Theta_S21_grad*pi/180
S21=S21_r*(cos(Theta_S21_rad)+i*sin(Theta_S21_rad))
disp("")
S12_r=0.097
Theta_S12_grad= 60.7
Theta_S12_rad=Theta_S12_grad*pi/180
S12=S12_r*(cos(Theta_S12_rad)+i*sin(Theta_S12_rad))
disp("")
S22_r=.280
Theta_S22_grad= -71.4
Theta_S22_rad=Theta_S22_grad*pi/180
S22=S22_r*(cos(Theta_S22_rad)+i*sin(Theta_S22_rad))
disp("")

%Maximum gain calculations
disp("Maximum gain calculations")
Delta = S11*S22-S12*S21
B1=1+abs(S11)^2-abs(S22)^2 -abs(Delta)^2
B2=1+abs(S22)^2-abs(S11)^2 -abs(Delta)^2
C1=S11 + Delta*conj(S22)
C2=S22 + Delta*conj(S11)
disp("")

Gamma_S_plus_2400MHz= (B1 + sqrt(B1^2 -4*abs(C1)^2) )/(2*C1)
Gamma_S_minus_2400MHz=(B1 - sqrt(B1^2 -4*abs(C1)^2) )/(2*C1)
Gamma_L_plus_2400MHz= (B2 + sqrt(B2^2 -4*abs(C2)^2) )/(2*C2)
Gamma_L_minus_2400MHz=(B2 - sqrt(B2^2 -4*abs(C2)^2) )/(2*C2)
disp("")
%%Absolute values of Gammas must be less than 1 but are not
disp("Absolute values of Gammas must be less than 1 but are not")
AbsGamma_S_plus=abs(Gamma_S_plus_2400MHz)
AbsGamma_S_minus=abs(Gamma_S_minus_2400MHz)
AbsGamma_L_plus=abs(Gamma_L_plus_2400MHz)
AbsGamma_L_minus=abs(Gamma_L_minus_2400MHz)
disp("")

%Gamma to impedances. Real part are negative!?
disp("Gamma to impedances. Real part are negative!?")
z_S_plus2400MHz =(1+Gamma_S_plus_2400MHz)/(1-Gamma_S_plus_2400MHz)
z_S_minus2400MHz =(1+Gamma_S_minus_2400MHz)/(1-Gamma_S_minus_2400MHz)
z_L_plus2400MHz =(1+Gamma_L_plus_2400MHz)/(1-Gamma_L_plus_2400MHz)
z_L_minus2400MHz =(1+Gamma_L_minus_2400MHz)/(1-Gamma_L_minus_2400MHz)
disp("")
%Stability check
disp('Stability check')
K_Stab=(1-abs(S11)^2-abs(S22)^2+abs(Delta)^2)/(2*abs(S12*S21))
Abs_Delta = abs(Delta)
if(K_Stab>1 & Abs_Delta<1)
 disp("Stability OK")
else
 disp("Stability not OK")
end
disp("")
%S21 gain
disp("S21 gain")
G_0=abs(S21)^2
G_0_dB=10*log10(G_0)
disp("")
%Gains of matching networks
disp("Gains of matching networks")
G_S=1/(1-AbsGamma_S_minus^2)
G_S_dB=10*log10(G_S)
disp("")
G_L=(1-AbsGamma_L_minus^2)/(abs(1-S22*Gamma_L_minus_2400MHz)^2)
G_L_dB=10*log10(G_L)
Total_Gain = G_S_dB+G_0_dB+G_S_dB

lambda=1000*3E8/2.4E9
Series_in = 0.011*lambda
Stub_in = 0.166*lambda

Series_out=0.196*lambda
Stub_out=0.128*lambda
