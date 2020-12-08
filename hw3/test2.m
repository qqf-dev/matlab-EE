clear;
clc;
a = 2; % set radius of the current loops
I = 500; % set the current of the loop
C = I / (4 * pi);

N = 100; % set the segments number
ym = 5;
zm = 5;
pn = 100; % set the of coordinate

dphi = 2 * pi / N; % set angle of each segment of the loop
phi = linspace(dphi, 2 * pi - dphi, N); % set angle - coordinates of segments
p = [0, -2.5, 0];
px = p(1);
py = p(2);
pz = p(3);

xc = a * cos(phi);
yc = a * sin(phi); % transform angle to xy coordiantes
zc = 0;

dl = a * dphi; % set length of each segment

H = linspace(0, 0, N);
Hx = linspace(0, 0, N);
Hy = linspace(0, 0, N);
Hz = linspace(0, 0, N);

dHx = 0;
dHy = 0;
dHz = 0;
dH = 0;

for li = 1:N
    R = sqrt((px - xc(li))^2 + (py - yc(li))^2 + (pz - zc)^2);

    v_l = dl * [-sin(phi(li)), cos(phi(li)), 0]; % set the vector of dL

    v_r = [px - xc(li), py - yc(li), pz - zc]; % set vector of R
    v_H = cross(v_l, v_r); % calculate value of crross product
    dHx = dHx + C * v_H(1) / (R^3);
    dHy = dHy + C * v_H(2) / (R^3);
    dHz = dHz + C * v_H(3) / (R^3);
    dH = dH + C * norm(v_H) / (R^3);

    Hx(li) = dHx;
    Hy(li) = dHy;
    Hz(li) = dHz;

    H(li) = dH;
end

plot(phi, H);
hold on
plot(phi, Hy, 'ro');
plot(phi, Hz, 'bo');
