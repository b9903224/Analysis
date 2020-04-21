function Image = getImage(image_filePath, imgFileName, dateFolder, lrfData)

DefectData = lrfData.DefectData;
U_L = DefectData.U_L;

%%
[defectNumString, inspectionKey] = getDefectNumAndInspectionKey(imgFileName);

%%
inspectionKeyPath = fullfile(image_filePath, dateFolder, inspectionKey, 'Image');
instantReviewT_path = fullfile(inspectionKeyPath, 'InstantReviewT');
instantReviewR_path = fullfile(inspectionKeyPath, 'InstantReviewRt');

%%
T_Test_pos = fullfile(instantReviewT_path, sprintf('%s.png', defectNumString));
T_Ref_pos_L = fullfile(instantReviewT_path, sprintf('%sL.png', defectNumString));
T_Ref_pos_U = fullfile(instantReviewT_path, sprintf('%sU.png', defectNumString));
T_Defect_pos = fullfile(instantReviewT_path, sprintf('%sD.png', defectNumString));

R_Test_pos = fullfile(instantReviewR_path, sprintf('%s.png', defectNumString));
R_Ref_pos_L = fullfile(instantReviewR_path, sprintf('%sL.png', defectNumString));
R_Ref_pos_U = fullfile(instantReviewR_path, sprintf('%sU.png', defectNumString));
R_Defect_pos = fullfile(instantReviewR_path, sprintf('%sD.png', defectNumString));

%%
Image = struct;

T_Test = readImg(T_Test_pos);
R_Test = readImg(R_Test_pos);
T_Defect = readImg(T_Defect_pos);
R_Defect = readImg(R_Defect_pos);

if strcmp(U_L, '1')
    T_Ref = readImg(T_Ref_pos_L);
    R_Ref = readImg(R_Ref_pos_L);
elseif strcmp(U_L, '2')
    T_Ref = readImg(T_Ref_pos_U);
    R_Ref = readImg(R_Ref_pos_U);
elseif strcmp(U_L, '3')
    T_Ref = readImg(T_Ref_pos_L);
    R_Ref = readImg(R_Ref_pos_L);
elseif strcmp(U_L, '0')
    T_Ref = [];
    R_Ref = [];
end

Image.T_Test = T_Test;
Image.R_Test = R_Test;
Image.T_Ref = T_Ref;
Image.R_Ref = R_Ref;
Image.T_Defect = T_Defect;
Image.R_Defect = R_Defect;

end

%%
function img = readImg(imgPos)

img = [];

if ~isdeployed
    if exist(imgPos, 'file') == 2
        img = imread(imgPos);
    end
else
    img = imread(imgPos);
end

end

%%
function [defectNumString, inspectionKey] = getDefectNumAndInspectionKey(imgFileName)

index = find(imgFileName == '_', 1, 'last');
defectNumString = imgFileName(index + 1 : end);
inspectionKey = imgFileName(1 : index - 1);

end














