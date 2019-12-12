clc; close all;clearvars;

image = imread("ccl1.png");

figure;
imshow(image)
title("oryginal image");

[YY, XX] = size(image);
L = 1;

N = 100;
id = 1:N;

lut = zeros(N);


for y = 2:(YY-1)
    for x = 2:(XX-1)
        if image(y,x) == 255
            sasiedzi = [image(y-1,x-1), image(y-1,x), image(y-1, x+1), image(y, x-1)];
            suma = sum(sasiedzi); 
            if suma == 0
                image(y,x) = L;
                L = L+1;
            elseif suma > 0
                nonzero = nonzeros(sasiedzi);
                    min_ = min(nonzero);
                    max_ = max(nonzero);
                    if min_ == max_
                        image(y, x) = min_;
                    else
                        image(y, x) = min_;
                        najmniejsiSasiedzi = nonzero(nonzero~=min_);
                        najmniejszySasiad = min(najmniejsiSasiedzi);

                        id = union(min_, najmniejszySasiad, id);
                    end
            end
        end
    end
end

image1 = image;

for i = 1:N
    lut(i) = myroot(i, id);
end

for y = 2:(YY-1)
    for x = 2:(XX-1)
        if (image(y,x) > 0)
            image(y,x) = lut(image1(y,x));
        end
    end
end

figure;
imshow(label2rgb(image1))
title("final result before lut")

figure;
imshow(imread("ccl1Result.png"))
title("Reference result")

figure;
imshow(label2rgb(image))
title("final result after lut")

