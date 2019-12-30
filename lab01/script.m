
%%info o plikach
%imfinfo("lena.jpg")
%imfinfo("lena.bmp")

%%wczytanie i wyswietlanie
imread("lena.bmp")
imshow("lena.bmp")

%%RGB
RGB = imread("lena.bmp");
newmap = rgb2gray(RGB);


imshow(newmap);
imwrite(newmap, "lena_gray.bmp");

colormap gray;
figure(4);
colormap gray;
mesh(newmap)

figure(5)
plot(newmap(10,:));

figure(6);
plot(newmap(:,4));

newmap1 = imread("lena_gray.bmp");
imshow(newmap1)
figure(2);
[newmap2,cmap] = gray2ind(newmap1, 256);
imshow(newmap2,cmap);

figure(3);
map = colormap;
imshow(newmap2,map);