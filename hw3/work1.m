clear; % clear memory
clc; % clear comand window
a = 2; % set radius of the current loops
I = 500; % set the current of the loop
C = I / (4 * pi);

zc1 = -1;
zc2 = 1; % set location of the center of each loop(x and y are 0)

N = 100; % set the segments number
ym = 5;
zm = 5;
pn = 100; % set the of coordinate

dphi = 2 * pi / N; % set angle of each segment of the loop
phi = linspace(dphi, 2 * pi - dphi, N); % set angle - coordinates of segments

y = linspace(-ym, ym, pn);
z = linspace(-zm, zm, pn);
[Y, Z] = meshgrid(y, z);

xc = a * cos(phi);
yc = a * sin(phi); % transform angle to xy coordiantes

dl = a * dphi; % set length of each segment

Hx = zeros(pn);
Hy = zeros(pn);
Hz = zeros(pn);
H = zeros(pn);

ci = 1;

for bi = y

    cj = 1;

    for bj = z

        dHx = 0;
        dHy = 0;
        dHz = 0;
        dH = 0;

        for li = 1:N
            R = sqrt((0 - xc(li))^2 + (bi - yc(li))^2 + (bj - zc1)^2);

            v_l = dl * [-sin(phi(li)), cos(phi(li)), 0]; % set the vector of dL
            v_r = [0 - xc(li), bi - yc(li), bj - zc1]; % set vector of R
            v_H = cross(v_l, v_r); % calculate value of crross product
            dHx = dHx + C * v_H(1) / (R^3);
            dHy = dHy + C * v_H(2) / (R^3);
            dHz = dHz + C * v_H(3) / (R^3);
            dH = dH + C * norm(v_H) / (R^3);

        end

        for li = 1:N
            R = sqrt((0 - xc(li))^2 + (bi - yc(li))^2 + (bj - zc2)^2);

            v_l = dl * [-sin(phi(li)), cos(phi(li)), 0]; % set the vector of dL
            v_r = [0 - xc(li), bi - yc(li), bj - zc2]; % set vector of R
            v_H = cross(v_l, v_r); % calculate value of crross product
            dHx = dHx + C * v_H(1) / (R^3);
            dHy = dHy + C * v_H(2) / (R^3);
            dHz = dHz + C * v_H(3) / (R^3);
            dH = dH + C * norm(v_H) / (R^3);

        end

        Hx(cj, ci) = dHx;
        Hy(cj, ci) = dHy;
        Hz(cj, ci) = dHz;
        H(cj, ci) = dH;

        cj = cj + 1;
    end

    ci = ci + 1;
end

figure(1);
mesh(Y, Z, H);
hold on;
xlabel("Y");
ylabel("Z")
hold off;

figure(2);
quiver(Y, Z, Hy ./ H / 2, Hz ./ H / 2);

figure(3);
theta = [0 50 60 70 80 90 100 110 120 130 180].*pi/180;
ys = 2.1 * cos(theta);

zs = 1.1 * sin(theta);
streamline(Y, Z, Hy, Hz, ys, zs);
hold on;
streamline(Y, Z, -Hy, -Hz, ys, zs);
