clear
fd = 50;
fc = 100;
fs = 51100;
data = bingen(1000);
C = mseq(9);
k = 1;
for snr = -20:2:15
    
    EB_N = 10^(snr/10);
    Y = ds_mod(C,data);
    Y=awgn(Y,EB_N);
%  out = DSSSdemod(Y,C,fs,fc,fd);
%     out = BPSKdemod(Y,fs,fc,fd);
out = ds_demod(C,Y);
outs(out>mean(out))=1;
outs(out<mean(out))=0;
    err(k) = SER(data,outs);
    k = k + 1;
end
 snr = -20:2:15;
 plot(snr,err)
