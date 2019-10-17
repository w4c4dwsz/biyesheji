function [f,P1] = DoubleT2F(X,Fs)
    L = length(X);
    Y = fft(X);
    P2 = abs(Y/L);
    P1(1:L/2) = P2(L/2+1:L); 
    P1(L/2+1:L+1) = P2(1:L/2+1);
    f = (-L/2:L/2)*Fs/L;
end