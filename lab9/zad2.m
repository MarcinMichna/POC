clearvars;clc;close all;

image = zeros(11);
image(3,3) = 1;

hough1 = hough(image,'RhoResolution',0.1,'ThetaResolution',0.5);

figure;
subplot(1,2,1);
imshow(image); 
title('original');
subplot(1,2,2);
imshow(hough1, []);
title('hough1');


image(7,9) = 1;
hough2 = hough(image,'RhoResolution',0.1,'ThetaResolution',0.5);

figure;
subplot(1,2,1);
imshow(image); 
title('original');
subplot(1,2,2);
imshow(hough2, []);
title('hough2');


image(2,6) = 1;
image(8,10) = 1;
hough4 = hough(image,'RhoResolution',0.1,'ThetaResolution',0.5);

figure;
subplot(1,2,1);
imshow(image); 
title('original');
subplot(1,2,2);
imshow(hough4, []);
title('hough4');

[H, T, R] = hough(image,'RhoResolution',0.1,'ThetaResolution',0.5);
figure;
imshow(H, []);

theta = 72;
rho = 138;

t = T(theta);
r = R(rho);

x = 0:0.1:10;
y = (r - x * cosd(t) / sind(t));
figure;
imshow(image, []); 
hold on;
plot(x+1,y+1);
