%
clear all;
img1 = imread('0009.bmp');
img2 = imread('0010.bmp');
width = length(img1(1,:,1));
height = length(img1(:,1,1));
b1 = img1(:,:,3);
b2 = img2(:,:,3);

nw = 128;
nh = 64;
 
k = 1;
for j=1:nh:height
        if (j+nh-1 > height)
            j = height + 1 - nh;
        end;
        for i=1:nw:width
            if (i+nw-1 > width)
                i = width + 1 - nw;
            end;

        b1gr = b1(j:j+nh-1, i:i+nw-1);
        b2gr = b2(j:j+nh-1, i:i+nw-1);

        hi2_1(k) = hi2func(b1gr);
        pr1(k) = hi2p(hi2_1(k), 128);
        hi2_2(k) = hi2func(b2gr);
        pr2(k) = hi2p(hi2_2(k), 128);
        k = k+1;
    end;
end;

step = (k - 1) / width * height;
t = 1:step:(k - 1)*step;
figure(1);
plot(t, pr1);
title('Вероятность: первое изображение, B');
figure(2);
plot(t, pr2);
title('Вероятность: второе изображение, B');
figure(3);
plot(t, hi2_1);
title('Хи-квадрат: первое изображение, B');
figure(4);
plot(t, hi2_2);
title('Хи-квадрат: второе изображение, B');