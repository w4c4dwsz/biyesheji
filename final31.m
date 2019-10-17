%*********************************************************************
%        This program computes the average BER versus Eb/No of K users
%			transmitting BPSK symbols at an equal power level using a 
%			DS-CDMA scheme assumming perfect synchronism and orthogonal
%			codes in AWGN
%        
%        AUTHOR: Wenbin Luo
%        DATE  : 04/29/01
%
%			final31.m
% 
%********************************************************************

clear all;
%close all;

format long;
%set up the threshold Vt 
Vt = 0;

Plot_Pe = [];

K = 16; 
N = 32;
x_num = 5000;
plot_EbNo = -20:3:10;
for EbNo = -20:3:10,
   
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

%DS-SS modulate symbols with user code
UserCode = hadamard(N);
c = UserCode(1,:);
y = ds_mod(c(:),x);

%add other users' signal as interference
for t = 2:1:K,
   tmp_x = bingen(x_num); 
   tmp   = UserCode(t,:);
   tmp_y = ds_mod(tmp(:),tmp_x);
   y = y + tmp_y;
end % t

%scale by appropriate power factor
y = sqrt(p)*y;

%add AWGN to signal
y = awgn(y,1);

%DS-SS demodulate symbols with user code
x_de = ds_demod(c(:),y);

%decision
x_de(find(x_de < 0)) = -1;
x_de(find(x_de >=0)) =  1;

Pe = length(find(x - x_de))/x_num;
Plot_Pe = [Plot_Pe Pe];
end %end for EbNo

%display the calculated Pd and Pfa
Plot_Pe

%plot Pe versus Eb/No
%subplot(2,1,1)
semilogy(plot_EbNo,Plot_Pe,'m*-')
xlabel('Eb/No (dB)')
ylabel('BER')
title('BER versus Eb/No using DS-CDMA: perfect synchronism between users');
grid on;
