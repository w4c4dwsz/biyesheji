function [seq]=mseq(n)
% �˺�����������m���� ���������еĸ���Ϊ2^n-1
% coefΪ����ϵ������
% Author: FastestSnail
% Date: 2017-10-03
%***************************************************
coef = fbconnection(n);     %���ɶ���ʽ�������ֶ����ģ�
coef(1)=[];%ȥ����һ��Ԫ��
m=length(coef);
len=2^m-1; % �õ��������ɵ�m���еĳ���     
backQ=0; % ��Ӧ�Ĵ���������ֵ�����ڵ�һ���Ĵ���
seq=zeros(1,len); % �����ɵ�m����Ԥ����
registers = [1 zeros(1, m-2) 1]; % ���Ĵ��������ʼ���
% coef(1)=[];%ȥ����һ��Ԫ��
for i=1:len
    seq(i)=registers(m);
    backQ = mod(sum(coef.*registers) , 2); %�ض��Ĵ�����ֵ����������㣬����Ӻ�ģ2
    registers(2:length(registers)) = registers(1:length(registers)-1); % ��λ
    registers(1)=backQ; % ������ֵ���ڵ�һ���Ĵ�����λ��
end
end