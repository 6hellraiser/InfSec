clear all;
img1 = imread('0005.bmp');
img2 = imread('0006.bmp');
width = length(img1(1,:,1));
height = length(img1(:,1,1));
r1 = img1(:,:,1);
g1 = img1(:,:,2);
b1 = img1(:,:,3);
r1 = bitshift(bitshift(uint8(r1), 7), -7).*255;
g1 = bitshift(bitshift(uint8(g1), 7), -7).*255;
b1 = bitshift(bitshift(uint8(b1), 7), -7).*255;

r2 = img2(:,:,1);
g2 = img2(:,:,2);
b2 = img2(:,:,3);
r2 = bitshift(bitshift(uint8(r2), 7), -7).*255;
g2 = bitshift(bitshift(uint8(g2), 7), -7).*255;
b2 = bitshift(bitshift(uint8(b2), 7), -7).*255;

newImg1 = zeros(height, width, 3);
newImg2 = zeros(height, width, 3);

 newImg1(:,:,1) = r1;
 newImg1(:,:,2) = g1;
 newImg1(:,:,3) = b1;

 newImg2(:,:,1) = r2;
 newImg2(:,:,2) = g2;
 newImg2(:,:,3) = b2;

figure(1);
imshow(newImg1);
title('0005.bmp');
figure(2);
imshow(newImg2);
title('0006.bmp');

clear all;
img1 = imread('0007.bmp');
img2 = imread('0008.bmp');
width = length(img1(1,:,1));
height = length(img1(:,1,1));
r1 = img1(:,:,1);
g1 = img1(:,:,2);
b1 = img1(:,:,3);
r1 = bitshift(bitshift(uint8(r1), 7), -7).*255;
g1 = bitshift(bitshift(uint8(g1), 7), -7).*255;
b1 = bitshift(bitshift(uint8(b1), 7), -7).*255;

r2 = img2(:,:,1);
g2 = img2(:,:,2);
b2 = img2(:,:,3);
r2 = bitshift(bitshift(uint8(r2), 7), -7).*255;
g2 = bitshift(bitshift(uint8(g2), 7), -7).*255;
b2 = bitshift(bitshift(uint8(b2), 7), -7).*255;

newImg1 = zeros(height, width, 3);
newImg2 = zeros(height, width, 3);

 newImg1(:,:,1) = r1;
 newImg1(:,:,2) = g1;
 newImg1(:,:,3) = b1;

 newImg2(:,:,1) = r2;
 newImg2(:,:,2) = g2;
 newImg2(:,:,3) = b2;

figure(3);
imshow(newImg1);
title('0007.bmp');
figure(4);
imshow(newImg2);
title('0008.bmp');

clear all;
img1 = imread('0009.bmp');
img2 = imread('0010.bmp');
width = length(img1(1,:,1));
height = length(img1(:,1,1));
r1 = img1(:,:,1);
g1 = img1(:,:,2);
b1 = img1(:,:,3);
r1 = bitshift(bitshift(uint8(r1), 7), -7).*255;
g1 = bitshift(bitshift(uint8(g1), 7), -7).*255;
b1 = bitshift(bitshift(uint8(b1), 7), -7).*255;

r2 = img2(:,:,1);
g2 = img2(:,:,2);
b2 = img2(:,:,3);
r2 = bitshift(bitshift(uint8(r2), 7), -7).*255;
g2 = bitshift(bitshift(uint8(g2), 7), -7).*255;
b2 = bitshift(bitshift(uint8(b2), 7), -7).*255;

newImg1 = zeros(height, width, 3);
newImg2 = zeros(height, width, 3);

 newImg1(:,:,1) = r1;
 newImg1(:,:,2) = g1;
 newImg1(:,:,3) = b1;

 newImg2(:,:,1) = r2;
 newImg2(:,:,2) = g2;
 newImg2(:,:,3) = b2;

figure(5);
imshow(newImg1);
title('0009.bmp');
figure(6);
title('0010.bmp');
imshow(newImg2);