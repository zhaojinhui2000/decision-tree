%****************************************
%mostType.m
%****************************************
%�����������Ľ��
function [res] = mostType(data)         %����ֵcell����
    [m,n] = size(data);
    res = data(:, n);
    res_distinct = unique(res);
    res_num = length(res_distinct);
    res_proc = cell(res_num,2);
    res_proc(:, 1) = res_distinct(:, 1);
    res_proc(:, 2) = num2cell(zeros(res_num,1));
    for i = 1:res_num
        for j = 1:m
            if res_proc{i, 1} == data{j, n}
                res_proc{i, 2} = res_proc{i, 2} + 1;
            end
        end
    end

    for i = 1:res_num
        if res_proc{i, 2} == max(res_proc{:, 2})
              res = res_proc(i, 1);
            break;
        end
    end
end