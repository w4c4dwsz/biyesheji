function s_con=mod2add(n,s_signal,k)
%函数实现PN码与信息码的模二和；返回值的长度为信息码长度的k倍
%n为产生m序列反馈移存器的级数
%s_signal为输入信号
%k为PN码速率相对信息码元速率的倍数
fb_con=fbconnection(n);
s_mseq=mseq(fb_con);
N_signal=length(s_signal);
N_con=k*N_signal;
s_con=zeros(1,N_con);
for i=1:N_signal
        s_con((i-1)*k+1:i*k)=s_signal(i);
end
N_mseq=length(s_mseq);
num_mseq=ceil(N_con/N_mseq);
mseq_need=repmat(s_mseq,1,num_mseq);
mseq_need=mseq_need(1:N_con);
s_con=mod(mseq_need+s_con,2);
end