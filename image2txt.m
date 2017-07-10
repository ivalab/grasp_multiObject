%% script to read a folder of images, and parse all imag file names into a single txt
%

%% read original image, crop it and save it in another folder
imgDataDir = 'rgd';
imgDataOutDir = 'rgd_cropped320';
imgRGBDataDir = 'rgbd';
imgRGBDataOutDir = 'rgb_cropped320';
imgFiles = dir([imgDataDir '/*.png']);
imgRGBFiles = dir([imgRGBDataDir '/rgb*']);

fileID_imgList = fopen([imgDataOutDir '/'  'testfull.txt'],'w');

for idx = 1:length(imgFiles) 
    display(['processing imgFiles ' int2str(idx)])
    imgName = imgFiles(idx).name;
    [pathstr,name] = fileparts(imgName);

    img = imread([imgDataDir '/' name '.png']);
    %imgCrop = imcrop(img, [207 127 226 226]);
    imgCrop = imcrop(img, [161 81 320 320]);
    imgResize = imresize(imgCrop, [227 227]);
    imwrite(imgResize, [imgDataOutDir '/' name 'Cropped320.png']);  
    
    fprintf(fileID_imgList, '%s\n',[imgDataOutDir '/' name 'Cropped320.png']);
end


for idx = 1:length(imgRGBFiles) 
    display(['processing imgFiles ' int2str(idx)])
    imgName = imgRGBFiles(idx).name;
    [pathstr,name] = fileparts(imgName);

    img = imread([imgRGBDataDir '/' name '.jpg']);
    %imgCrop = imcrop(img, [207 127 226 226]);
    imgCrop = imcrop(img, [161 81 320 320]);
    imgResize = imresize(imgCrop, [227 227]);
    imwrite(imgResize, [imgRGBDataOutDir '/' name 'Cropped320.png']);  
end

%% read original grasp, according the cropping image, transform and save them in another folder
txtDataDir = './annotations';
txtDataOutDir = './rgd_cropped320';
txtFiles = dir([txtDataDir '/*.txt']);

for idx = 1:length(txtFiles) 
    display(['processing txtFiles ' int2str(idx)])
    txtName = txtFiles(idx).name;
    [pathstr,name] = fileparts(txtName);
    
    fileID = fopen([txtDataDir '/' name '.txt'],'r');
    sizeA = [2 inf];
    A = fscanf(fileID, '%f %f', sizeA);
    fclose(fileID);
    
    name(3)='d';
    fileID = fopen([imgDataOutDir '/' name 'Cropped320.txt'],'w');
    %A = A - repmat([207 ;127 ],1, size(A,2));
    A = (A - repmat([161 ;81 ],1, size(A,2)))*227/320;
    fprintf(fileID, '%f %f\n',A);
    fclose(fileID);
end



