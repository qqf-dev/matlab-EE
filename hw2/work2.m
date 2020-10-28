clear;                  % ����ڴ������б���
clc;                    % ���������е�����
l = 2;                  % ����AB����Ϊ2
ro = 1e-9;              % �����ߵ���ܶ�
k=9e9;                   % ���þ���������
n= 100;
pn = 100;
dq = ro * l / n;       % ���ߵ�ɷֳ�20�ݣ���Ϊ20�����ɣ�
xa = -1;                % ����A�������
xb = 1;                 % ����B�������

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
