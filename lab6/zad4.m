clc; clearvars; close all;

load('maskiPP.mat');

kw = imread('jet.bmp');

c = uint8(conv2(kw, R1, 'same'));

figure;
subplot(2,2,1);
imshow(c + 128,[]);

subplot(2,2,2);
imshow(abs(c),[]);

subplot(2,2,3);
imshow(kw + c + 128,[]);

subplot(2,2,4);
imshow(kw + abs(c),[]);

c = uint8(conv2(kw, R2, 'same'));
figure;
subplot(2,2,1);
imshow(c + 128,[]);

subplot(2,2,2);
imshow(abs(c),[]);

subplot(2,2,3);
imshow(kw + c + 128,[]);

subplot(2,2,4);
imshow(kw + abs(c),[]);

c = uint8(conv2(kw, P1, 'same'));
figure;
subplot(2,2,1);
imshow(c + 128,[]);

subplot(2,2,2);
imshow(abs(c),[]);

subplot(2,2,3);
imshow(kw + c + 128,[]);

subplot(2,2,4);
imshow(kw + abs(c),[]);

c = uint8(conv2(kw, P2, 'same'));
figure;
subplot(2,2,1);
imshow(c + 128,[]);

subplot(2,2,2);
imshow(abs(c),[]);

subplot(2,2,3);
imshow(kw + c + 128,[]);

subplot(2,2,4);
imshow(kw + abs(c),[]);

c = uint8(conv2(kw, S1, 'same'));
figure;
subplot(2,2,1);
imshow(c + 128,[]);

subplot(2,2,2);
imshow(abs(c),[]);

subplot(2,2,3);
imshow(kw + c + 128,[]);

subplot(2,2,4);
imshow(kw + abs(c),[]);

c = uint8(conv2(kw, S2, 'same'));
figure;
subplot(2,2,1);
imshow(c + 128,[]);

subplot(2,2,2);
imshow(abs(c),[]);

subplot(2,2,3);
imshow(kw + c + 128,[]);

subplot(2,2,4);
imshow(kw + abs(c),[]);

%4.4-5
OW = sqrt((conv2(kw, S1, 'same')).^2 + (conv2(kw, S2, 'same')).^2);

OW2 = abs((conv2(kw, S1, 'same')).^2) + abs((conv2(kw, S2, 'same')).^2);

figure;
subplot(1,3,1)
imshow(kw);
subplot(1,3,2)
imshow(OW,[]);
subplot(1,3,3)
imshow(OW2,[]);