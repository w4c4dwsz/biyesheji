function [f,P1] = T2F(X,Fs)
%���fƵ���ᣬP1DFT�任������ ����XΪ�ɼ����У�FsΪ����Ƶ��
%[f,P1] = T2F(X,Fs) �����Ƶ��Ϊ����������������׼ǵý�һ������
    L = length(X);
    P2 = fft(X);
    P1 = fftshift(P2);
    f = (-L/2:L/2-1)*Fs/L;
end
