fd = 10;
fc = 100;
fs = 1000;
k = 1;
for snr = 0:0.1:20
    EB_N = 10^(snr/10);
    data = bingen(1000);
    [t,Y] = newBPSKmod(data,fd,fc,fs);
    Y=awgn(Y,EB_N);
    Z = BPSKdemod(Y,fs,fc,fd);
    err(k) = SER(data,Z);
    k = k + 1;
end

 snr = 0:0.1:20;
 plot(snr,err)