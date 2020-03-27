clearvars; clc; close all;

image =imread("lena.bmp");

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

%%%%%%%%%

[f1, f2] = freqspace(512, 'meshgrid');
Hd = ones(512);
r = sqrt(f1.^2 + f2.^2);
Hd(r>0.1) = 0;


figure;
colormap(jet(64));
mesh(f1, f2, Hd);

%%%%%%%%%%

f = shifted .* Hd;
f = ifftshift(f);
f = ifft2(f);

figure;
imshow(uint8(f));


%%%%%%%%%%


%chebwin
figure;
h = fwind1(Hd, chebwin(21));
[H, f1, f2] = freqz2(h, 512, 512);
mesh(f1, f2, H);



%%%%%%%%%%

[x, y] = size(image);
mask = fspecial('gaussian', x, 10);
mask = mat2gray(mask);

figure;
imshow(mask);
title("gaussian mask")

f = fft2(image);
shifted = fftshift(f);
filtered3 = shifted .* mask;
filtered3 = ifft2(ifftshift(filtered3));

figure;
imshow(uint8(filtered3));






