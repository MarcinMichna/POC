close all; clc; clearvars;

bart = imread("bart.bmp");

figure(1);
subplot(1,3,1)
imshow(bart)
subplot(1,3,2)
imhist(bart)

bartBW = bart > 190 & bart < 210;
%bartBW = uint8(bartBW,[]);

subplot(1,3,3)
imshow(bartBW)
