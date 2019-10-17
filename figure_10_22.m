N = 100;
v = 0.1;
fd = 0;
Ts = 10^(-4);
i = 1;
for j =  -10:0.1:20
    jnr = 10^(j/10);
    pe(i) = qfunc(1/(sqrt(1/(2*N*v)+jnr/(2*N)*(sinc(fd*Ts/(2*N))^2)*(1 + (sinc(fd*Ts))/(sinc(fd*Ts/N))))));
    i = i + 1;
end
N = 10;
i = 1;
for j =  -10:0.1:20
    jnr = 10^(j/10);
    pe1(i) = qfunc(1/(sqrt(1/(2*N*v)+jnr/(2*N)*(sinc(fd*Ts/(2*N))^2)*(1 + (sinc(fd*Ts))/(sinc(fd*Ts/N))))));
    i = i + 1;
end
j =  -10:0.1:20;
plot (j,pe,j,pe1)