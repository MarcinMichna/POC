clearvars; clc; close all;

image = imread("dwieFale.bmp");

fft = fft2(image);
shifted = fftshift(fft);
amplitude = log10(abs(shifted)+1);
phase = angle(shifted.*(amplitude < 0.0001));


figure;
subplot(1,3,1)
imshow(image)
title("oryginal")
subplot(1,3,2)
imshow(amplitude,[])
title("amplitude")
subplot(1,3,3)
imshow(phase,[])
title("phase")