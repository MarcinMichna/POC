clearvars; close all; clc;

I = imread("lena.bmp");

lena = imresize(I,0.25); % 128


lena31 = imadjust(lena, [], [0 31/255]);
lena15 = imadjust(lena, [], [0 15/255]);
lena7 = imadjust(lena, [], [0 7/255]);
lena3 = imadjust(lena, [], [0 3/255]);
lena1 = imadjust(lena, [], [0 1/255]);

subplot(3,2,1);
imshow(lena);

subplot(3,2,2);
imshow(lena31,[]);

subplot(3,2,3);
imshow(lena15,[]);

subplot(3,2,4);
imshow(lena7,[]);

subplot(3,2,5);
imshow(lena3,[]);

subplot(3,2,6);
imshow(lena1,[]);