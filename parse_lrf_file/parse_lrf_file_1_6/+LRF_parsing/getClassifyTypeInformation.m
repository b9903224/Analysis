function ClassifyTypeInformation = getClassifyTypeInformation(table, isX8)

ClassifyTypeInformation = struct;

%%
if isX8
    searchString = '[ClassifyTypeInformation]';
else
    searchString = '[ClassificationType]';
end
searchSubTable = LRF_parsing.getSearchSubTable(searchString, table);

%%
if isX8
    searchString = 'classifyTypeColumn';
else
    searchString = 'classificationColumn';
end
columnHeaderAry = LRF_parsing.getColumnHeaderAry(searchSubTable, searchString);


%%
if isX8
    searchString = 'DefectType ';
else
    searchString = 'ClassInfo';
end
[DefectTypeTable, DefectTypeTable_len] = LRF_parsing.getDataTable(searchSubTable, searchString, columnHeaderAry);

%%
if isX8
    defectCdMapping = getDefectCdMapping(DefectTypeTable, DefectTypeTable_len);
else
    defectCdMapping = getDefectCdMapping_X7(DefectTypeTable, DefectTypeTable_len);
end

%%
ClassifyTypeInformation.columnHeaderAry = columnHeaderAry;
ClassifyTypeInformation.DefectTypeTable = DefectTypeTable;
ClassifyTypeInformation.DefectTypeTable_len = DefectTypeTable_len;
ClassifyTypeInformation.defectCdMapping = defectCdMapping;

end

%%
function defectCdMapping = getDefectCdMapping_X7(DefectTypeTable, DefectTypeTable_len)

defectCdMapping = cell(DefectTypeTable_len, 2);
for i = 1 : DefectTypeTable_len
    defectTypeID = i - 1;
    defectTypeName = DefectTypeTable(i).TypeName;
    defectCdMapping{i, 1} = defectTypeID;
    defectCdMapping{i, 2} = defectTypeName;
end

end

%%
function defectCdMapping = getDefectCdMapping(DefectTypeTable, DefectTypeTable_len)

defectCdMapping = cell(DefectTypeTable_len, 2);
for i = 1 : numel(DefectTypeTable)
    defectTypeID = str2double(DefectTypeTable(i).DefectTypeID);
    defectTypeName = DefectTypeTable(i).DefectTypeName;
    defectCdMapping{i, 1} = defectTypeID;
    defectCdMapping{i, 2} = defectTypeName;
end

end

















































