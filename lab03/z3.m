clearvars; close all; clc;

kolo = imread("kolo.bmp");
kwadrat = imread("kwadrat.bmp");

kolo = boolean(kolo);
kwadrat = boolean(kwadrat);

imshow(kolo);
figure(2);
imshow(kwadrat);

not_kolo = ~kolo;
not_kwadrat = ~kwadrat;

figure(3);
imshow(not_kolo)
title("not kolo")

figure(4);
imshow(not_kwadrat);
title("not kwadrat")

figure(5);
imshow(kwadrat&kolo)
title("and")


figure(6);
imshow(kwadrat|kolo)
title("or")

figure(7)
imshow(xor(kwadrat,kolo))
title("xor")