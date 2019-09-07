DATA_DIR = './dataset'
listFolder = dir(DATA_DIR);
close all
figure;
% 11 folders, each with 1000 subfolders
for idxFolder = 3:length(listFolder)
   nameFolder = listFolder(idxFolder).name;
   fprintf(['processing.. ' nameFolder '\n']); 
   
   listRGB = dir(fullfile(DATA_DIR, nameFolder,'*.png'));
   for idxImg = 1:length(listRGB)
       nameImg = listRGB(idxImg).name;
       nameTxt = strrep(nameImg, 'r.png', 'cpos.txt');
       
       fileID = fopen(fullfile(DATA_DIR, nameFolder, nameTxt),'r');
       sizeA = [2 inf];
       A = fscanf(fileID, '%f %f', sizeA)
       
       img = imread(fullfile(DATA_DIR, nameFolder, nameImg));
        
       imshow(img);
       hold on;
       [row col] = size(A);
       for idx = 1:4:col

           
           x = A(1, [idx idx+1]);
           y = A(2, [idx idx+1]);
           plot(x,y, 'LineWidth', 1, 'Color', 'white');
           hold on
           x = A(1, [idx+1 idx+2]);
           y = A(2, [idx+1 idx+2]);
           plot(x,y, 'LineWidth', 2, 'Color', 'red');
           hold on
           
           x = A(1, [idx+2 idx+3]);
           y = A(2, [idx+2 idx+3]);
           plot(x,y, 'LineWidth', 1, 'Color', 'white');
           hold on
           
           x = A(1, [idx+3 idx]);
           y = A(2, [idx+3 idx]);
           plot(x,y, 'LineWidth', 2, 'Color', 'red');
           hold on
           
       end
       fclose(fileID);
       pause
   end        
end






