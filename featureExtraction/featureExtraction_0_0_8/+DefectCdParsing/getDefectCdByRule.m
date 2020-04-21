function FeatureResult = getDefectCdByRule(FeatureResult)

defectCdByRule = 'Reject';
defectCd_judgeReason = '';

%%
f_hasDefect = FeatureResult.f_hasDefect;
if f_hasDefect
    defectCdByRule = 'RJ';
    defectCd_judgeReason = [defectCd_judgeReason, 'has defect;'];
elseif f_hasDefect
    defectCdByRule = '4D';
    defectCd_judgeReason = [defectCd_judgeReason, 'no defect;'];
end

%%
if numel(defectCd_judgeReason) > 1
    defectCd_judgeReason(end) = '.';
end

%%
FeatureResult.defectCdByRule = defectCdByRule;
FeatureResult.defectCd_judgeReason = defectCd_judgeReason;

end