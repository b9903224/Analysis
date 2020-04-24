function removeInvalidData(srcPath, destPath)

mkdir(destPath)
imgFolder = 'Images';

%%
inspCount = 0;
dayFolderAry = Utility.getFolderAryByPath(srcPath); % 01,02,...,31
dayFolderAryLen = numel(dayFolderAry);
for dayaIndex = 1 : dayFolderAryLen
    dayFolder = dayFolderAry{dayIndex};
    dayPath = fullfile(srcPath, dayFolder);
    inspFolderAry = Utility.getFolderAryByPath(dayPath); % TMxxxx,...
    inspFolderAryLen = numel(inspFolderAry);
    for inspIndex = 1 : inspFolderAryLen
        inspFolder = inspFolderAry{inspIndex};
        inspPath = fullfile(srcPath, dayFolder, inspFolder);
        inspPath_dest = fullfile(destPath, dayFolder, inspFolder);
        mkdir(inspPath_dest)
        imgPath = fullfile(inspPath, imgFolder);
        imgPath_dest = fullfile(inspPath_dest, imgFolder);
        movefile(imgPath, imgPath_dest)
        lrfPath = fullfile(srcPath, dayFolder, sprintf('%s.lrf', inspFolder));
        lrfPath_dest = fullfile(destPath, dayFolder, sprintf('%s.lrf', inspFolder));
        movefile(lrfPath, lrfPath_dest)
        inspCount = inspCount + 1;
    end
end

sprintf('removeInvalidData done, inspCount: %g\n', inspCount)

end








































