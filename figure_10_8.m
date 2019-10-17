clear
i = 1;
k = 1;
gp = 100;
for v = -20:5:-10
    vs = 10^(v/10);
    for x = -10:1:50
        xs = 10^(x/10);
        pe(i,k) = qfunc(sqrt(2*gp /( 1/vs + xs)));
        k = k + 1;
    end
    i = i + 1;
    k = 1;
end
% pe = 10*log10(pe);
x = -10:1:50;
plot(x,pe(1,:),x,pe(2,:),x,pe(3,:))
