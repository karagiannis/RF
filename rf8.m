clear all
% addpath("/home/lasse/Documents/test M4/ewa")
i=sqrt(-1);




disp("Sofokles example noise figure")
S11_r = 0.61
Theta_S11_grad=165
S21_r=3.72
Theta_S21_grad=59
S12_r=0.05
Theta_S12_grad= 42
S22_r=0.45
Theta_S22_grad= -48

disp("")
S=smat([0.61, 165, 3.72, 59, 0.05, 42, 0.45, -48 ])
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

disp("")


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


%%Absolute values of Gammas must be less than 1
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
G_S=1/(1-abs(Gamma_MS)^2)
G_S_dB=10*log10(G_S)
disp("")
G_L=(1-abs(Gamma_ML)^2)/(abs(1-S22*Gamma_ML)^2)
G_L_dB=10*log10(G_L)
disp("Gt gain")
Total_Gain = G_0*G_S*G_L
Total_Gain_dB = G_S_dB+G_0_dB+G_L_dB
disp("")
Gamma_L_unmatched =0;
G_power=(1/(1-abs(Gamma_MS)^2))*abs(S21)^2*((1-abs(Gamma_L_unmatched)^2)/(abs(1-S22*Gamma_L_unmatched)^2))
G_power_dB=10*log10(G_power)
Gamma_G_unmatched=0
G_availible=((1-abs(Gamma_G_unmatched)^2)/(abs(1-S11*Gamma_G_unmatched)^2))*(abs(S21)^2)*(1/(1-abs(Gamma_ML)^2))
G_availible_dB=10*log10(G_availible)



disp("Gains from toolbox")
Z0 = 50;
ZG = 50;
ZL = 50;
% normalization impedance
gG_no_matching_network = z2g(ZG,Z0);
gL_no_matching_network = z2g(ZL,Z0);
gG=Gamma_MS
gL=Gamma_ML

disp("Gamma in")
Gin = gin(S,gL)
disp("Gamma out")
Gout = gout(S,gG)%
disp("transducer power gain at given Γ G , Γ L")
Gt = sgain(S,gG,gL)
Gt_dB=10*log10(Gt)
disp("available power gain at given Γ G with Γ L = Γ ∗out")
Ga = sgain(S,gG_no_matching_network,'a')
Ga_dB=10*log10(Ga)
disp("operating power gain at given Γ L with Γ G = Γ ∗in")
Gp = sgain(S,gL_no_matching_network,'p')
Gp_dB=10*log10(Gp)
disp("maximum unilateral gain")
Gu = sgain(S,'u')
Gu_dB=10*log10(Gu)
disp("maximum available gain (MAG)")
Gmag = sgain(S)
Gmag_dB=10*log10(Gmag)
disp("maximum stable gain (MSG)")
Gmsg = sgain(S,'msg')
Gmsg_dB=10*log10(Gmsg)
%
%disp("Stubs")
%dl_in = stub1 (conj(z_S) ,'po')
%dl_out = stub1 (conj(z_L) ,'po')
%
%
%
%disp("Specific gain 13 dB")
%U=(abs(S12)*abs(S21)*abs(S11)*abs(S22))/((1-abs(S11)^2)*(1-abs(S22)^2))
%Gs_Max=1/(1-abs(S11)^2);
%Gs_Max_dB= 10*log10(Gs_Max)
%Gl_Max = 1/(1-abs(S22)^2);
%Gl_Max_dB=10*log10(Gl_Max)
%G0=abs(S21)^2;
%G0_dB=10*log(G0)
%GTU_Max = Gs_Max_dB+Gl_Max_dB+G0_dB
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%disp("Operating power gain circles")
%[c1,r1]=sgcirc(S,'p',9)% c 1 = 0 . 4443 ∠ 52 . 56 o , r 1 = 0 . 5212
%[c2,r2]=sgcirc(S,'p',10)% c 2 = 0 . 5297 ∠ 52 . 56 o , r 2 = 0 . 4205
%[c3,r3]=sgcirc(S,'p',11.18)% c 3 = 0 . 6253 ∠ 52 . 56 o , r 3 = 0 . 2968
%[cL,rL]=sgcirc(S,'l') % c L = 2 . 0600 ∠ 52 . 56 o , r L = 0 . 9753
%smith; smithcir(cL,rL,1.7);
%% display portion of circle with |Γ L | ≤ 1 . 7
%smithcir(c1,r1);
%plot(c1,'*')
%smithcir(c2,r2);
%plot(c2,'*')
%smithcir(c3,r3);
%plot(c3,'*')
%phi = linspace(0,2*pi,361);
%gammaL = c3 + r3 * exp(j*phi);% points on 15-dB operating gain circle
%gammaG = conj(gin(S,gammaL));% circle of conjugate matched source points
%plot(gammaG);
%
%
%gL_spec = c3 - abs(r3)*exp(j*angle(c3))%GammaL closesed to the origin
%[THETA, R] = cart2pol (real(gL_spec), imag(gL_spec));
%mag_gL_spec=R
%deg_gL_spec=THETA*180/pi
%plot(gL_spec,'o')%Plot Closest Gamma_L point
%gG_match = conj(gin(S,gL_spec))%Looking into Generator should be conjugate of Gamma_in
%plot(gG_match,'x')%Plot on GammaG circle
%zL = g2z(gL_spec)
%zG = g2z(gG_match)
%dl_IN = stub1(conj(zG), 'po' )
%dl_OUT = stub1(conj(zL), 'po' )
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%disp("Availible power gain circles")
%figure
%[c1,r1]=sgcirc(S,'a',11) % c 1 = 0 . 5384 ∠ − 162 . 67 o , r 1 = 0 . 4373
%[c2,r2]=sgcirc(S,'a',12) % c 2 = 0 . 6227 ∠ − 162 . 67 o , r 2 = 0 . 3422
%[c3,r3]=sgcirc(S,'a',13.2) % c 3 = 0 . 7111 ∠ − 162 . 67 o , r 3 = 0 . 2337
%[cG,rG]=sgcirc(S,'s') % c G = 1 . 5748 ∠ − 162 . 67 o , r G = 0 . 5162
%smith; smithcir(cG,rG,1.7);
%% plot entire source stability circle
%smithcir(c1,r1);
%plot(c1,'*')
%smithcir(c2,r2);
%plot(c2,'*')
%smithcir(c3,r3);
%plot(c3,'*');
%phi = linspace(0,2*pi,361);
%gammaG = c3 + abs(r3) * exp(j*phi);% points on 15-dB available gain circle
%gammaL = conj(gout(S,gammaG));% circle of conjugate matched loads
%plot(gammaL);
%gG_spec = c3 - abs(r3)*exp(j*angle(c3))%GammaG closesed to the origin
%plot(gG_spec,'o')%Plot Closest Gamma_L point
%gL_match = conj(gout(S,gG_spec))%Looking into Load should be conjugate of Gamma_out
%plot(gL_match,'x')%Plot on GammaL circle
%zL = g2z(gL_match)
%zG = g2z(gG_spec)
%dl_IN = stub1(conj(zG), 'po' )
%dl_OUT = stub1(conj(zL), 'po' )
%
%disp("Microstrips")
%lambda_mm=1000*3E8/1.8E9
%d=1.6E-3
%epsilon_r = 4.4
%losstangent = 0.0018
%copper_thickness = 34E-6
%u=mstripr(epsilon_r,50)
%e_eff= mstripa(epsilon_r,u)
%lambda_eff_mm =lambda_mm/sqrt(e_eff)
%Width = u*d
%stub_in_mm=dl_IN(2,1)*lambda_eff_mm
%stub_series_in_mm=dl_IN(2,2)*lambda_eff_mm
%stub_out_mm = dl_OUT(2,1)*lambda_eff_mm
%stub_series_out_mm = dl_OUT(2,2)*lambda_eff_mm

%Noise figure
disp("Noise figure calculations")
Fmin = 1.6; rn = 0.16; gGopt = p2c(0.26, 172);
%2000       1.90     .242    134.0       .160

Gmag = db(sgain(S,'mag'))% maximum available gain
Gaopt = db(sgain(S,gGopt,'a'))% available gain at Γ G opt
gLopt = conj(gout(S,gGopt))  % matched load
[c0,r0]=nfcirc(1.6,Fmin,rn,gGopt);
[c1,r1]=nfcirc(1.7,Fmin,rn,gGopt);
[c2,r2]=nfcirc(1.8,Fmin,rn,gGopt);
[c3,r3]=nfcirc(1.9,Fmin,rn,gGopt);
[c4,r4]=nfcirc(2.0,Fmin,rn,gGopt);
figure;
smith;
plot([gGopt, gLopt],'x');
smithcir(c0,r0);
plot(c0,'*')
smithcir(c1,r1);
plot(c1,'*')
smithcir(c2,r2);
plot(c2,'*')
smithcir(c3,r3);
plot(c3,'*')
smithcir(c4,r4);
plot(c4,'*')
%Simultaneous conjugate match
gG = smatch(S)
plot(gG,'x')
F = nfig(Fmin, rn, gGopt, gG)
phi = linspace(0,2*pi,721);
gG = c2 + r2*exp(j*phi);% Γ G around the c 2 , r 2 circle
G = db(sgain(S,gG,'a'));% available gain in dB
[Ga,i] = max(G) % maximum available gain
%find an index in array of a specific gain
index=1;
sizeG = 721
for(i=1:1:sizeG)
G(i)
 if (G(i)>13.2 ) && (G(i)<13.3)
   index=i
   G(i)
   disp("found index")
   break;
 endif
end
%gammaG = gG(i) % Γ G for maximum gain
gammaG = gG(index) % Γ G for specific gain
gammaL = conj(gout(S,gammaG))
[ca,ra] = sgcirc(S,'a',Ga);% available gain circle
smithcir(c2,r2);
smithcir(ca,ra);
plot([gammaG,gammaL],'*');
figure
plot(phi*180/pi, G);
zG=(1+gammaG)/(1-gammaG)
zL=(1+gammaL)/(1-gammaL)
dl_IN_noiseFig = stub1 (conj(zG), 'po' )
dl_OUT_noiseFig = stub1 (conj(zL), 'po' )






