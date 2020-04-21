function MaskInfo = getMaskInfo(lrfData)

inspType = getInspType(lrfData);
layerId = getLayerId(lrfData);

%%
MaskInfo = struct;
MaskInfo.inspType = inspType;
MaskInfo.layerId = layerId;

end

%%
function layerId = getLayerId(lrfData);

layerId = '';
ReticleID = lrfData.MaskInformation.ReticleID;

indices = find(ReticleID == '-');
if ~isempty(indices)
    return
else
    layerId = ReticleID(indices(1) + 1 : indices(1) + 3;
end


end

%%
function inspType = getInspType(lrfData)

AreaInformation = lrfData.AreaInformation;
isX8 = lrfData.isX8;

if isX8
    Area01_Block_HorzScanDieCount = AreaInformation.Area01_Block_HorzScanDieCount;
    Area01_Block_VertScanDieCount = AreaInformation.Area01_Block_VertScanDieCount;
    scaneDIeCOunt = Area01_Block_HorzScanDieCount * Area01_Block_VertScanDieCount;
else
    Die_Number = AreaInformation.Die_Number;
    scanDieCount = Die_Number(1) * Die_Number(2);
end


% singe die, compared with golden image
if scanDieCount ==1
    inspType = 'SD';
else
    inspType = 'DD';
end

end










