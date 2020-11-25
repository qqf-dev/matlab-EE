clear; % clear memory
clc; % clear command window
l = 2; % set length
ro = 1e-9; % set charge density
k=9e9; % set electrostatic constant
n = [20, 20, 20]; % set three degree of seperation
pn = 60; % set accuarcy of coordinates
xa = -1; % set x-coordinate of point A
xb = 1; % set x-coordinate of point A

xm = 4; % set max value of x
ym = 4; % set max value of y
x = linspace(-xm,xm,pn); % devide the x-axis into pn segments
y = linspace(-ym,ym,pn); % devide the x-axis into pn segments
[X,Y] = meshgrid(x,y); % to form the coordinates

li = 1;
for ni = n % darw 3 times picture for different n
    V = V_dis(ro,xa,xb,ni,pn,X,Y);
     
    figure(20 + li); % plot at figure 21, 22, 23
    mesh(X,Y,V); % plot the distribustion of electric potential 
    hold on;
    xlabel('X axis(Unit: m)','fontsize',15); % label X axis
    ylabel('Y axis(Unit: m)','fontsize',15); % label Y axis
    zlabel('V(Unit: F/m)','fontsize',15) % label Z axis
    title({'Distribustion of electric potential of a line charge';'by infinitesimal method (by 11910103 Qingfu Qin)'},'fontsize',20) % title figure
    hold off;
    
    Vmin=0; % set minimum potential
    Vmax=60; % set maximum potential
    Veq=linspace(Vmin,Vmax,40); % set 40 potential of isopotential lines
    figure(23 + li); % plot at figure 24, 25, 26
    contour(X,Y,V,Veq); % plot 40 lines
    grid on;
    hold on;
    title({'Isopotential lines of a line charge';'by infinitesimal method (by 11910103 Qingfu Qin)'},'fontsize',20); % title figure
    xlabel('X axis(Unit：m)','fontsize',15); % label X axis
    ylabel('Y axis(Unit：m)','fontsize',15); % label Y axis
    hold off;
    
    [Ex,Ey]=gradient(-V); % calculation of electric field intensity at each point
    del_theta=15; % set angular difference
    theta=(0:del_theta:360).*pi/180; % express the angle into radian
    xs1=1.1*cos(theta); % generate the x coordinate for the start of the field (a oval coordinate)
    ys=sqrt(0.21)*sin(theta); % generate the x coordinate for the start of the field (a oval coordinate)
    figure(26 + li); % plot at figure 27, 28, 29
    streamline(X,Y,Ex,Ey,xs1,ys); % generate the field lines
    grid on;
    hold on;
    contour(X,Y,V,Veq); % plot eauipotential lines
    title({'Isopotential lines and Power lins of a line charge';'by infinitesimal method (by 11910103 Qingfu Qin)'},'fontsize',20);    % title figure
    xlabel('X axis(Unit：m)','fontsize',15); % label X axis
    ylabel('Y axis(Unit：m)','fontsize',15); % label Y axis
    hold off;
    li = li + 1;
end