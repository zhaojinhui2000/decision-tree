%****************************************
%bestFeature.m
%****************************************
%��ȡ���Ż�������
function [column] = bestFeature(data)       %����ֵdouble����
    [~,n] = size(data);
    featureSize = n - 1;
    gain_proc = cell(featureSize, 2);
    entropy = getEntropy(data);
    for i = 1:featureSize
        gain_proc{i, 1} = i;
        gain_proc{i, 2} = getGain(entropy, data, i);
    end
    max = gain_proc{1,2};
    max_label = 1;
    for i = 1:featureSize
        if gain_proc{i, 2} >= max
            max = gain_proc{i, 2};
            max_label = i;
        end
    end
    column = max_label;
end