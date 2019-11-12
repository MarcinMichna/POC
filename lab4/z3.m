clearvars; clc, close all;

lenaRGB = imread('lenaRGB.bmp');

%3.2
r = lenaRGB(:,:,1);
g = lenaRGB(:,:,2);
b = lenaRGB(:,:,3);


subplot(1,4,1)
imshow(lenaRGB)

subplot(1,4,2)
imhist(r,256)

subplot(1,4,3)
imhist(g,256)

subplot(1,4,4)
imhist(b,256)

%3.2
obrazEq = lenaRGB;
obrazEq(:,:,1) = histeq(r,256);
obrazEq(:,:,2) = histeq(g,256);
obrazEq(:,:,3) = histeq(b,256);

figure(2)
subplot(1,2,1)
imshow(lenaRGB)
subplot(1,2,2)
imshow(obrazEq)

%3.3

i = rgb2hsv(lenaRGB);

h = i(:,:,1);
s = i(:,:,2);
v = i(:,:,3);

figure(3);
subplot(1,3,1)
imhist(h,256)

subplot(1,3,2)
imhist(s,256)

subplot(1,3,3)
imhist(v,256)

v = histeq(v,256);

i(:,:,3) = v;

figure(4)
subplot(1,2,1)
imshow(lenaRGB)
subplot(1,2,2)
imshow(hsv2rgb(i))







