function AreaInfomation = getAreaInfomation(table, isX8)

AreaInfomation = struct;

%%
searchString = '[AreaInfomation]';
searchSubTable = LRF_parsing.getSearchSubTable(searchString, table);

%%
Area01_Block_HorzScanDieCount = '';
Area01_Block_VertScanDieCount = '';

if isX8
    searchString = 'Area01.Block.HorzScanDieCount';
    Area01_Block_HorzScanDieCount = str2double(LRF_Parsing.getByString(searchString, searchSubTable));
    
    searchString = 'Area01.Block.VertScanDieCount';
    Area01_Block_VertScanDieCount = str2double(LRF_Parsing.getByString(searchString, searchSubTable));
end

%%
if isX8
    searchString = 'Area01.Block.SliceName';
    Area01_Block_SliceName = LRF_parsing.getByString(searchString, searchSubTable);
else
    searchString = 'SliceFileName';
    Area01_Block_SliceName = LRF_parsing.getByString(searchString, table);
end

%%
Die_Number = [];
if ~isX8
    Die_Number = getDieNumber(table);
end

%%
AreaInfomation.Area01_Block_HorzScanDieCount = Area01_Block_HorzScanDieCount;
AreaInfomation.Area01_Block_VertScanDieCount = Area01_Block_VertScanDieCount;
AreaInfomation.Area01_Block_SliceName = Area01_Block_SliceName;

AreaInfomation.Die_Number = Die_Number;

end

%%
function Die_Number = getDieNumber(table)

Die_Number = [];

searchString = 'Die.Number';
stringIndex = find(~cellfun(@isempty, strfind(table, searchString)), 1, 'first');

temp = talbe{stringIndex};
% Die.Number 3 2;
temp = strtrim(temp);
if numel(temp) ~= 0
    temp = temp(1 : end - 1);
end
tempCell = strsplit(temp, ' ');
if numel(tempCell) ~= 3
    return
end
Die_Number = [str2double(tempCell{2}), str2double(tempCell{3})];


end



























