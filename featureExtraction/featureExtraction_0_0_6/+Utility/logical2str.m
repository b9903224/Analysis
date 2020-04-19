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