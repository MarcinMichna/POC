clc; clearvars; close all;

moon = imread('moon.bmp');

%3.2
M = [0 1 0;1 -4 1; 0 1 0];

%3.3
M = M/9;



conv = uint8(conv2(moon, M, 'same'));

subplot(1,3,1);
imshow(moon);

subplot(1,3,2)
imshow(conv + 128,[]);

subplot(1,3,3)
imshow(abs(conv),[]);




lap = fspecial('laplacian');
conv = uint8(conv2(moon, lap, 'same'));
figure(2);

subplot(2,2,1);
imshow(moon,[]);

subplot(2,2,2)
imshow(conv + 128,[]);

subplot(2,2,3)
imshow(abs(conv),[]);

subplot(2,2,4)
imshow(moon - conv + 128,[]);