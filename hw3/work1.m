clear; % clear memory
clc; % clear comand window
a = 2; % set radius of the current loops
I = 500; % set the current of the loop
C = I / (4 * pi); % merge the constants
zc1 = -1;
zc2 = 1; % set location of the center of each loop(x and y are 0)
ym = 5; 
zm = 5; % set range
pn = 60; % set accuarcy of coordinates
y = linspace(-ym, ym, pn);
z = linspace(-zm, zm, pn);
[Y, Z] = meshgrid(y, z);

N = 50; % set the segments number
dphi = 2 * pi / N; % set angle of each segment of the loop
phi = linspace(dphi, 2 * pi - dphi, N); % set angle - coordinates of segments

xc = a * cos(phi);
yc = a * sin(phi); % transform angle to xy coordiantes
dl = a * dphi; % set length of each segment

Hx = zeros(pn);
Hy = zeros(pn);
Hz = zeros(pn);
H = zeros(pn); % construct matrixes of magnetic field
ci = 1; % ci is the z coordinate of matrixes
for bi = y% each point of bi as y coordinate
    cj = 1; % cj is the y coordinate of matrixes
    for bj = z% each point of bj as z coordinate
        dHx = 0;
        dHy = 0;
        dHz = 0;
        dH = 0;
        for li = 1:N% calculate magnetic field intensity vector at point B (bi, bj) of loop1
            R = sqrt((0 - xc(li))^2 + (bi - yc(li))^2 + (bj - zc1)^2); % calculate the distance between segment and B  
            v_l = dl * [-sin(phi(li)), cos(phi(li)), 0]; % set the vector of dL
            v_r = [0 - xc(li), bi - yc(li), bj - zc1]; % set vector of R
            v_H = cross(v_l, v_r); % calculate value of cross product
            dHx = dHx + C * v_H(1) / (R^3);
            dHy = dHy + C * v_H(2) / (R^3);
            dHz = dHz + C * v_H(3) / (R^3); % accumalte magnitude of vectors on each axis
        end

        for li = 1:N% calculate magnetic field intensity vector at (bi, bj) of loop2
            R = sqrt((0 - xc(li))^2 + (bi - yc(li))^2 + (bj - zc2)^2);
            v_l = dl * [-sin(phi(li)), cos(phi(li)), 0];
            v_r = [0 - xc(li), bi - yc(li), bj - zc2];
            v_H = cross(v_l, v_r);
            dHx = dHx + C * v_H(1) / (R^3);
            dHy = dHy + C * v_H(2) / (R^3);
            dHz = dHz + C * v_H(3) / (R^3);
            dH = dH + sqrt(dHy.^2 + dHz.^2);
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
plot(-2, 1, 'bo');
plot(2, 1, 'ro'); % plot the point of coils
xlabel("Y (units: m)");
ylabel("Z (units: m)"); % label the axis
axis([-2, 2, -1, 1]);
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
theta = [0 50 60 70 80 90 100 110 120 130 180] .* pi / 180; % Set the radian value of the streamlines
ys = 2.1 * cos(theta);
zs = 1.1 * sin(theta); % set the coordinates of start points
streamline(Y, Z, Hy, Hz, ys, zs); % plot the magnentic line of force
hold on;
streamline(Y, Z, -Hy, -Hz, ys, zs); % plot negative direction lines
xlabel("Y (units: m)");
ylabel("Z (units: m)"); % label the axis
axis([-4, 4, -3, 3]);
hold off;
