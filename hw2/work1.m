clear;                  % 清空内存中所有变量
clc;                    % 清空命令窗口中的内容
l = 2;                  % 设置AB长度为2
ro = 1e-9;              % 设置线电荷密度
k=9e9;                   % 设置静电力衡量
n= 100;
pn = 100;
dq = ro * l / n;       % 将线电荷分成n份（视为n个点电荷）
xa = -1;                % 设置A点横坐标
xb = 1;                 % 设置B点横坐标
%
xm = 4;                   % 设置场域中x方向的范围
ym = 4;                   % 设置场域中y方向的范围
x = linspace(-xm,xm,pn);    % 将x轴等分60等份
y = linspace(-ym,ym,pn);    % 将y轴等分成60等份
[X,Y] = meshgrid(x,y);      % 形成场域中各点的坐标
V = V_con(ro,X,Y);
figure(1);
mesh(X,Y,V);
hold on;
xlabel('x');
ylabel('y')
hold off;
%
Vmin=0;                                                   % 设置等位线族的最小电位值
Vmax=60;                                                  % 设置等位线族的最大电位值
Veq=linspace(Vmin,Vmax,40);                                 % 设定20条等位线的电位值
figure(2);                                                  % 在图像窗口2绘图
contour(X,Y,V,Veq);                                         % 绘制20条等势线
grid on;                                                    % 形成网格
hold on;                                                    % 保持图形
title('真空中两个等量同性点电荷的等电位线(11910103 秦庆福)','fontsize',20);         % 绘制出图形标题
xlabel('X轴(单位：m)','fontsize',15);                         % 绘制出X轴标注
ylabel('Y轴(单位：m)','fontsize',15);                         % 绘制出Y轴标注
hold off; 
%
[Ex,Ey]=gradient(-V);                                       % 计算场域各点的电力强度的两个分量
del_theta=15;                                               % 设置相邻电力线间的角度差
theta=(0:del_theta:360).*pi/180;                            % 生成电力线的弧度值
xs1=1.1*cos(theta);                                   % 从q2生成电力线的x轴坐标
ys=sqrt(0.21)*sin(theta);                                        % q1,q2生成电力线的y轴坐标
figure(3);                                                  % 在图像窗口3绘图
streamline(X,Y,Ex,Ey,xs1,ys);                               % 生成q2产生的电力线
grid on;                                                    % 形成网格
hold on;                                                    % 保持图形
contour(X,Y,V,Veq);                                         % 绘制等势线
title('真空中两个等量同性点电荷的等电位线及电场线（用光滑连续曲线表示）(11910103 秦庆福)','fontsize',20);    % 绘制出图形标题
xlabel('X轴(单位：m)','fontsize',12);                         % 绘制出X轴标注
ylabel('Y轴(单位：m)','fontsize',12);                         % 绘制出注
hold off;    
%
E=sqrt(Ex.^2+Ey.^2);                                        % 计算各点的电场强度的幅值
Exs=Ex./E;
Eys=Ey./E;                                                  % 归一化电场强度
Xs=X(:,1:4:pn);                                             
Xs=Xs(1:4:pn,:);                                            % 分别缩减箭头横坐标点至21*21
Ys=Y(:,1:4:pn); 
Ys=Ys(1:4:pn,:);                                            % 分别缩减箭头纵坐标点至21*21
Exs=Exs(:,1:4:pn);
Exs=Exs(1:4:pn,:);                                          % 分别缩减对应坐标的电场强度的X分量的数量
Eys=Eys(:,1:4:pn);
Eys=Eys(1:4:pn,:);                                          % 分别缩减对应坐标的电场强度的Y分量的数量
figure(4);                                                  % 在图像窗口4绘图
quiver(Xs,Ys,Exs,Eys);                                      % 用归一化箭头表示场域各点电场强度的方向
hold on;                                                    % 保持图形
contour(X,Y,V,Veq);                                         % 绘制等势线
xlabel('X轴(单位：m)','fontsize',15);                         % 绘制出X轴标注
ylabel('Y轴(单位：m)','fontsize',15);                         % 绘制出Y轴标注
hold off; 