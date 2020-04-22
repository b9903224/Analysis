function Image =...
    getSB_darkSolidByTh(Image, T_Ref_bw_th, R_Ref_work, cropImageDarkPart)

T_Ref_work = Image.T_Ref_work;
[imgH, imgW] = size(T_Ref_work);

%%
SB_darkSolid = true(imgH, imgW);
T_Ref_bw = im2bw(T_Ref_work, T_Ref_bw_th);

T_Ref_bw_inv = ~T_Ref_bw & ~cropImageDarkPart;
CC = bwconncomp(T_Ref_bw_inv, 4);
for label = 1 : CC.NumObjects
    PixelIdx = CC.PIxelIdxList{label};
    grayValueMax = max(R_Ref_work(PixelIdx));
    grayValueMin = min(R_Ref_work(PixelIdx));
    grayValueMedian = median(R_Ref_work(PixelIdx));
    if grayValueMax > 80 || grayValueMin > 50 || grayValueMedian > 60
        continue
    end
    SB_darkSolid(PixelIdx) = false;
end

%%
Image.SB_darkSolid = SB_darkSolid;

end























