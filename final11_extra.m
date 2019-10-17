%**********************************************************************
%        This program computes the average BER of a DS-SS/BPSK 
%			communication system with binary BCH code in the AWGN channel
%
%			final11_extra.m
% 
%**********************************************************************

%function Plot_Pe = final11_extra()

clear all;
%close all;

format long;
%set up the threshold Vt 
Vt = 0;

Plot_Pe = [];

N = 16;
x_num = 2500;
plot_EbNo = -20:2:10;
for EbNo = -20:2:10,
   
%convert back from dB
Eb_No = EbNo; %dB
Eb_No = 10.^(Eb_No/10);
%assume No = 2;
No = 2;
Eb = No * Eb_No;
%calculate power p
Tc = 1;
Ts = N * Tc;
p = Eb / Ts;

%generate BPSK symbols randomly with value +1 or -1
x = bingen(x_num);
x_org = x;

%adds error-correcting code
enc_N = 15; enc_K = 11;  
x(find(x < 0)) = 0;
x = encode(x,enc_N,enc_K,'hamming');
x = x';
x(find(x == 0)) = -1;

%DS-SS modulate symbols with user code
c = bingen(N);
y = ds_mod(c(:),x');

%scale by appropriate power factor
y = sqrt(p)*y;

%add AWGN to signal
y = awgn(y,1);

%DS-SS demodulate symbols with user code
x_de = ds_demod(c(:),y);

%decision
x_de(find(x_de < 0)) = -1;
x_de(find(x_de >=0)) =  1;

%decode error-correcting code
x_de(find(x_de < 0)) = 0;
x_de = decode(x_de,enc_N,enc_K,'hamming');
x_de = x_de';
x_de(find(x_de == 0)) = -1;

%-------------------------------------
Pe = length(find(x_org - x_de))/x_num;
Plot_Pe = [Plot_Pe Pe];
end %end for EbNo

%---------------------------------------------
%return;
%---------------------------------------------

%display the calculated Pd and Pfa
Plot_Pe

%plot Pe versus Eb/No
semilogy(plot_EbNo,Plot_Pe,'bo-')
xlabel('Eb/No (dB)')
ylabel('BER')
s=sprintf('BER versus Eb/No with binary BCH code in the AWGN channel');
title(s);
