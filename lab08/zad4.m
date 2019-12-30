close all; clearvars; clc;


%% 4.2
calculator = imread('calculator.bmp');

SE1 = ones(1, 71);
marker = imerode(calculator, SE1);
rec = imreconstruct(marker, calculator);

img1 = calculator - rec;

rec2 = imopen(calculator, SE1);
img2 = calculator - rec2;

img3 = imtophat(calculator, SE1);

% 2.5
SE2 = ones(1,11);
vertImg = imerode(img1, SE2);
res1 = imreconstruct(vertImg, img1);

%2.6
SE3 = ones(1, 21);
marker2 = imdilate(res1, SE3);
res2 = imreconstruct(min(marker2, img1), img1);


figure;
subplot(2,3,1);
imshow(calculator);
title('original');
subplot(2,3,2);
imshow(img1);
title('morphological reconstruion');
subplot(2,3,3);
imshow(img2);
title("opened ones(1, 71)");
subplot(2,3,4);
imshow(img3);
title("tophat");
subplot(2,3,5);
imshow(res1);
title("result vertical");
subplot(2,3,6);
imshow(res2);
title("result final");




