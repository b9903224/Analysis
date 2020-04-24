%%
clear
warning('off', 'all');
close all
format compact

%%
parentPath = cd(cd('..'));
fileName = 'x800';








fileName = [fileName, '.lrf'];

%%
lrf_filePos = fullfile(parentPath, fileName);
tic
lrfDataStruct = LRF_parsing.getLRFinformation(lrf_filePos);
toc

lrfDataStruct;

defectIndex = 1;
lrfData = LRF_parsing.getLrfData(lrfDataStruct, defectIndex);

lrfData

defectId = 3;
lrfData2 = LRF_parsing.getLrfDataByDefectId(lrfDataStruct, defectId);
fprintf('defectId: %g, defectNo: %s\n', defectId, lrfData2.DefectData.No)

%%
checkGetLrfDataByDefectId(lrfDataStruct)



























































