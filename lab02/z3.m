clearvars; close all; clc;


%3.1
I = imread("lena.bmp");
I1 = imresize(I,0.5); % 256
I2 = imresize(I1,0.5); % 128
I3 = imresize(I2,0.5); % 64


%3.2
imshow(I);

figure(2);
imshow(I1,'InitialMagnification',200);

figure(3)
imshow(I2,'InitialMagnification',400);


figure(4);
imshow(I3,'InitialMagnification',800);
