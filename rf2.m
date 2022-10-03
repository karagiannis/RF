l=0.020
c = 3E+8
f_start=0.1E+9;
f_stop=3.0E+9;
n_steps = 150;
step_size=(f_stop-f_start)/n_steps;
f=f_start:step_size:f_stop
GammaIn =zeros(size(f));
GammaIn2 =zeros(size(f));

R0=50;
ZL=25;

for i=1:n_steps+1
      lambda = c/f(i)
      beta=2*pi/lambda


      Zi=R0*((ZL+i*R0*tan(beta*l))...
         /(R0+i*ZL*tan(beta*l)))

      zi=Zi/R0

      Gamma_i = (zi-1)/(zi+1);
      GammaIn(i)=Gamma_i;

      [THETA, R] = cart2pol...
        (real(Gamma_i), imag(Gamma_i));

      THETA_GRAD=THETA*180/pi

      zL=ZL/R0

      Gamma_L = (zL-1)/(zL+1)
      Gamma_i2 = Gamma_L*exp(-i*2*beta*l)
      GammaIn2(i)=Gamma_i2;
endfor

RL = -20*log10(abs(GammaIn));
RL2 =-20*log10(abs(GammaIn2));

ML = -10*log10(1-abs(GammaIn).^2);
figure(1)
plot(f,RL,";Return Loss;");
%plot(f,RL2);

figure(2)
plot(f, ML, ";Mismatch Loss;")


