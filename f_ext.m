function [fx_ext, fy_ext] = f_ext(finger_coord, ux, dx)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here

%finger_coord is nxn array, n = max number of fingers, containing finger
%contact points and relative forces

d = size(ux);
dimx = d(1);
dimy = d(2);
fx_ext = zeros(dimx, dimy);
fy_ext = zeros(dimx, dimy);

posx = zeros(dimx,dimy);
posy = zeros(dimx,dimy);
for i = 1:dimx
    for j = 1:dimy
        posx(i,j) = j*dx;
        posy(i,j) = i*dx;
    end
end

d = size(finger_coord);
for i = 1:d(1)
    if finger_coord(i,1) == 1
        fy_ext(1,:) = gaussian(posx(1,:), finger_coord(i,4), finger_coord(i,2));
    elseif finger_coord(i,1) == dimy
        fy_ext(1,:) = gaussian(posx(dimy,:), finger_coord(i,4), finger_coord(i,2));
    end



end

