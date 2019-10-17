% 高斯白噪声对DSSS系统产生的影响
clear
fd = 10;
fc = 1000;
fs = 10000;
k = 1;
err = [];
for snr = 0:1:20
    EB_N = 10^(snr/10);
    data = bingen(5000);
    C = mseq(9);
    data1 = ds_mod(C,data);
    [t,Y] = BPSKmod(data1,fd*length(C),fc,fs);
    
%     [f,p] = T2F(Y,fs);
%     plot(f,abs(p));
%    Y1 = awgn(Y,EB_N);
%     [f,p] = T2F(Y,fs);
    I = sqrt(EB_N)*cos(2*pi*1010*t);
    Y1 = Y + I;
     
    Z = BPSKdemod(Y1,fs,fc,fd*length(C));
    Z1 = ds_demod(C,Z);
    err(k) = SER(data,Z1);
    k = k + 1;
end;
snr = 0:1:20;
plot(snr,err)
[f,p] = T2F(Y1,fs);
hold on 
