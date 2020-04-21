function defect_show = getDefect_show(defectImg, sourceImg ,rgb, strelSize)

% output boundingBox image

% strelSize = 5;
% rgb = [255,0,0];
%%
defectImg_dil = imdilate(defectImg, strel('square', strelSize * 2 + 1));
defectImg_filter = defectImg_dil;
defectImg_dil_ero = imerode(defectImg_dil, strel('square', 3));
defectImg_filter(defectImg_dil_ero) = false;

defect_show = Utility.getHighLightImg(defectImg_filter, sourceImg, rgb);

end