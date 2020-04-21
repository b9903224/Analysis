function save_Feature_Demo(FeatureResult, Feature_Demo_path)

warning('off', 'all');

%%
saveFolder = fileparts(Feature_Demo_path);
mkdir(saveFolder);

%%
if isempty(FeatureResult)
    testAllImg_rgb = false;
else
    defectCd_judgeReason = FeatureResult.defectCd_judgeReason;
    if ~isempty(strfind(defectCd_judgeReason, 'Invalid image'))
        testAllImg_rgb = FeatureResult.demoImgProd;
        testAllImg_rgb = Dev.insertToolDefectForInvalidImg(FeatureResult,testAllImg_rgb);
    else
        testAllImg_rgb = Dev.get_Feature_Demo(FeatureResult);
    end
end

%%
imwrite(testAllImg_rgb, Feature_Demo_path);

end