function checkGetLrfDataByDefectId(lrfDataStruct)

DefectDataNoAry = lrfDataStruct.DefectList.DefectDataNoAry;
DefectDataNoAryLen = numel(DefectDataNoAry);

%%
for index = 1 : DefectDataNoAryLen
    defectId = DefectDataNoAry(index);
    lrfData = LRF_parsing.getLrfDataByDefectId(lrfDataStruct, defectId);
    fprintf('defectId: %g, defectNo: %s\n', defectId, lrfData.DefectData.No)
end

end