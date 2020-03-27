clearvars; clc; close all;


i1 =imread("kolo.bmp");
i2 =imread("kwadrat.bmp");
i3 = imread("kwadrat45.bmp");
i4 = imread("trojkat.bmp");
i5 = imread("dwieFale.bmp");

image = i5;

fft = fft2(image);
shifted = fftshift(fft);
amplitude = log10(abs(shifted)+1);
phase = angle(shifted.*(amplitude > 0.0001));


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