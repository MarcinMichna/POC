function LUT(obraz,przekodowanie)
    subplot(1,3,1);
    plot(przekodowanie);
    title(inputname(2));
    subplot(1,3,2);
    imshow(obraz);
    title("Oryginal");
    subplot(1,3,3);
    imshow(intlut(obraz,przekodowanie));
    title("Przekodowany");
end

