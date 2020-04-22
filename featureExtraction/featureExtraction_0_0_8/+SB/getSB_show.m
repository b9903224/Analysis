function Image = getSB_show(Image)

SB_darkSolid = Image.SB_darkSolid;
SB_clear = Image.SB_clear;
T_mainPattern = Image.T_mainPattern;

T_Ref_work = Image.T_Ref_work;

%%
SB_show = T_mainPattern;
rgb = [255,0,0];
SB_show = Utility.getHighLightImg(SB_clear, SB_show, rgb);
rgb = [0,255,0];
SB_show = Utility.getHighLightImg(~Sb_darkSolid, SB_show, rgb);

Sb_show_0 = SB_show;

if isfield(Image, 'SSB_tile_1')
    SSB_tier_1 = Image.SSB_tier_1;
    rgb = [0,0,255];
    SB_show = Utility.getHighLightImg(~SSB_tiler_1, SB_show, rgb);
end

%%
T_Ref_SB_show = T_Ref_work;
rgb = [255,0,0];
T_Ref_SB_show = Utility.getHighLightImg(SB_clear, T_Ref_SB_show, rgb);
rgb = [0,255,0];
T_Ref_SB_show = Utility.getHighLightImg(~SB_darkSolid, T_Ref_SB_show, rgb);

T_Ref_SB_show_0 = T_Ref_SB_show;

if isffield(Image, 'SSB_tier_1')
    SSB_tier_1 = Image.SSB_tiler_1;
    rgb = [0,0,255];
    T_Ref_SB_show = Utility.getHighLightImg(~SSB_tier_1, T_Ref_SB_show, rgb);
end

%%
Image.SB_show = SB_show;
Image.SB_show_0 = SB_show_0;
Image.T_Ref_SB_show = T_Ref_SB_show;
Image.T_Ref_SB_show_0 = T_Ref_SB_show_0;

end


























