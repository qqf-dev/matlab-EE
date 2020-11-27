clear; % clear memory
clc; % clear comand window
a = 2; % set radius of the current loops
I = 500; % set the current of the loop
C = I / (4 * pi);

zc1 = -1;
zc2 = -1; % set location of the center of each loop(x and y are 0)

N = 50; % set the segments number
ym = 3;
zm = 3;
pn = 60; % set the of coordinate

dphi = 2 * pi / N; % set angle of each segment of the loop
phi = linspace(dphi, 2 * pi - dtheta, N); % set angle - coordinates of segments

y = linspace(-ym, ym, pn);
z = linspace(-zm, zm, pn);
[Y, Z] = meshgrid(y, z);

xc = a * cos(theta);
yc = a * sin(theta); % transform angle to xy coordiantes

dl = r * dphi; % set length of each segment

H = zeros(pn);

for li = 1:N
    % FIXME
    v_phi = [sin(phi(li)), cos(phi(li))];
    v_r = [0, Y, Z];
    R = cross(v_r, v_phi);

    R = sqrt(xc(li)^2 + (Y - yc(li)).^2 + (Z - zc1).^2);
    H = H +
end
