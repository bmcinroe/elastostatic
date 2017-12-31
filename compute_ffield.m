function [fx, fy] = compute_ffield(ux, uy, dx, mu, lam)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

d = size(ux);
dimx = d(1);
dimy = d(2);

% finger_coord = [[1 5 0 -1]; [dimy 5 0 1]];
% [fx_ext, fy_ext] = f_ext(finger_coord, ux, dx);
% disp(fy_ext);


fx_ext = zeros(dimx, dimy);
fy_ext = zeros(dimx, dimy);
%%% 
f_temp = zeros(1,dimx);

mag = 3;

f_temp = gaussian(f_temp,mag,10);

%set forces below!

fy_ext(1,:) = -f_temp;
%fy_ext(dimy,:) = f_temp; 
fy_ext(dimy,:) = 0; 
%%%

% fy_ext(1,10) = -1;
% fy_ext(dimy,13) = 1;
% fx_ext(13,dimy) = 1;
% fx_ext(5,1) = -1;

%fy_ext = fy_ext - 1;

%compute strain tensor fields
uxx = grad_x(ux, dx);
uyy = grad_y(uy, dx);
uxy = .5*(grad_x(uy, dx) + grad_y(ux, dx));

%compute stresses from hooke's law
sxx = 2*mu*uxx + lam*(uxx + uyy);
syy = 2*mu*uyy + lam*(uxx + uyy);
sxy = 2*mu*uxy;

%impose strain boundary conditions
for i = 1:dimx
    syy(1,i) = 0;
    syy(dimy,i) = 0;%comment for settling
    sxy(1,i) = 0;
    sxy(dimy,i) = 0;
end

for i = 1:dimy
    sxx(i,1) = 0; %comment for settling
    sxx(i,dimx) = 0;
    sxy(i,1) = 0;
    sxy(i,dimx) = 0;
end

%compute force fields
%currently uniform field
fx = grad_x(sxx, dx) + grad_y(sxy, dx) + fx_ext;
fy = grad_x(sxy, dx) + grad_y(syy, dx) + fy_ext;

end

