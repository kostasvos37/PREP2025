folderPath = 'rfMRI_timeseries 10 subj'; 
filePattern = fullfile(folderPath, '*.csv'); 
fileList = dir(filePattern); 
numSubjects = length(fileList);
allData = []; 

filepath = fullfile(folderPath, fileList(1).name);
firstMatrix = readmatrix(filepath)';
[x, y] = size(firstMatrix);

allData = zeros(numSubjects, x, y);

for i = 1:numSubjects
    filepath = fullfile(folderPath, fileList(i).name);
    
    m = readmatrix(filepath)';
    
    [currentX, currentY] = size(m);
    if currentX ~= x || currentY ~= y
        error('File %d (%s) has inconsistent dimensions: %dx%d', ...
              i, fileList(i).name, currentX, currentY);
    end
    
    allData(i, :, :) = m;
end

fs = 0.72;