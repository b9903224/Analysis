function FeatureResult = getFeatureResult(Image, TestInfo)

FeatureResult = FeatureFunc.iniFeatureResult(Image);

%%
featureVersion = '0.0.8;
Image.featureVersion = featureVersion;
Image.isTest = TestInfo.isTest;
Image.lrfData = Image.detailData.lrfData;
Image.laserTechVer = '8_series';

%%
if isempty(Image.T_Ref) || isempty(Image.T_Test) || isempty(Image.R_Ref) || isempty(Image.R_Test)
    FeatureResult.Image = Image;
    FeatureResult = DemoProd.getDemoImgProdForInvalidImg(FeatureResult);
    return
end

%%
Image = FeatureFunc.getWorkImg(Image);
Image = FeatureFunc.getLayerInfoByLrfData(Image);
Image = FeatureFunc.getPatternImg(Image);
% Image = FeatureFunc.getDiffImage(Image);
% Image = FeatureFunc.getDiffImageByDft(Image);
Image = FeatureFunc.getDIffImageByFft(Image);
Image = FeatureFunc.getDiffInfo(Image);

%%
FeatureResult = FeatureFunc.getF_hasDefect(Image, FeatureResult);

%%
FeatureResult.Image = Image;

%% ---------------------- get defect code----------------------
FeatureResult = DefectCdParsing.getDefectCdByRule(FeatureResult);

%%---------------------- output demo image for prod----------------------
FeatureResult = DemoProd.getDemoImgProd(FeatureResult);

end






























