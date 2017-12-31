function f = gaussian(x,a,b)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here

c = 2;
d = size(x);
f = zeros(1,d(2));

for i = 1:d(2)
    f(1,i) = a*exp(-((i-b)^2)/(2*c^2));
end