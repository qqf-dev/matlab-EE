clear; % clear memory
clc; % clear command window
l = 2; % set length
ro = 1e-9; % set charge density
k=9e9; % set electrostatic constant
n = [20, 50, 100]; % set three degree of seperation
pn = 60; % set accuarcy of coordinates
xa = -1; % set x-coordinate of point A
xb = 1; % set x-coordinate of point A

xm = 4; % set max value of x
ym = 4; % set max value of y
x = linspace(-xm,xm,pn); % devide the x-axis into pn segments
y = linspace(-ym,ym,pn); % devide the x-axis into pn segments
[X,Y] = meshgrid(x,y); % to form the coordinates
V1 = V_con(ro,X,Y); % the real electric potential distribustion of line charge


li = 1;
for ni = n % draw figure three times fo different N (20, 50, 100)
    V2 = V_dis(ro,xa,xb,ni,pn,X,Y); % the electric potential distribustion of the infinitemal method
    dV = abs(V1 - V2); % calculate the difference between two method
    
    figure(30 + li); % plot at figure 31, 32, 33
    mesh(X, Y, dV); % plot distribustion of the difference
    hold on;
    title({'Distribution of the difference potential';' (by 11910103 Qingfu Qin)'},'fontsize',20);    % title figure
    xlabel('X axis(Unit：m)','fontsize',15); % label X axis
    ylabel('Y axis(Unit：m)','fontsize',15); % label Y axis
    hold off;
    li = li +1;
end

N = 20; % set the number of segments
y = [0.1]; % set y = 0.1;
[X,Y] = meshgrid(x,y); % to form the coordinates
V1 = V_con(ro,X,Y); % calculate the real distribustion at y = 0.1

V2 = zeros(N,1,pn);        % create the coordinates space for N point charges
dx = 2/N;
x0 = xa + dx/2; % the first x-coordinate
xn = xb - dx/2; % the last x-coordinate
qx = x0: dx :xn;   % the x-coordinate of charge segments
i = 1;
for qxi = qx
    r = sqrt((X-qxi).^2+(Y.^2)); % calculate the distances for coordinates to each charge point
    V2(i,:,:) = 1 ./ r; % storage reciprocal of the distances
    i = i + 1;
end

V2 = sum(V2);  % calculate the sum of reciprocal of the distances 
V2 = reshape(V2,1,pn); % reshape matrix to two demension
dq = ro * l / N; %calculate dq
figure(34); % plot at figure 34
plot(x, V1, 'r'); % plot V1-a
hold on;
plot(x, V2, 'b'); % plot V2-a
xlabel('X axis(Unit：m)','fontsize',15); % label X axis
ylabel('V(Unit：F/m)','fontsize',15); % label Y axis (Y axis is potential level when y = 0.1)
hold off;

x = [-1:0.05/100:1];
dVm = k * ro ./ (x.^2+0.1^2);
figure(35); % plot at figure 34
plot(x, dVm, 'b');
hold on;
qx = xa + 0.05: dx :xb;   % get x-coordinate of left point of each rectangular area.
dVq = k * ro ./ (qx.^2+0.1^2); % calculate the each area's height.
plot(qx,dVq, 'ro'); % draw the point of each height at the function

qx = qx - 2/40; % move middle point of each area to fit the value of the function

stem(qx,dVq,'r','Marker','None');
stairs(qx,dVq, 'r'); % draw the areas.
hold off;

Sr = dVq * dx; % area of each rectangular block

qx = xa: dx :xb;   % get x-coordinate of left point of each rectangular area.

Fi = k * ro .* log(abs(sqrt(100.*qx.^2+1)+10.*qx));
p = 2;
Si = linspace(0,0,20);
while p < 22
Si(p-1) = Fi(p) - Fi(p-1);
    p= p + 1;
end

ei = abs(Si - Sr);
e = sum(ei);







