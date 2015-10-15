function [ result ] = jpegHi2( count )
result = 0;
x = zeros(length(count)/2, 1);
y = zeros(length(count)/2, 1);
z = zeros(length(count)/2, 1);
for i = 1:1:length(count)/2
   x(i,1) = count(i*2 - 1);
   y(i,1) = count(i*2);
   z(i,1) = (x(i,1) + y(i,1)) / 2;
   if (z(i,1) > 0)
        result = result + (((x(i, 1) - z(i, 1))^2)/z(i, 1));
   end;
end
end

