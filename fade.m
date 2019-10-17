%  生成瑞利衰落的包络和相位
%***********************************************************
%        Parameter Description: 
%        L          :   number of samples needed  
%        variance   :   variance 
%**********************************************************
function [env,phi] = fade(L,variance)

if variance <= 0
   error('需要正方差')
elseif nargin ~= 2
   error('输入参数不足')
end
%  生成二元高斯不相关数据
%  random variables
mu = zeros(1,2);
C = variance*eye(2,2);  %生成I*variance
r = mvnrnd(mu,C,L);     %生成正态数据
%  转换到极坐标和计算大小和
z = r(:,1) + j*r(:,2);
env = abs(z); phi = angle(z);
end
