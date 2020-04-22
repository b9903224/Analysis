function Image = getLayerInfoByLrfData(Image)

lrfData = Image.lrfData;
AreaInformation = lrfData.AreaInformation;
Area01_Block_SliceName = AreaInformation.Area01_Block_SliceName;
[~, fileName, ~] = fileparts(Area01_Block_SliceName);

%%
ViaStringAry = {'VIA', 'IV'};
isVia = searchLayerByLayerNameAry(fileName, ViaStringAry);

M0POStringAry = {'M0PO'};
isM0PO = searchLayerByLayerNameAry(fileName, M0POStringAry);

%%
Image.isVia = isVia;
Image.isM0PO = isM0PO;

end

%%
function isVia = searchLayerByLayerNameAry(fileName, ViaStringAry)

isVia = false;
ViaStringAryLen = numel(ViaStringAry);

for i = 1 : ViaStringAryLen
    ViaString = ViaStringAry{i};
    if ~isempty(strfind(fileName, ViaString))
        isVia = true;
        break
    end
end

end



























