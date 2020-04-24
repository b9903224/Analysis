function columnHeaderAry = getColumnHeaderAry(searchSubTable, searchString)

index = find(~cellfun(@isempty, strfind(searchSubTable, searchString)), 1, 'first');
columnHeaderString = searchSubTable{index};
columnHeaderString = strrep(columnHeaderString, searchString, '');
columnHeaderString = strrep(columnHeaderString, ';', '');
columnHeaderString = strtrim(columnHeaderString);

%%
columnHeaderAry = strsplit(columnHeaderString, ' ');
columnHeaderString = strrep(columnHeaderString, '/', '_');

end