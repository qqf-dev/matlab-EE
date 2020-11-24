function [V] = V_det(ro,xa,xb,N,n,X,Y)
% V_DET is the function to calculte the electric feild distribution .
%   ro is the line charge density
%   xa and xb is the x-coordinate of the endpoints
k = 9e9;                   % set the
l = 2; %set ht
dq = ro * l / N;
qx = linspace(xa,xb,N);   % set the x-coordinate of charge segments


V = zeros(N,n,n);        % 让场域各点由不同点电荷产生的电场存在V中

i = 1;
for qxi = qx
    r = sqrt((X-qxi).^2+(Y.^2)); % calculate the distace to each charge point
    V(i,:,:) = 1 ./ r;
    i = i +1;
end

V = sum(V);  % calculate the sum of reciprocal of the distances 
V = reshape(V,n,n); % reshape matrix to two demension
V = k*dq.*V;

end

