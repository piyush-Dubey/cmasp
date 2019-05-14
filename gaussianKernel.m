function [ gaussian ] = gaussianKernel( x, y, sigma )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
z = norm(x - y)^2 / sigma;
gaussian = 1 / sqrt(2 * pi * sigma) * exp(-1 / 2 * z^2);
end

