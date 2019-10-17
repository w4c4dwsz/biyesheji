Fs = 150;            % Sampling frequency
T = 1/Fs;             % Sampling period
L = 200;             % Length of signal
t = (0:L-1)*T;        % Time vector
y = sin(2*pi*50*t);
[f,p] = T2F(y,Fs);
[y1,fs] = F2T(f,p);
t2 = (0:L-1)/Fs;
subplot(211)
plot(t2,y1);
subplot(212)
plot(t,y);