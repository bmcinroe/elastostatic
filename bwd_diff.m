function df_x = bwd_diff(f_2xl, f_xl, f_x, dx)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
df_x = (f_2xl - 4*f_xl + 3*f_x)/(2*dx);

end

