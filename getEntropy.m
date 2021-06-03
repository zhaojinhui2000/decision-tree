%****************************************
%getEntropy.m
%****************************************
%������Ϣ��
function [entropy] = getEntropy(data)       %����ֵdouble����
    entropy = 0;
    [m,n] = size(data);
    label = data(:, n);
    label_distinct = unique(label);
    label_num = length(label_distinct);
    proc = cell(label_num,2);
    proc(:, 1) = label_distinct(:, 1);
    proc(:, 2) = num2cell(zeros(label_num, 1));
    for i = 1:label_num
        for j = 1:m
            if proc{i, 1} == data{j, n}
                proc{i, 2} = proc{i, 2} + 1;
            end
        end
        proc{i, 2} = proc{i, 2} / m;
    end
    for i = 1:label_num
        entropy = entropy - proc{i, 2} * log2(proc{i, 2});
    end
end