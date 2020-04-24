function folderNameAry = getFolderAryByPath(path)

folderAry = dir(path);
folderAry = folderAry(~ismember({folderAry.name}, {'.', '..'}));
isdirAry = cat(1, folderAry.isdir);
folderAry = folderAry(isdirAry);

%%
folderNameAry = cell(numel(folderAry), 1);
for i = 1 : numel(folderAry)
    folderNameAry{i} = folderAry(i).name;
end
% folderNameAry = cat(1, folderAry.name);

end