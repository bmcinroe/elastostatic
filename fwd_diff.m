function df_x = fwd_diff(f_2xr, f_xr, f_x, dx)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
df_x = (-f_2xr + 4*f_xr - 3*f_x)/(2*dx);

end

