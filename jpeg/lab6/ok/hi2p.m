function [ result ] = hi2p( hi2v, n )
result = 0.0;
fun = @(x) x.^(((n - 1)/2) - 1) .* exp(-x./2);
L = integral(fun,0,hi2v);
result = 1 - double(L)/(2^((n - 1)/2) * gamma((n - 1)/2));
end

