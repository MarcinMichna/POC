clearvars;clc;close all;

lab112 = imread('lab112.png');

image = im2bw(lab112, 37/255);

square = strel('square', 5);
image = imclose(image, square);

%iedges = edge(image, 'sobel');
iedges = edge(image, 'canny');
imshow(iedges)

image = not(image);
image = imclearborder(image);
image = not(image);


[H, T, R] = hough(iedges);
figure;
imshow(H, []);
P = houghpeaks(H, 8);
hold on;
plot(P, 'o');

lines = houghlines(iedges, T, R, P, 'FillGap', 5, 'MinLength', 7);
figure, imshow(lab112), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
