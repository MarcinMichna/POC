clearvars; clc; close all;


image =imread("lunar.bmp");

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

%%%%%%%%%%

th = 10;
imgfft2 = fft2(image);
fft2abs = log10(abs(imgfft2)+1);
imgfft2(fft2abs > th) = 0;

unshifted = ifftshift(imgfft2);
unfourier = ifft2(unshifted);


figure;
subplot(1,2,1);
imshow(image);
title('original');
subplot(1,2,2);
imshow(uint8(unfourier));
title('undone');

