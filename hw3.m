% 初始化
clear;                                                      % 清空内存中所有变量
clc;                                                        % 清空命令窗口中的内容
k=9e9;                                                      % 设置静电力衡量
Q1=8e-9;                                                    % 设置点电荷q1的电量
Q2=8e-9;                                                    % 设置点电荷q2的电量
Q3=8e-9;                                                    % 设置点电荷q3的电量
% 绘制场域内各点电位分布
xm=8;                                                    % 设置场域中x方向的范围
ym=8;                                                    % 设置场域中y方向的范围
x=linspace(-xm,xm,60);                                      % 将x轴等分60等份
y=linspace(-ym,ym,60);                                      % 将y轴等分成60等份
[X,Y]=meshgrid(x,y);                                        % 形成场域中各点的坐标
R1=sqrt((X+sqrt(3)).^2+(Y+1).^2);                           % 计算场域中各点到点电荷q1的距离（到点p1（-sqrt(3)，-1）的距离）
R2=sqrt((X-sqrt(3)).^2+(Y+1).^2);                           % 计算场域中各点到点电荷q2的距离（到点p2（sqrt(3)，-1）的距离）
R3=sqrt(X.^2+(Y-2).^2);                           % 计算场域中各点到点电荷q3的距离（到点p2（0，2）的距离）
V1=k*Q1./R1;                                                % 计算场域中各点因点电荷q1产生的电位
V2=k*Q2./R2;                                                % 计算场域中各点因点电荷q2产生的电位
V3=k*Q3./R3;                                                % 计算场域中各点因点电荷q3产生的电位
V=V1+V2+V3;                                                    % 将由q1,q2和q3产生的电位叠加
figure(1);                                                  % 在图像窗口1绘图
mesh(X,Y,V);                                                % 绘制出电位的分布图
hold on;                                                    % 保持图形                                                 
title('真空中三个等量同性点电荷的电场线','fontsize',20);      % 绘制出图形标题
xlabel('X轴(单位：m)','fontsize',15);                       % 绘制出X轴标注
ylabel('Y轴(单位：m)','fontsize',15);                       % 绘制出Y轴标注
hold off;                                                   % 取消保持
% 绘制场域内等电位线分布
Vmin=30;                                                   % 设置等位线族的最小电位值
Vmax=300;                                                  % 设置等位线族的最大电位值
Veq=linspace(Vmin,Vmax,20);                                 % 设定20条等位线的电位值
figure(2);                                                  % 在图像2窗口绘图
contour(X,Y,V,Veq);                                         % 绘制20条等势线
contour(X,Y,V,Veq);                                         % 绘制20条等势线
grid on;                                                    % 形成网格
hold on;                                                    % 保持图形
title('真空中三个等量同性点电荷的等电位线','fontsize',20);    % 绘制出图形标题
xlabel('X轴(单位：m)','fontsize',15);                       % 绘制出X轴标注
ylabel('Y轴(单位：m)','fontsize',15);                       % 绘制出Y轴标注
hold off;                                                   % 取消保持
% 绘制场域内的等电位线及电场线（用光滑连续曲线表示）的分布
[Ex,Ey]=gradient(-V);                                    % 计算场域各点的电力强度的两个分量
del_theta=30;                                               % 设置相邻电力线间的角度差
theta=(0:del_theta:360).*pi/180;                            % 生成电力线的弧度值
xs1=0.5*cos(theta)-sqrt(3);                                  % 从q1生成电力线的x轴坐标
xs2=0.5*cos(theta)+sqrt(3);                                  % 从q2生成电力线的x轴坐标
xs3=0.5*cos(theta);                                         % 从q3生成电力线的x轴坐标
ysd=0.5*sin(theta)-1;                                        % q1,q2生成电力线的y轴坐标
ysp=0.5*sin(theta)+2;                                        % q3生成电力线的y轴坐标
figure(3);                                                  % 在图像窗口3绘图
streamline(X,Y,Ex,Ey,xs1,ysd);                               % 生成q1产生的电力线
streamline(X,Y,Ex,Ey,xs2,ysd);                               % 生成q2产生的电力线
streamline(X,Y,Ex,Ey,xs3,ysp);                               % 生成q1产生的电力线
grid on;                                                    % 形成网格
hold on;                                                    % 保持图形
contour(X,Y,V,Veq);                                         % 绘制等势线
plot(-sqrt(3),-1,'ro','MarkerSize',12);                      % 在p1画出点电荷
plot(sqrt(3),-1,'ro','MarkerSize',12);                       % 在p2画出点电荷
plot(0,2,'ro','MarkerSize',12);                              % 在p3画出点电荷
title('真空中三个等量同性点电荷的等电位线及电场线（用光滑连续曲线表示）','fontsize',20);    % 绘制出图形标题
xlabel('X轴(单位：m)','fontsize',12);                       % 绘制出X轴标注
ylabel('Y轴(单位：m)','fontsize',12);                       % 绘制出注
hold off;                                                   % 取消保持
% 绘制场域内的等电位线及电场线（用归一化箭头表示）的分布

E=sqrt(Ex.^2+Ey.^2);                                         % 计算各点的电场强度的幅值
Exs=Ex./E;
Eys=Ey./E;                                                   % 归一化电场强度
Xs=X(:,1:3:60);                                             
Xs=Xs(1:3:60,:);                                            % 分别缩减三分之一箭头横坐标点至20*20
Ys=Y(:,1:3:60); 
Ys=Ys(1:3:60,:);                                                % 分别缩减箭头纵坐标点至20*20
Exs=Exs(:,1:3:60);
Exs=Exs(1:3:60,:);                                          % 分别缩减对应坐标的电场强度的X分量的数量
Eys=Eys(:,1:3:60);
Eys=Eys(1:3:60,:);                                          % 分别缩减对应坐标的电场强度的Y分量的数量
figure(4);                                                  % 在图像窗口4绘图
quiver(Xs,Ys,Exs,Eys);                                      % 用归一化箭头表示场域各点电场强度的方向
hold on;                                                    % 保持图形
contour(X,Y,V,Veq);                                         % 绘制等势线
title('真空中三个等量同性点电荷的等电位线及电场线（用归一化箭头表示）','fontsize',20);    % 绘制出图形标题
xlabel('X轴(单位：m)','fontsize',15);                       % 绘制出X轴标注
ylabel('Y轴(单位：m)','fontsize',15);                       % 绘制出Y轴标注
hold off;                                                   % 取消保持
