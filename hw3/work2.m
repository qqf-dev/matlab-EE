clear; % clear memory
clc; % clear comand window
a = 2; % set radius of the current loops
I = 500; % set the current of the loop
C = I / (4 * pi);

zc1 = -1;
zc2 = 1; % set location of the center of each loop(x and y are 0)

N = 50; % set the segments number
ym = 5;
zm = 5;
pn = 60; % set the of coordinate

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

        for li = 1:N% calculate magnetic field intensity vector at (bi, bj) of loop1
            R = sqrt((0 - xc(li))^2 + (bi - yc(li))^2 + (bj - zc1)^2);

            v_l = dl * [-sin(phi(li)), cos(phi(li)), 0]; % set the vector of dL
            v_r = [0 - xc(li), bi - yc(li), bj - zc1]; % set vector of R
            v_H = cross(v_l, v_r); % calculate value of cross product
            dHx = dHx + C * v_H(1) / (R^3);
            dHy = dHy + C * v_H(2) / (R^3);
            dHz = dHz + C * v_H(3) / (R^3); % accumalte magnitude of vectors on each axis
        end

        for li = 1:N% calculate magnetic field intensity vector at (bi, bj) of loop2
            R = sqrt((0 - xc(li))^2 + (bi - yc(li))^2 + (bj - zc2)^2);

            v_l = -dl * [-sin(phi(li)), cos(phi(li)), 0]; % the direction of elementary is opposite
            v_r = [0 - xc(li), bi - yc(li), bj - zc2];
            v_H = cross(v_l, v_r);
            dHx = dHx + C * v_H(1) / (R^3);
            dHy = dHy + C * v_H(2) / (R^3);
            dHz = dHz + C * v_H(3) / (R^3);
        end

        Hx(cj, ci) = dHx;
        Hy(cj, ci) = dHy;
        Hz(cj, ci) = dHz;

        cj = cj + 1;
    end

    ci = ci + 1;
end

H = sqrt(Hy.^2 + Hz.^2); % calculate the magnitude on yz plane

figure(1);
quiver(Y, Z, Hy, Hz); % plot the vector graph of magnetic field intensity
hold on
plot(-2, -1, 'bo');
plot(2, -1, 'ro');
plot(-2, 1, 'ro');
plot(2, 1, 'bo');
xlabel("Y (units: m)");
ylabel("Z (units: m)"); % label the axis
axis([-3, 3, -2, 2]);
hold off;

figure(2);
mesh(Y, Z, H); % plot graph of magnetic field intensity
hold on;
xlabel("Y (units: m)");
ylabel("Z (units: m)");
zlabel("H (units: A/m)")% label the axis
axis([-4, 4, -3, 3]);
hold off;

figure(3);
ys = linspace(-1.5, 1.5, 10);
zs = linspace(-0.5, 0.5, 10);
streamline(Y, Z, Hy, Hz, ys, zs); % plot the vector graph of magnetic field intensity
hold on;
streamline(Y, Z, -Hy, -Hz, ys, zs);
streamline(Y, Z, Hy, Hz, -ys, zs);
streamline(Y, Z, -Hy, -Hz, -ys, zs);


xlabel("Y (units: m)");
ylabel("Z (units: m)"); % label the axis
axis([-4, 4, -3, 3]);

hold off;
