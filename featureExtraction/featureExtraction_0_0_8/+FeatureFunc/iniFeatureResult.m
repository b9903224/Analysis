function FeatureResult = iniFeatureResult(Image)

defectCdByRule = 'RJ';
defectCd_judgeReason = 'Invalid image.';

%%
U_L = Image.detailData.lrfData.DefectData.U_L;
if strcmp(U_L, '0')
    defectCd_judgeReason = 'U_L == 0; Invalid image.';
end

%%
FeatureResult.defectCdByRule = defectCdByRule;
FeatureResult.defectCd_judgeReason = defectCd_judgeReason;

end