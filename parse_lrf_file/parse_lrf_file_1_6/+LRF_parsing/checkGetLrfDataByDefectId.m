function outputString = getByString(searchString, table)

outputString = [];

%%
stringIndex = find(~cellfun(@isempty, strfind(table, searchString)), 1, 'first');

if ~isempty(stringIndex)
    temp = table{stringIndex};
    temp = strtrim(temp);
    if numel(strfind(temp, '"')) == 2
        %
        index1 = find(temp == '"', 1, 'first');
        index2 = find(temp == '"', 1, 'last');
        outputString = temp(index1 + 1 : index2 - 1);
    else
        temCell = strsplit(temp, ' ');
        if numel(tempCell) == 2
            outputString = tempCell{2};
            if strcmp(outputString(end), ';')
                outputString = outputString(1 : end - 1);
            end
        end
    end
end

end
















