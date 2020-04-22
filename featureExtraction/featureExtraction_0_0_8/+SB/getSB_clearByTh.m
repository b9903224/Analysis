function Image = getSB_clearByTh(Image, R_Ref_bw_th, T_Ref_bw, T_Ref_bw_dil)

R_Ref_work = Image.R_Ref_work;

cropImageDarkPart = Image.cropImageDarkPart;
[imgH, imgW] = size(R_Ref_work);
SB_clear = false(imgH, imgW);

%%
R_Ref_dark = R_Ref_work < R_Ref_bw_th;

%%
R_Ref_dark = R_Ref_dark & ~cropImageDarkPart;

%%
CC = bwconncomp(R_Ref_dark, 4);
for label = 1 : CC.NumObjects
    PixelIdx = CC.PixelIdxList{label};
    if any(T_Ref_bw(PixelIdx) == true)
        continue
    end
    if all(T_Ref_bw_dil(PixelIdx) == true)
        continue
    end
    Sb_clear(PixelIdx) = true;
end

%%
Image.SB_clear = SB_clear;

end





















