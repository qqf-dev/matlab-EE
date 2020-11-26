clear; % clear memory
clc; % clear comand window
r = 1; % set radius of the current loop
I = 100; % set the current of the loop
N = 50; % set the segments number
ym = 3;
zm = 3;

dtheta = linspace(0, 2 * pi, N);

pn = 60;
y = linspace(-ym, ym, pn);
z = linspace(-zm, zm, pn);
[Y, Z] = meshgrid(y, z);
