% butte ÂË²¨Æ÷Éè¼Æ³¢ÊÔ
fs = 10000;
fmax = fs/2;
wpass = 1500;
wstop = 1700;
Wp = wpass/fmax;
Ws = wstop/fmax;
[n,Wn] = buttord(Wp,Ws,3,60);
[b,a] = butter(n,Wn);
freqz(b,a);
