clear;                  % 清空内存中所有变量
clc;                    % 清空命令窗口中的内容
l = 2;                  % 设置AB长度为2
ro = 1e-9;              % 设置线电荷密度
k=9e9;                   % 设置静电力衡量
n= 100;
pn = 100;
dq = ro * l / n;       % 将线电荷分成20份（视为20个点电荷）
xa = -1;                % 设置A点横坐标
xb = 1;                 % 设置B点横坐标

xm = 4;                   % 设置场域中x方向的范围
ym = 4;                   % 设置场域中y方向的范围
x = linspace(-xm,xm,pn);    % 将x轴等分60等份
y = linspace(-ym,ym,pn);    % 将y轴等分成60等份
[X,Y] = meshgrid(x,y);      % 形成场域中各点的坐标
qx = linspace(xa,xb,n);   % 形成点电荷的横坐标
V = zeros(n,pn,pn);        % 让场域各点由不同点电荷产生的电场存在V中
i = 1;
for s = qx
    r = sqrt((X-s).^2+Y.^2); % 计算场域各点到点电荷距离
    V(i,:,:) = k * dq ./ r;
    i = i +1;
end;
V = sum(V);
for s = 1:pn
    for ss = 1:pn
        T(s,ss) = V(1,s,ss);
    end
end
V = T;
figure(1);
mesh(X,Y,V);
hold('on');
xlabel('x');
ylabel('y')
