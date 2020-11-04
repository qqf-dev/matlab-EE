clear;                  % ����ڴ������б���
clc;                    % ���������е�����
l = 2;                  % ����AB����Ϊ2
ro = 1e-9;              % �����ߵ���ܶ�
k=9e9;                   % ���þ���������
n= 100;
pn = 100;
dq = ro * l / n;       % ���ߵ�ɷֳ�n�ݣ���Ϊn�����ɣ�
xa = -1;                % ����A�������
xb = 1;                 % ����B�������
%
xm = 4;                   % ���ó�����x����ķ�Χ
ym = 4;                   % ���ó�����y����ķ�Χ
x = linspace(-xm,xm,pn);    % ��x��ȷ�60�ȷ�
y = linspace(-ym,ym,pn);    % ��y��ȷֳ�60�ȷ�
[X,Y] = meshgrid(x,y);      % �γɳ����и��������
qx = linspace(xa,xb,n);   % �γɵ��ɵĺ�����
V = zeros(n,pn,pn);        % �ó�������ɲ�ͬ���ɲ����ĵ糡����V��

i = 1;
for s = qx
    r = sqrt((X-s).^2+Y.^2); % ���㳡����㵽���ɾ���
    V(i,:,:) = k * dq ./ r;
    i = i +1;
end

V = sum(V);
V = reshape(V,pn,pn);
figure(1);
mesh(X,Y,V);
hold on;
xlabel('x');
ylabel('y')
hold off;
%
Vmin=0;                                                   % ���õ�λ�������С��λֵ
Vmax=60;                                                  % ���õ�λ���������λֵ
Veq=linspace(Vmin,Vmax,40);                                 % �趨20����λ�ߵĵ�λֵ
figure(2);                                                  % ��ͼ�񴰿�2��ͼ
contour(X,Y,V,Veq);                                         % ����20��������
grid on;                                                    % �γ�����
hold on;                                                    % ����ͼ��
title('�������������ͬ�Ե��ɵĵȵ�λ��(11910103 ���츣)','fontsize',20);         % ���Ƴ�ͼ�α���
xlabel('X��(��λ��m)','fontsize',15);                         % ���Ƴ�X���ע
ylabel('Y��(��λ��m)','fontsize',15);                         % ���Ƴ�Y���ע
hold off; 
%
[Ex,Ey]=gradient(-V);                                       % ���㳡�����ĵ���ǿ�ȵ���������
del_theta=15;                                               % �������ڵ����߼�ĽǶȲ�
theta=(0:del_theta:360).*pi/180;                            % ���ɵ����ߵĻ���ֵ
xs1=1.1*cos(theta);                                   % ��q2���ɵ����ߵ�x������
ys=sqrt(0.21)*sin(theta);                                        % q1,q2���ɵ����ߵ�y������
figure(3);                                                  % ��ͼ�񴰿�3��ͼ
streamline(X,Y,Ex,Ey,xs1,ys);                               % ����q2�����ĵ�����
grid on;                                                    % �γ�����
hold on;                                                    % ����ͼ��
contour(X,Y,V,Veq);                                         % ���Ƶ�����
title('�������������ͬ�Ե��ɵĵȵ�λ�߼��糡�ߣ��ù⻬�������߱�ʾ��(11910103 ���츣)','fontsize',20);    % ���Ƴ�ͼ�α���
xlabel('X��(��λ��m)','fontsize',12);                         % ���Ƴ�X���ע
ylabel('Y��(��λ��m)','fontsize',12);                         % ���Ƴ�ע
hold off;    
%
E=sqrt(Ex.^2+Ey.^2);                                        % �������ĵ糡ǿ�ȵķ�ֵ
Exs=Ex./E;
Eys=Ey./E;                                                  % ��һ���糡ǿ��
Xs=X(:,1:4:pn);                                             
Xs=Xs(1:4:pn,:);                                            % �ֱ�������ͷ���������21*21
Ys=Y(:,1:4:pn); 
Ys=Ys(1:4:pn,:);                                            % �ֱ�������ͷ���������21*21
Exs=Exs(:,1:4:pn);
Exs=Exs(1:4:pn,:);                                          % �ֱ�������Ӧ����ĵ糡ǿ�ȵ�X����������
Eys=Eys(:,1:4:pn);
Eys=Eys(1:4:pn,:);                                          % �ֱ�������Ӧ����ĵ糡ǿ�ȵ�Y����������
figure(4);                                                  % ��ͼ�񴰿�4��ͼ
quiver(Xs,Ys,Exs,Eys);                                      % �ù�һ����ͷ��ʾ�������糡ǿ�ȵķ���
hold on;                                                    % ����ͼ��
contour(X,Y,V,Veq);                                         % ���Ƶ�����
xlabel('X��(��λ��m)','fontsize',15);                         % ���Ƴ�X���ע
ylabel('Y��(��λ��m)','fontsize',15);                         % ���Ƴ�Y���ע
hold off;    

