function s_con=mod2add(n,s_signal,k)
%����ʵ��PN������Ϣ���ģ���ͣ�����ֵ�ĳ���Ϊ��Ϣ�볤�ȵ�k��
%nΪ����m���з����ƴ����ļ���
%s_signalΪ�����ź�
%kΪPN�����������Ϣ��Ԫ���ʵı���
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