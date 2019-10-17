%生成两个信道的瑞丽衰落
%***********************************************************
%        This mfunction generates two channels of faded 
%        envelope and phase corresponding to
%        Rayleigh fading
%
%        FUNCTION SYNOPSIS: 
%        [env,phi] = fade_diversity(L,para)
% 
%        Parameter Description: 
%        L          :   number of samples needed  
%        variance   :   variance 
%**********************************************************
function [env1,env2] = fade_diversity(L,variance)
%  Error check
if variance <= 0
   error('Positive variance needed')
elseif nargin ~= 2
   error('Insufficient input parameters')
end
%  Generate bivariate Gaussian uncorrelated 
%  random variables
mu = zeros(1,4);
C = variance*eye(4,4);
r = mvnrnd(mu,C,L);
%  Convert to polar coordinates and compute 
%  magnitude and phase 
z1 = r(:,1) + j*r(:,2);
z2 = r(:,3) + j*r(:,4);
env1 = abs(z1); 
env2 = abs(z2);
