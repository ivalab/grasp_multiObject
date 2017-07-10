
imgDataDir = ['rgbd'];
imgDataOutDir = ['rgd'];

imgFiles = dir([imgDataDir '/rgb*']);
imgDepthFiles = dir([imgDataDir '/depth*']);


for idx = 1:length(imgFiles) 
    display(['processing imgFiles ' int2str(idx)])
    
    % read rgb
    imgName = imgFiles(idx).name;
    [pathstr,imgname] = fileparts(imgName);
    rgb = imread([imgDataDir '/' imgname '.jpg']);
    
    % read depth
    imgDepthName = imgDepthFiles(idx).name;
    [pathstr,imgdepthname] = fileparts(imgDepthName);
    depth = imread([imgDataDir '/' imgdepthname '.png']);
    
    % re-ragne to 0~225
    depth = (double(depth)-500)/(1200-500)*255;
    depthImgUint = uint8(depth);
    
    % insert depth to th 3rd channel
    rgb(:,:,3) = depthImgUint;
    
    % saving rgd
    imwrite(rgb, [imgDataOutDir '/rgd' imgname(end-4:end) '.png']);  
end
