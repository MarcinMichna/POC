clc; close all;clearvars;

image = imread("shapes.png");


labeled = bwlabel(image, 4);
coeffs = obliczWspolczynniki(labeled);


figure;
subplot(1,2,1)
imshow(image,[])
title("oryginal")
subplot(1,2,2)
imshow(labeled)
title("labeled")

r = regionprops(labeled, 'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1), r(i).Centroid(2), ['\color{magenta}', num2str(i)]);
end


[h, w] = size(labeled);

for y=1:h
    for x=1:w
        pixel = labeled(y,x);
        if (pixel ~= 0 && ~(coeffs(pixel, 2) > 0.33 && coeffs(pixel, 2) < 0.66))
            labeled(y,x) = 0;
        end
    end
end

figure;
imshow(labeled);
title("final result")
r = regionprops(labeled, 'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1), r(i).Centroid(2), ['\color{magenta}', num2str(i)]);
end
%% part2

image = imread('shapesReal.png');

figure;
subplot(2,2,1)
imshow(image);
title("oryginal")
subplot(2,2,2)
image = im2bw(image, 60/255);
imshow(image)
title("binarized")
subplot(2,2,3)
image = imerode(image, strel('rectangle', [3, 3]));
image = not(image);
image = imclearborder(image);
imshow(image)
title("cleared borders")
subplot(2,2,4)
labeled = bwlabel(image, 4);
coeffs = obliczWspolczynniki(labeled);
imshow(labeled);
title("labeled");
r = regionprops(labeled, 'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1), r(i).Centroid(2), ['\color{magenta}', num2str(i)]);
end

[h, w] = size(labeled);
for y=1:h
    for x=1:w
        pixel = labeled(y,x); % obliczanie srodka ciezkosci
        if (pixel ~= 0 && ~(coeffs(pixel,2) > 0.6 && coeffs(pixel,2) < 0.68 && coeffs(pixel, 3) > 4.5))
            labeled(y,x) = 0;
        end
    end
end

figure;
imshow(labeled);
title("final result")
r = regionprops(labeled, 'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1), r(i).Centroid(2), ['\color{magenta}', num2str(i)]);
end




