function FeatureResult = getDefectCdByRule(FeatureResult)

defectCdByRule = 'Reject';
defectCd_judgeReason = '';

%%
f_hasDefect = FeatureResult.f_hasDefect;
if f_hasDefect
    defectCdByRule = 'RJ';
end

end