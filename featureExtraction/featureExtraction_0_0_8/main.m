%%
warning('off', 'all');
close all
format compact
rng('shuffle');

%%
parentParentPath = fileparts(fileparts(pwd));
dataPath = fullfile(parentParentPath, 'data');

%%
datVer = '';
%
%

%%
imgFilePath = Dev.getImgFilePath(dataPath, dataVer);
load(fullfile(dataPath, dataVer));
[~, folderName, ~] = fileparts(pwd);

%%
defectCdAry = Data.defectCdAry;
imgFileNameAry = Data.imgFileNameAry;
lrfDataAry = Data.lrfDataAry;
dateFolderAry = Data.dataFolderAry;

%%
MaskInfoAry = Dev.getMaskInfoAry(lrfDataAry);
inspTypeAry = {MaskInfoAry.inspType}';
lasyerIdAry = {MaskInfoAry.layerId}';

%%
imageIndices = 1 : numel(defectCdAry};
imageIndices = 4986;
% imageIndices = find(strcmp(inspTypeARy, 'DD')); % MultiDie
% imageIndices = Dev.getImageIndicesByFeatureDemo(imgFileNameAry, fullfile(imdbPath, 'Feature_Demo_EuvLtAdc', 'getFeatureDemoIndices'));
% imageIndices = Dev.getImageIndicesByLotId(imgFileNameAry, '');
% imageIndices = find(strcmp(imgFIleNameAry, strrep('', '_Feature_Demo', '')));
% imageIndices = find(strcmp(defectCdAry, 'C2'));
% imageIndices = find(ismember(defectCdAry, {'1A'}));
% imageIndices = find(~ismember(defectCdAry, {'3C'}));
% imageIndices = imageIndcies(randperm(numel(imageIndices), min(numel(imageIndices), 200)));

%%
TestInfo = struct;
TestInfo.isTest = true;
% TestInfo.isTest = false;
TestInfo.isShowTime = true;
% TestInfo.isShowTime = false;

kernelVersion = '0.0.0-0.0.0';

%%
DemoImgProdTemplate = DemoProd.getDemoImgProdTemplate;

fprintf('---dataVer: %s---\n', dataVer)
imageIndicesLen = numel(imageIndices);
defectCdByRuleAry = repmat({'RJ'}, imageIndicesLen, 1);
defectCd_judgeReasonAry = repmat({'featureResult is empty.'}, imageIndicesLen, 1);
for index = 1 : imageIndciesLen
% parfor index = 1 : imageIndciesLen
    imageIndex = imageIndices(index);
    defectCd = defectCdAry{imageIndex};
    imgFileName = imgFIleNameAry{imageIndex};
    lrfData = lrfDataAry(imageIndex);
    dateFolder = dataFolderAry{imageIndex};
    MaskInfo = MaskInfoAry(imageIndex);
    Image = Dev.getImage(imgFilePath, imgFileName, dateFolder, lrfData);
    
    %%
    detailData = struct;
    detailData.defectCd = defectCd;
    detailData.imgFIleName = imgFIleName;
    detailData.lrfData = lrfData;
    
    detailData.MaskInfo = MaskInfo;
    
    detailData.index = imageIndex;
    detailData.DemoImgProdTemplate = DemoImgProdTemplate;
    detailData.kernelVersion = kernelVersion;
    
    Image.detailDAta = detailData;
       
    %%
    tStrat = tic;
    FeatureResult = FeatureFunc.getFeatureResult(Image, TestInfo);
    tEnd = toc(tStart);
    fprintf('index: %g/%g, imageIndex: %g, defectCd: %s, getFeature elapsed time is %g seconds.\n',...
        index, imageIndicesLen, imagIndex, defectCd, tEnd)
    
    %%
    defectCdByRuleAry{index} = FEatureResult.defectCdByRule;
    defectCd_judgeReasonAry{index} = FeatureResult.defectCd_judgeReason;
    
    %% demo
    if true
        Feature_Demo_path = fullfile(dataPath, 'Feature_Demo', sprintf('%s(%s)', dataVer, folderName), sprintf('%s_Feature_Demo.png', imgFileName));
%         Dev.save_Feature_Demo_prod(FeatureResult, Feature_Demo_path);
        Dev.save_Feature_Demo(FeatureResult, Feature_Demo_path);
    end
    if ~strcmp(defectCd, '4D') && strcmp(FeatureResult.defectCdByRule, '4D')
        Feature_Demo_path = fullfile(dataPath, 'Feature_Demo', sprintf('%s(%s)_non4Dto4D', dataVer, folderName), sprintf('%s_Feature_Demo.png', imgFileName));
        Dev.save_Feature_Demo(FeatureResult, Feature_Demo_path);
    end 
end

%%
if imageIndicesLen >= 1
    disp('-----------------------------------------------------------------------')
    fprintf('---dataVer: %s---\n', dataVer)
    disp('-----------------------------------------------------------------------')
    Dev.printUniqueNumber(defectCdByRuleAry, 'defectCdByRule');
    disp('-----------------------------------------------------------------------')
    Dev.printUniqueNumber(defectCd_judgeReasonAry, 'defectCd_judgeReasonAry');
    disp('-----------------------------------------------------------------------')
    Dev.printUniqueNumber(defectCdAry(imageIndices), 'defectCd');
end
    








