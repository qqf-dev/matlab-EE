function [V] = V_det(ro,xa,ya,xb,yb,X,Y,pn,n)
%V_DET 此处显示有关此函数的摘要
%   此处显示详细说明
k=9e9;                   % 设置静电力衡量
l = sqrt((xa-xb).^2+(ya-yb).^2);

dq = ro * l / n;
qx = linspace(xa,xb,n);   % 形成点电荷的横坐标
qy = linspace(ya,yb,n);   % 形成点电荷的纵坐标


V = zeros(n,pn,pn);        % 让场域各点由不同点电荷产生的电场存在V中

i = 1;
for s = qx
    ss = qy(i);
    r = sqrt((X-s).^2+((Y-ss).^2)); % 计算场域各点到点电荷距离
    V(i,:,:) = k * dq ./ r;
    i = i +1;
end

V = sum(V);
V = reshape(V,pn,pn);
end

