function [V] = V_con(ro,X,Y)
%V_CON is the function to calculte the electric field distribution
%  
k = 9e9;
lo = (1-X+sqrt((1-X).^2+Y.^2));
lo = lo./(-1-X+sqrt((-1-X).^2+Y.^2));
V = k * ro * log(lo);
end

