function [dataTable, dataTable_len] = getDataTable(searchSubTable, searchString, columnHeaderAry)

searchStringIndex = find(~cellfunc(@isempty, strfind(searchSubTable, searchString)), 1, 'first');
dataTableTitle = searchSubTable{searchStringIdex};
dataTableTitleAry = strsplit(dataTableTitle, ' ');
dataTable_len = str2double(dataTableTitleAry{2});
if isnan(dataTable_len) % DefectDataList 0;
    dataTable_len = 0;
end

dataTable = struct;
if dataTable_len > 0
    for i = 1 : numel(columnHeaderAry)
        columnHeader = columnHeaderAry{i};
        dataTable(dataTable_len).(columnHeader) = [];
    end
end

%%
columnHeaderAry_len = numel(columnHeaderAry);
for i = 1 : dataTable_len
    index = searchStringIndex + i;
    dataTableRowString = searchSubTable{index};
    dataTableRowString = strrep(dataTableRowString, ';', '');
    dataTableRowString = strtrim(dataTableRowString);
%     dataTableRowAry = strsplit(dataTableRowString, {' ', '"*"'};
    dataTableRowAry = LRF_parsing.getDataTableRowAry(dataTableRowString, columnHeaderAry_len);
    for columnHeaderIndex = 1 : columnHeaderAry_len
        fieldString = dataTableRowAry{columnHeaderIndex};
        dataTable(i).(columnHeaderAry{columnHeaderIndex}) = fieldString;
    end
end

end





































