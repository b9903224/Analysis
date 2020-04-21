function save_Feature_Demo_prod(FeatureResult, Feature_Demo_path)

warning('off', 'all');

%%
saveFolder = fileparts(Feature_Demo_path);
mkdir(saveFolder);

%%
if ~isempty(FeatureResult)
    testAllImg_rgb = FeatureResult.demoImgProd;
else
    testAllImg_rgb = false;
end

%%
imwrite(testAllImg_rgb, Feature_Demo_path);

end