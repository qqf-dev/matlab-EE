function [V] = V_con(ro,X,Y)
%V_CON 此处显示有关此函数的摘要
%   此处显示详细说明
k = 9e9;
V = k * ro * log((1-X+sqrt((1-X).^2+Y.^2))./(-1-X+sqrt((-1-X).^2+Y.^2)));
end

