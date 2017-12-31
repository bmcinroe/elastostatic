function fx = grad_x(f, dx)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
d = size(f);
dimx = d(1);
dimy = d(2);

fx = zeros(dimx, dimy);
for i = 1:dimy
    for j = 1:dimx
        if j == 1
            fx(i,j) = fwd_diff(f(i,j+2),f(i,j+1),f(i,j),dx);
        elseif j == dimx
            fx(i,j) = bwd_diff(f(i,j-2),f(i,j-1),f(i,j),dx);
        else
            fx(i,j) = ctr_diff(f(i,j+1),f(i,j-1),dx);
        end
    end
end

end

