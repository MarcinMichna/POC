clc; close all;clearvars;

image = imread("ccl1.png");

figure;
imshow(image)
title("oryginal image");

[YY, XX] = size(image);

for y = 2:(YY-1)
   for x = 2:(XX-1)
       if image(y,x) ~= 0
		   sasiedzi = [image(y-1,x-1), image(y-1,x), image(y-1, x), image(y, x-1)];
           suma = sum(sasiedzi); 
       end
   end
end