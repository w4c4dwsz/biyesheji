function [f,P1] = T2F(X,Fs)
%输出f频率轴，P1DFT变换后序列 输入X为采集序列，Fs为采样频率
%[f,P1] = T2F(X,Fs) 输出的频谱为复数，如果画功率谱记得进一步运算
    L = length(X);
    P2 = fft(X);
    P1 = fftshift(P2);
    f = (-L/2:L/2-1)*Fs/L;
end
