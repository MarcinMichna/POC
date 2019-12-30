clearvars; clc; close all;

lena1 = imread('lena1.bmp');
lena2 = imread('lena2.bmp');
lena3 = imread('lena3.bmp');
lena4 = imread('lena4.bmp');


%1.1
figure(1);
subplot(4,2,1);
imshow(lena1)
subplot(4,2,2);
imhist(lena1,256);
subplot(4,2,3);
imshow(lena2)
subplot(4,2,4)
imhist(lena2,256);
subplot(4,2,5);
imshow(lena3)
subplot(4,2,6);
imhist(lena3,256);
subplot(4,2,7);
imshow(lena4)
subplot(4,2,8);
imhist(lena4,256);

%1.3
hist1 = imread('hist1.bmp');
figure(2);
subplot(1,2,1)
imshow(hist1)
%1.4
ahis1 = imadjust(hist1);
subplot(1,2,2);
imshow(ahis1);

%1.8
[H,x] = imhist(hist1);

tmpC = cumsum(H);
k = max(tmpC)/max(H);
C = tmpC/k;
figure(3);
plot(x,H);
hold on;
plot(x,C);

%1.9

lut = uint8(255*(C/max(C)));
lut2 = intlut(hist1,lut);
[Hl,xl] = imhist(lut2, 256);
tC = cumsum(Hl);
k = max(tC)/ max(Hl);
Cl = tC / k;

figure(4);
subplot(2,1,1)
imshow(lut2)
subplot(2,1,2)
plot(xl,Hl);
hold on;
plot(xl,Cl);

%1.14
hist2 = imread('hist2.bmp');
hist3 = imread('hist3.bmp');
hist4 = imread('hist4.bmp');


figure(5);
subplot(4,1,1);
imhist(hist2)
%imshow(hist2)
subplot(4,1,2);
imhist(imadjust(hist2))
%imshow(imadjust(hist2))
subplot(4,1,3);
imhist(histeq(hist2))
%histeq(hist2)
subplot(4,1,4)
%imshow(adapthisteq(hist2))
imhist(adapthisteq(hist2))


figure(6);
subplot(4,1,1);
%imshow(hist3)
imhist(hist3)
subplot(4,1,2);
imhist(imadjust(hist3))
%imshow(imadjust(hist3))
subplot(4,1,3);
imhist(histeq(hist3))
%histeq(hist3)
subplot(4,1,4)
%imshow(adapthisteq(hist3))
imhist(adapthisteq(hist3))


figure(7);
subplot(4,1,1);
imhist(hist4)
%imshow(hist4)
subplot(4,1,2);
imhist(imadjust(hist4))
%imshow(imadjust(hist4))
subplot(4,1,3);
imhist(histeq(hist4))
%histeq(hist4)
subplot(4,1,4)
imhist(adapthisteq(hist4))
%imshow(adapthisteq(hist4))








