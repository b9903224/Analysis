function printUniqueNumber(defectCdByRuleAry, inputString)


%%
if islogical(defectCdByRuleAry)
    printUniqueNumber_logical(defectCdByRuleAry, inputString);
else
    printUniqueNumber_string(defectCdByRuleAry, inputString);
end

end

%%
function printUniqueNumber_logical(defectCdByRuleAry, inputString)

defectCdByRuleAry_unique = unique(defectCdByRuleAry);
totalCount = numel(defectCdByRuleAry);

%%
for i = 1 : numel(defectCdByRuleAry_unique)
    defectCdByRule_unique = defectCdByRuleAry_unique(i);
    count = sum(defectCdByRule_unique == defectCdByRuleAry);
    fprintf('%g. %s: %s -%g%% (%g/%g)\n',...
        i, inputString, logical2str(defectCdByRule_unique), count/totalCount*100, count, totalCount)
end

end

%%
function printUniqueNumber_string(defectCdByRuleAry, inputString)

defectCdByRuleAry_unique = unique(defectCdByRuleAry);
totalCount = numel(defectCdByRuleAry);

%%
for i = 1 : numel(defectCdByRuleAry_unique)
    defectCdByRule_unique = defectCdByRuleAry_unique(i);
    count = sum(strcmp(defectCdByRule_unique, defectCdByRuleAry));
    fprintf('%g. %s: %s -%g%% (%g/%g)\n',...
        i, inputString, logical2str(defectCdByRule_unique), count/totalCount*100, count, totalCount)
end

end

%%
function str = logical2str(flag)

str = '';

%%
if isa(flag, 'logical')
    if flag
        str = 'true';
    else
        str = 'false';
    end
end

if isa(flag, 'double')
    if flag == 1
        str = 'true';
    elseif flag == 0
        str = 'false';
    end
end

end













