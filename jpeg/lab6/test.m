clear, close all;

s = ['image_002.jpg' 
    'image_003.jpg'
    'image_004.jpg'
    'image_005.jpg'
    'image_006.jpg'
    'image_007.jpg'
    ];

n = 16;

pout = imread(s(1,:));
pout = rgb2gray(pout);
pout2 = pout(:,:);
I = im2double(adapthisteq(pout2));
f = @(block) dct2(block.data);
A = blockproc(I,[n n],f);
figure(1);
imhist(A);
[y, x] = imhist(A);


pout = imread(s(2,:));
pout = rgb2gray(pout);
pout2 = pout(:,:);
I = im2double(adapthisteq(pout2));
f = @(block) dct2(block.data);
A = blockproc(I,[n n],f);
figure(2);
imhist(A);
[y2, x2] = imhist(A);


pout = imread(s(3,:));
pout = rgb2gray(pout);
pout2 = pout(:,:);
I = im2double(adapthisteq(pout2));
f = @(block) dct2(block.data);
A = blockproc(I,[n n],f);
figure(3);
imhist(A);
[y3, x3] = imhist(A);


pout = imread(s(4,:));
pout = rgb2gray(pout);
pout2 = pout(:,:);
I = im2double(adapthisteq(pout2));
f = @(block) dct2(block.data);
A = blockproc(I,[n n],f);
figure(4);
imhist(A);
[y4, x4] = imhist(A);


pout = imread(s(5,:));
pout = rgb2gray(pout);
pout2 = pout(:,:);
I = im2double(adapthisteq(pout2));
f = @(block) dct2(block.data);
A = blockproc(I,[n n],f);
figure(5);
imhist(A);
[y5, x5] = imhist(A);


pout = imread(s(6,:));
pout = rgb2gray(pout);
pout2 = pout(:,:);
I = im2double(adapthisteq(pout2));
f = @(block) dct2(block.data);
A = blockproc(I,[n n],f);
figure(6);
imhist(A);
[y6, x6] = imhist(A);



figure(7);
hold on;
plot(x, y, 'b', 'LineWidth', 1);
plot(x2, y2, 'r', 'LineWidth', 1);
plot(x3, y3, 'g', 'LineWidth', 1);
plot(x4, y4, 'm', 'LineWidth', 1);
plot(x5, y5, 'y', 'LineWidth', 1);
plot(x6, y6, 'c', 'LineWidth', 1);
hold off;