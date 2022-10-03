f=1.8E+9
c=3E+8
lambda= c/f;
ko=2*pi/lambda
epsilon_r=4.4
Z0=50
d=1.6E-3

loss_tangent=0.0018


A=(Z0/60)*sqrt((epsilon_r +1)/2)+((epsilon_r-1)/(epsilon_r+1))*(0.23+0.11/epsilon_r)
B=(377*pi)/(2*Z0*sqrt(epsilon_r))

%For a given impedance Z0 and dielectric constant epsilon_r
%W/d-ratio can be found a
W2d_ratio1 =(8*exp(A))/(exp(2*A)-2)
W2d_ratio2 =(2/pi)*(B-1-log(2*B-1)+((epsilon_r-1)/(2*epsilon_r))*(log(B-1)+0.39-(0.61/epsilon_r)))
if(W2d_ratio1 <2)
 W2d_ratio = W2d_ratio1
 disp("Returned the first ratio")
elseif(W2d_ratio2 >2)
 W2d_ratio = W2d_ratio1
 disp("Returned the second ratio")
end

epsilon_eff = ((epsilon_r+1)/2)+((epsilon_r-1)/2)*(1/(sqrt(1+12*1/( W2d_ratio))))

attenuation_dielectric =(ko*epsilon_r*(epsilon_eff-1)*loss_tangent)/(2*sqrt(epsilon_eff)*(epsilon_r-1))

Width =  W2d_ratio*d


