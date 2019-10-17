%  ��������˥��İ������λ
%***********************************************************
%        Parameter Description: 
%        L          :   number of samples needed  
%        variance   :   variance 
%**********************************************************
function [env,phi] = fade(L,variance)

if variance <= 0
   error('��Ҫ������')
elseif nargin ~= 2
   error('�����������')
end
%  ���ɶ�Ԫ��˹���������
%  random variables
mu = zeros(1,2);
C = variance*eye(2,2);  %����I*variance
r = mvnrnd(mu,C,L);     %������̬����
%  ת����������ͼ����С��
z = r(:,1) + j*r(:,2);
env = abs(z); phi = angle(z);
end
