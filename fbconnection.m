function [fb_output] = fbconnection(n)
%FBCONNECTION ����GF(2^m)��ԭʼ����ʽ
    fb_dec=primpoly(n);%����ʮ���Ʊ�ʾ��ϵ��
    fb_bin=dec2bin(fb_dec);%ת��Ϊ������
    fb_output=fb_bin-'0';%���ַ���ת��Ϊ����
end
