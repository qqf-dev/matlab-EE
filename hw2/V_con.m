function [V] = V_con(ro,X,Y)
%V_CON is the function to calculte the electric field distribution by continuous function
%   ro is the charge density
%   (X, Y) is the coordinates of the space

k = 9e9; % the electrostatic constant

lo = (1-X+sqrt((1-X).^2+Y.^2));
lo = lo./(-1-X+sqrt((-1-X).^2+Y.^2)); % calculte the part in ln() function
V = k * ro * log(lo); % calculte electric potential distribution

end

