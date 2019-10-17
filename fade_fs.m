%生成频率选择性瑞利衰落信道
%***********************************************************
%        This mfunction generates frequency selective 
%        Rayleigh fading
%
%        FUNCTION SYNOPSIS: 
%        y = fade_fs(x,L)
% 
%        Parameter Description: 
%			y			  :   output signal
%        x          :   input signal  
%        L			  :   number of independent Rayleigh 
%								fading process 
%**********************************************************
function y = fade_fs(x,L)
%  Generate bivariate Gaussian uncorrelated 
%  random variables
tmp1 = 0:1:(L-1);
tmp1 = exp(-tmp1);
tmp(1:2:2*L-1) = tmp1;
tmp(2:2:2*L) = tmp1;

mu = zeros(1,2*L);
C = 0.5*diag(tmp);
x_len = length(x);
r = mvnrnd(mu,C,x_len);
%  Convert to polar coordinates and compute magnitude
x = x(:);
y = zeros(x_len,1);
for i = 1:L,
   z = r(:,2*i-1) + j*r(:,2*i);
   env = abs(z); %phi = angle(z);
   tmp_y = env.*x;
   tmp_y = [zeros(i-1,1); tmp_y(1:x_len-i+1)];
   y = y + tmp_y;
end
