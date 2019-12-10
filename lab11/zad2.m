clc; close all;clearvars;

image = imread('ccl2.png');

image4 = bwlabel(image, 4);
image8 = bwlabel(image, 8);

figure;
imshow(image)

figure;
subplot(1,3,1);
imshow(image,[]);
title("oryginal");
subplot(1,3,2);
imshow(image4);
title('4 sasiadow');
subplot(1,3,3);
imshow(image8);
title('8 sasiadow');