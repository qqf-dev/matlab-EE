clear;                  % clear memory
clc;                    % clear screen
ro = 1e-9;              % set charge density
k=9e9;                   % set
n= 20;                 % 拟合精度（将线电荷分成n份）
pn = 10;               % 横纵坐标精度（将横纵坐标分为pn份）
%假设线电荷在A，B两点之间
xa = -1;                % 设置A点横坐标
ya = 0;                 % 设置A点纵坐标
xb = 1;                 % 设置B点横坐标
yb = 0;                 % 设置B点纵坐标
%
xm = 4;                   % 设置场域中x方向的范围
ym = 4;                   % 设置场域中y方向的范围
x = linspace(-xm,xm,pn);    % 将x轴等分60等份
y = linspace(-ym,ym,pn);    % 将y轴等分成60等份
[X,Y] = meshgrid(x,y);      % 形成场域中各点的坐标

V1 = V_det(ro,xa,ya,xb,yb,X,Y,pn,n);
V2 = V_con(ro,X,Y);
dV = V1 - V2;


figure(31);
mesh(X,Y,V1,V1+100);
hold on;
mesh(X,Y,V2,V2-100);
hidden off;

xlabel('x');
ylabel('y')
hold off;

figure(34);
lm = 0;
for i = 1:pn
    if x(i) > -1.05 && x(i)<-0.95
        lm = i;
    end
end

plot(y,V1(:,lm),'b');
hold on;
plot(y,V2(:,lm),'r');

figure(35);
plot(y,dV(:,lm),'g');

figure(36);
ln = 0;
for i = 1:pn
    if y(i) > -1.05 && y(i)<-0.95
        ln = i;
    end
end

plot(x,V1(ln,:),'b');
hold on;
plot(x,V2(ln,:),'r');

figure(37);
plot(x,dV(ln,:),'g');


figure(32);
mesh(X,Y,dV);
hold on;
xlabel('x');
ylabel('y')
hold off;
