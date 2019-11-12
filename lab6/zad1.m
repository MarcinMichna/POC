clear; clc; close all;

plansza = imread('plansza.bmp');

aFilt = fspecial('average');

%1.4
plansza8 = uint8(conv2(plansza,aFilt,'same'));

figure(1);
subplot(2,2,1)
imshow(plansza)
title("orygiał")

subplot(2,2,2)
imshow(plansza8,[])
title("average")

subplot(2,2,3)
imshow(imabsdiff(plansza,plansza8))
title("moduł z różnicy")

%1.6
figure(2)
f5 = fspecial('average',5);
f9 = fspecial('average',9);
f15 = fspecial('average',15);
f35 = fspecial('average',35);


subplot(3,2,1)
imshow(plansza)
title("oryginał")

subplot(3,2,2)
imshow(uint8(conv2(plansza,aFilt,'same')))
title("3")

subplot(3,2,3)
imshow(uint8(conv2(plansza,f5,'same')))
title("5")

subplot(3,2,4)
imshow(uint8(conv2(plansza,f9,'same')))
title("9")

subplot(3,2,5)
imshow(uint8(conv2(plansza,f15,'same')))
title("15")

subplot(3,2,6)
imshow(uint8(conv2(plansza,f35,'same')))
title("35")



%1.7
lena = imread('lena.bmp');
M = [1 2 1; 2 4 2; 1 2 1];
M = M/sum(M);

plansza123 = uint8(conv2(plansza,M,'same'));

figure(3)
subplot(2,2,1)
imshow(plansza)
title("orygiał")

subplot(2,2,2)
imshow(plansza123,[])
title("average")

subplot(2,2,3)
imshow(imabsdiff(plansza,plansza123))
title("moduł z różnicy")

%1.9
gaussian = fspecial('gaussian', [5 5], 0.5);

figure(4)
subplot(2,2,1)
mesh(fspecial('gaussian', [5 5], 0.5))
title("0.5")

subplot(2,2,2)
mesh(fspecial('gaussian', [5 5], 1))
title("1")

subplot(2,2,3)
mesh(fspecial('gaussian', [5 5], 3))
title("3")

subplot(2,2,4)
mesh(fspecial('gaussian', [5 5], 50))
title("50")




