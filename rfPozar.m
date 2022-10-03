clear all
% addpath("/home/lasse/Documents/test M4/ewa")
i=sqrt(-1);



disp("S-Params at 2.4GHz BFG520 Common Emitter 6V10mA")
S11_r = 0.72
Theta_S11_grad=-116
S21_r=2.60
Theta_S21_grad=76
S12_r=0.03
Theta_S12_grad= 57
S22_r=0.73
Theta_S22_grad= -54

disp("")
S=smat([0.72 -116 2.6 76 0.03 57 0.73 -54])
disp("")









disp("")
disp("")

Theta_S11_rad = Theta_S11_grad*pi/180
S11 = S11_r*(cos(Theta_S11_rad)+i*sin(Theta_S11_rad))
disp("")


Theta_S21_rad=Theta_S21_grad*pi/180
S21=S21_r*(cos(Theta_S21_rad)+i*sin(Theta_S21_rad))
disp("")


Theta_S12_rad=Theta_S12_grad*pi/180
S12=S12_r*(cos(Theta_S12_rad)+i*sin(Theta_S12_rad))
disp("")



Theta_S22_rad=Theta_S22_grad*pi/180
S22=S22_r*(cos(Theta_S22_rad)+i*sin(Theta_S22_rad))



%Stability check
disp('Stability check')
Delta = S11*S22-S12*S21
K_Stab=(1-abs(S11)^2-abs(S22)^2+abs(Delta)^2)/(2*abs(S12*S21))
Abs_Delta = abs(Delta)
if(K_Stab>1 & Abs_Delta<1)
 disp("Stability OK")
else
 disp("Stability not OK")
end

[cL,rL] = sgcirc(S,'l');
[cG,rG] = sgcirc(S,'s'); % stability circles
%[c,r] = sgcirc(S,type)
smith;
smithcir(cL, rL, 1.1, 1.5);
smithcir(cG, rG, 1.1, 1.5);
disp("")

%Maximum gain calculations
disp("Maximum gain calculations")
B1=1+abs(S11)^2-abs(S22)^2 -abs(Delta)^2
B2=1+abs(S22)^2-abs(S11)^2 -abs(Delta)^2
C1=S11 - Delta*conj(S22)
C2=S22 - Delta*conj(S11)
disp("")
[K,mu,D,B1,B2,C1,C2,D1,D2] = sparam(S)
disp("")


Gamma_S_plus  = (B1 + sqrt(B1^2 -4*abs(C1)^2) )/(2*C1);
Gamma_S_minus = (B1 - sqrt(B1^2 -4*abs(C1)^2) )/(2*C1);
if(abs(Gamma_S_plus)<1)
  Gamma_MS=Gamma_S_plus
  disp("Returned Gamma_S_plus")
else
  Gamma_MS=Gamma_S_minus
  disp("Returned Gamma_S_minus")
endif

Gamma_L_plus  = (B2 + sqrt(B2^2 -4*abs(C2)^2) )/(2*C2);
Gamma_L_minus = (B2 - sqrt(B2^2 -4*abs(C2)^2) )/(2*C2);
if(abs(Gamma_L_plus)<1)
  Gamma_ML=Gamma_L_plus
  disp("Returned Gamma_L_plus")
else
  Gamma_ML=Gamma_L_minus
  disp("Returned Gamma_L_minus")
endif


%%Absolute values of Gammas must be less than 1 but are not
disp("Absolute values of Gammas must be less than 1")



AbsGamma_MS=abs(Gamma_MS)
[THETA, R] = cart2pol (real(Gamma_MS), imag(Gamma_MS));
Theta_deg = THETA*180/pi

AbsGamma_ML=abs(Gamma_ML)
[THETA, R] = cart2pol (real(Gamma_ML), imag(Gamma_ML));
Theta_deg = THETA*180/pi
disp("")

disp("Gammas according to Matlab toolbox")
[Gamma_S_Match , Gamma_L_Match ]= smatch(S)
disp("")

%Gamma to impedances. Realpart cannot be negative
disp("Gamma to impedances. Real part cannot be negative!")
z_S =(1+Gamma_MS)/(1-Gamma_MS)
z_L=(1+Gamma_ML)/(1-Gamma_ML)
disp("Impedances from Matlab")
z_S_matlab=g2z(Gamma_MS,50)/50
z_L_matlab=g2z(Gamma_ML,50)/50
disp("Conjugated impedances are the transformation goals on Smith chart")
z_S_conj=conj(z_S)
z_L_conj=conj(z_L)



%S21 gain
disp("S21 gain")
G_0=abs(S21)^2
G_0_dB=10*log10(G_0)
disp("")

%Gains of matching networks
disp("Gains of matching networks")
G_S=1/(1-AbsGamma_MS^2)
G_S_dB=10*log10(G_S)
disp("")
G_L=(1-AbsGamma_ML^2)/(abs(1-S22*Gamma_ML)^2)
G_L_dB=10*log10(G_L)
Total_Gain = G_S_dB+G_0_dB+G_L_dB
disp("")
disp("Gains from toolbox")
Z0 = 50;
ZG = 50;
ZL = 50j;
% normalization impedance
gG = z2g(ZG,Z0);
gL = z2g(ZL,Z0);
gG=Gamma_MS
gL=Gamma_ML

disp("Gamma in")
Gin = gin(S,gL)
disp("Gamma out")
Gout = gout(S,gG)%
disp("transducer power gain at given Γ G , Γ L")
Gt = sgain(S,gG,gL)
disp("available power gain at given Γ G with Γ L = Γ ∗out")
Ga = sgain(S,gG,'a')
disp("operating power gain at given Γ L with Γ G = Γ ∗in")
Gp = sgain(S,gL,'p') % G T = 4 . 71, or, 6.73 dB
disp("maximum unilateral gain")
Gu = sgain(S,'u')
disp("maximum available gain (MAG)")
Gmag = sgain(S)
disp("maximum stable gain (MSG)")
Gmsg = sgain(S,'msg')

disp("Stubs")
dl_in = stub1 (conj(z_S) ,'po')
dl_out = stub1 (conj(z_L) ,'po')

disp("Microstrips")
lambda=1000*3E8/2.4E9
d=1.6E-3
epsilon_r = 4.4
losstangent = 0.0018
copper_thickness = 34E-6
u=mstripr(epsilon_r,50)
e_eff= mstripa(epsilon_r,u)
lambda_eff=lambda/sqrt(e_eff)
Width = u*d


