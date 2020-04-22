function Image = getWorkImg(Image)

[imgH, imgW] = size(Image.T_Ref);
Image.imgH = imgH;
Image.imgW = imgW;

cropImageDarkPart = false(imgH, imgW);

%%
Image.T_Ref_work = Image.T_Ref;
Image.T_Test_work = Image.T_Test;
Image.R_Ref_work = Image.R_Ref;
Image.R_Test_work = Image.R_Test;

Image.cropImageDarkPart = cropImageDarkPart;

%%
WorkImg = struct;

WorkImg.T_Ref_work = Image.T_Ref;
WorkImg.T_Test_work = Image.T_Test;
WorkImg.R_Ref_work = Image.R_Ref;
WorkImg.R_Test_work = Image.R_Test;

Image.WorkImg = WorkImg;

end
























