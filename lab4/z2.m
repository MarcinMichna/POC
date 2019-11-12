clearvars; clc; close all;

phobos = imread('phobos.bmp');

subplot(1,2,1)
imshow(phobos)
subplot(1,2,2)
imshow(histeq(phobos))

load histogramZadany;

image = histeq(phobos,histogramZadany);
figure(2)
bar(histogramZadany)

figure(3)
subplot(1,2,1)
imshow(image)
subplot(1,2,2)
imhist(image)

figure(4)
subplot(1,3,1);
imshow(phobos)
subplot(1,3,2)
imshow(imadjust(phobos))
subplot(1,3,3)
imshow(adapthisteq(phobos))
