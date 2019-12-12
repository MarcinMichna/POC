clc; close all;clearvars;

image = imread('ccl2.png');

image4 = bwlabel(image, 4);
image8 = bwlabel(image, 8);


figure;
subplot(1,3,1);
imshow(image,[]);
title("oryginal");
subplot(1,3,2);
imshow(image4);
r = regionprops(image4, 'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1), r(i).Centroid(2), ['\color{magenta}', num2str(i)]);
end
title('4 sasiadow');
subplot(1,3,3);
imshow(image8);
r = regionprops(image8, 'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1), r(i).Centroid(2), ['\color{magenta}', num2str(i)]);
end
title('8 sasiadow');