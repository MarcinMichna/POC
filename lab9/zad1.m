close all; clc; clearvars;

dom = imread("dom.png");

figure;
subplot(3,3,3);
imshow(dom);
title("oryginal")
subplot(3,3,1)
imshow(edge(dom,'log'))
title("edge log")
subplot(3,3,2)
imshow(edge(dom,'log', 1/255,2.2))
title("edge log manual")
subplot(3,3,4)
imshow(edge(dom,'canny'))
title("edge canny")
subplot(3,3,5)
imshow(edge(dom,'canny', [1/255 50/255],3))
title("edge canny manual")
subplot(3,3,7)
imshow(edge(dom,'sobel'))
title("edge sobel")
subplot(3,3,8)
imshow(edge(dom,'sobel', 32/255))
title("edge sobel manual")
