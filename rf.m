l=0.020
c = 3E+8
f=2E+9
lambda = c/f
beta=2*pi/lambda
R0=50;
ZL=25;

Zi=R0*((ZL+i*R0*tan(beta*l))...
   /(R0+i*ZL*tan(beta*l)))

zi=Zi/R0

Gamma_i = (zi-1)/(zi+1)

[THETA, R] = cart2pol...
  (real(Gamma_i), imag(Gamma_i))

THETA_GRAD=THETA*180/pi

zL=ZL/R0

Gamma_L = (zL-1)/(zL+1)
Gamma_i2 = Gamma_L*exp(-i*2*beta*l)

