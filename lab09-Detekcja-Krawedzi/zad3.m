clearvars;clc;close all;

kw = imread('kwadraty.png');
kwedges = edge(kw, 'sobel');
[H, T, R] = hough(kwedges);

figure;
subplot(1,2,1)
imshow(kw)
title("oryginal")
subplot(1,2,2)
imshow(kwedges)
title("edges")


figure;
imshow(H, []);
peaks = houghpeaks(H, 8);
hold on;
plot(peaks, 'o');

lines = houghlines(kwedges, T, R, peaks, 'FillGap', 5, 'MinLength', 7);
figure, imshow(kwedges), hold on
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
