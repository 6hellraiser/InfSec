%Lena_2? sailboat_at_anchor_2?
%4, 1?
clear all;
img1 = imread('0001.jpg');
img2 = imread('0002.jpg');
width = length(img1(1,:,1));
height = length(img1(:,1,1));
b1 = img1(:,:,3);
b2 = img2(:,:,3);

k = 1;
stepX = 8;
stepY = 8;
for i=1:stepX:width
        if (i + stepX - 1 > width)
            i = width - stepX + 1;
        end;       
    for j=1:stepY:height
        if (j + stepY - 1 > height)
            j = height - stepY + 1;
        end;
    
        dctb1(:, :, k) = dct2(b1(j:j+stepY - 1, i:i+stepX - 1));
        dctb2(:, :, k) = dct2(b2(j:j+stepY - 1, i:i+stepX - 1));

        m = 200;
        histImg1 = hist(dctb1(:), m);
        histImg2 = hist(dctb2(:), m);
        
        hi2_1(k) = jpegHi2(histImg1);
        hi2_2(k) = jpegHi2(histImg2);
        
        prImg1(k) = hi2p(hi2_1(k), length(histImg1)/2);
        prImg2(k) = hi2p(hi2_2(k), length(histImg1)/2);

        k = k + 1;
        
    end;
end;

step = (k - 1) / width * height;
t = 1:step:(k - 1)*step;
figure(1);
plot(t, prImg1);
title('Вероятность: первое изображение, B');
figure(2);
plot(t, prImg2);
title('Вероятность: второе изображение, B');
figure(3);
plot(t, hi2_1);
title('Хи-квадрат: первое изображение, B');
figure(4);
plot(t, hi2_2);
title('Хи-квадрат: второе изображение, B');