function [V] = V_dis(ro,xa,xb,N,n,X,Y)
% V_DIS is the function to calculte the electric feild distribution by deviding line charge to segments.
%   ro is the line charge density
%   xa and xb is the x-coordinate of the endpoints
%   N is the number of depart segments
%   n is the number of coordinates
%   (X, Y) is the coordinates of the space

k = 9e9; % electrostatic constant
l = 2; % length of line charge
dx = l / N; % length of each segments

x0 = xa + dx/2; % the first x-coordinate
xn = xb - dx/2; % the last x-coordinate
qx = x0: dx :xn;   % the x-coordinate of charge segments

V = zeros(N,n,n);        % create the coordinates space for N point charges

i = 1;
for qxi = qx
    r = sqrt((X-qxi).^2+(Y.^2)); % calculate the distances for coordinates to each charge point
    V(i,:,:) = 1 ./ r; % storage reciprocal of the distances
    i = i + 1;
end

V = sum(V);  % calculate the sum of reciprocal of the distances 
V = reshape(V,n,n); % reshape matrix to two demension
dq = ro * l / N; %calculate dq
V = k*dq.*V; % times the k and dq

end

