function imgFilePath = getImgFilePath(dataPath, dataVer)

index_1 = find(dataVer == '(', 1);

%%
if isempty(index_1)
    imgFilePath = fullfile(dataPath, dataVer);
    return
end

dataFolder = dataVer(1 : index_1 - 1);
imgFilePath = fullfile(dataPath, dataFolder);

end