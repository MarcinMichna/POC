close all; clc; clearvars;

load MR_data.mat;
localWindow = [4 4];


images = {I_noisefree, I_noisy1, I_noisy2, I_noisy3, I_noisy4};


img1 = convolution(images{1}, localWindow);
img2 = convolution(images{2}, localWindow);
img3 = convolution(images{3}, localWindow);
img4 = convolution(images{4}, localWindow);
img5 = convolution(images{5}, localWindow);


i1 = bilateral(images{1}, localWindow);
i2 = bilateral(images{2}, localWindow);
i3 = bilateral(images{3}, localWindow);
i4 = bilateral(images{4}, localWindow);
i5 = bilateral(images{5}, localWindow);

figure;
subplot(3,1,1)
imshow(uint8(images{1}),[])
subplot(3,1,2)
imshow(uint8(img1),[]);
subplot(3,1,3)
imshow(uint8(i1),[]);

figure;
subplot(3,1,1)
imshow(uint8(images{2}),[])
subplot(3,1,2)
imshow(uint8(img2),[]);
subplot(3,1,3)
imshow(uint8(i2),[]);

figure;
subplot(3,1,1)
imshow(uint8(images{3}),[])
subplot(3,1,2)
imshow(uint8(img3),[]);
subplot(3,1,3)
imshow(uint8(i3),[]);

figure;
subplot(3,1,1)
imshow(uint8(images{4}),[])
subplot(3,1,2)
imshow(uint8(img4),[]);
subplot(3,1,3)
imshow(uint8(i4),[]);

figure;
subplot(3,1,1)
imshow(uint8(images{5}),[])
subplot(3,1,2)
imshow(uint8(img5),[]);
subplot(3,1,3)
imshow(uint8(i5),[]);
