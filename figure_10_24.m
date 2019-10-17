clear
N = 20;
v = 0.1;
Ts = 10^(-5);
fs = 1/Ts;
i = 1;
jnr = 10^(1);
for k = 0:0.1:15
    
    fd = k*fs;
%     a = Ts* sinc(fd*Ts/N)^2*(1+sinc(2*fd*Ts)/sinc(2*fd*Ts/N));
%     pe(i) = 0.5 * erfc(sqrt(1/(1/v+a/(jnr*N))));
    pe(i) = qfunc(1/(sqrt(1/(2*N*v)+jnr/(2*N)*(sinc(fd*Ts/(2*N))^2)*(1 + sinc(fd*Ts)/sinc(fd*Ts/N)))));
    i = i + 1;
end

N = 100;
i = 1;
for k = 0:0.1:15
    fd = k*fs;
%     a = Ts* sinc(fd*Ts/N)^2*(1+sinc(2*fd*Ts)/sinc(2*fd*Ts/N));
%     pe2(i) = 0.5 * erfc(sqrt(1/(1/v+a/(jnr*N))));
    pe2(i) = qfunc(1/(sqrt(1/(2*N*v)+jnr/(2*N)*(sinc(fd*Ts/(2*N))^2)*(1 + sinc(fd*Ts)/sinc(fd*Ts/N)))));
    i = i + 1;
end
subplot(121)
i = 0:0.1:15;
plot(i,pe)
subplot(122)
plot(i,pe2);

