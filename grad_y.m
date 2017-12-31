function fy = grad_y(f, dx)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
d = size(f);
dimx = d(1);
dimy = d(2);

fy = zeros(dimx, dimy);
for j = 1:dimx
    for i = 1:dimy
        if i == 1
            fy(i,j) = fwd_diff(f(i+2,j),f(i+1,j),f(i,j),dx);
        elseif i == dimy
            fy(i,j) = bwd_diff(f(i-2,j),f(i-1,j),f(i,j),dx);
        else
            fy(i,j) = ctr_diff(f(i+1,j),f(i-1,j),dx);
        end
    end
end

end

