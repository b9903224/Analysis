function dataTableRowAry = getDataTableRowAry(dataTableRowStirng, columnHeaderAry_len)

dataTableRowAry = cell(1, columnHeaderAry_len);

%%
fieldString = '';
count = 0;
for i = 1 : numel(dataTableRowString)
    dataTableRowString_single = dataTableRowString(i);
    
    fieldString = [fieldString, dataTableRowString_single];
    fieldString_trim = strtrim(fieldString);
    if isempty(fieldSTring_trime)
        fieldSTring = '';
        continue
    end
    if strcmp(dataTableRowString_single, ' ') && ~strcmp(fieldString(1), '"') ||...
            (strcmp(fieldString(1), '"') && numel(fieldString) > 2 && strcmp(fieldString(end - 1), '"'))
        count = count + 1;
        fieldString = strtrim(fieldString);
        dataTableRowAry{count} = fieldString;
        fieldString = '';
    end
    
    if i == numel(dataTableRowString) && count < columnHeaderAry_len
        count = count + 1;
        fieldString = strtrim(fieldString);
        dataTableRowAry{count} = fieldString;
        fieldString = '';
    end
    
end
% disp(numel(dataTableRowAry))
end







































