fileID = fopen('rgd_cropped320/rgb_0000_annotationsCropped320.txt','r');
sizeA = [2 inf];
A = fscanf(fileID, '%f %f', sizeA)
imread('rgd_cropped320/rgd_0000Cropped320.png');

figure;
imshow(ans);
hold on;
[row col] = size(A);

for idx = 1:4:col
    x = A(1, [idx:idx+3 idx]);
    y = A(2, [idx:idx+3 idx]);
    plot(x,y);
    hold on
end
fclose(fileID);
