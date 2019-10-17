function [fb_output] = fbconnection(n)
%FBCONNECTION 生成GF(2^m)的原始多项式
    fb_dec=primpoly(n);%生成十进制表示的系数
    fb_bin=dec2bin(fb_dec);%转换为二进制
    fb_output=fb_bin-'0';%将字符串转换为数组
end
