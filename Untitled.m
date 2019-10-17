% 论文代码主程序1
clear
clc
fd = 10;
fc = 1000;
fs = 10000;
data = bingen(1000);
C = mseq(5);
% data1 = ds_mod(C,data);
% [t,Y] = BPSKmod(data1,fd*length(C),fc,fs);
% Z = BPSKdemod(Y,fs,fc,fd*length(C));
% Z1 = ds_demod(C,Z);

data1 = ds_mod(C,data);

[t1,y1] = BPSKmod(data1,fd,0,fs);
[t2,y2] = BPSKmod(data1,fd*length(C),fc,fs);

figure(1)
subplot(121)
stem(data)
subplot(122)
stem(data1)

[f1, p1] = T2F(y1,fs);
[f2, p2] = T2F(y2,fs);

figure(2)
N1 = length(p1);
N2 = length(p2);
% subplot(121)
% plot(f1,abs(p1)/N1)
% subplot(122)
plot(f2,abs(p2)/N2)

figure(3)
plot(f2,abs(p2)/N2)

fi = 1200;
f2 = 1000;
J = 1;
I = sqrt(10^(J/10))/20*cos(2*pi*fi*t2);
% X = awgn(y2,1);
X = y2 + I;
[f3,p3] = T2F(y2,fs);
[f4,p4] = T2F(I,fs);
figure(4)
plot(f3,abs(p3)/N2,f4,abs(p4)/N2)
X1 = BPSKdemod(X,fs,fc,fd*length(C));
X2 = ds_demod(C,X1);
SER(X2,data)

figure(5)
[tdata,ydata] = BPSKmod(data,fd,0,fs);
[tdata1,ydata1] = BPSKmod(data1,fd*length(C),0,fs);
[fdata, pdata] = T2F(ydata,fs);
[fdata1, pdata1] = T2F(ydata1,fs);
N1 = length(pdata);
N2 = length(pdata1);
subplot(121)
plot(fdata,abs(pdata)/N1)
subplot(122)
plot(fdata1,abs(pdata1)/N2)

figure(6)
C2 = mseq(6);
data2 = ds_mod(C2,data);
[tdata2,ydata2] = BPSKmod(data2,fd*length(C2),0,fs);
[fdata2, pdata2] = T2F(ydata2,fs);
N3 = length(pdata2);
subplot(121)
plot(fdata2,abs(pdata2)/N3)
subplot(122)
plot(fdata2,abs(pdata2)/N3)

figure(7)
Y_noise = awgn(y2,2);
[fynoise,pynoise] = T2F(Y_noise-y2,fs);
[y_noise,p_noise] = T2F(Y_noise,fs);
subplot(121)
plot(fynoise,pynoise/length(pynoise))
subplot(122)
plot(y_noise,p_noise/length(p_noise))

% 单音干扰与信号波形图
figure(8)
plot(t2,y2,t2,I)

figure(9)
I_out_temp = BPSKdemod(I,fs,fc,fd*length(C));
I_out = ds_demod(C,I_out_temp);
[f_iout,p_iout] = T2F(I_out_temp,fs);
plot(f_iout,p_iout)