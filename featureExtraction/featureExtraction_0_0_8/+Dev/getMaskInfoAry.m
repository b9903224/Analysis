function MaskInfoAry = getMaskInfoAry(lrfDataAry)

MaskInfoAry = iniMaskInfoAry(lrfDataAry);

for i = 1 : numel(MaskInfoAry)
    MaskInfoAry(i) = Dev.getMaskInfo(lrfDataAry(i));
end

end

%%
function MaskInfoAry = iniMaskInfoAry(lrfDataAry)

lrfDataAryLen = numel(lrfDataAry);

MaskInfoAry(lrfDataAryLen, 1).('inspType') = [];
MaskInfoAry(lrfDataAryLen, 1).('layerId') = [];

end