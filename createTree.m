%****************************************
%createTree.m
%****************************************
%���ɾ�����ID3�㷨
%data��ѵ����
%feature�����Լ�
function [node] = createTree(data, feature)
    type = mostType(data);  %cell����
    [m, n] = size(data);
    %���ɽڵ�node
    %value������������Ϊnull���ʾ�ýڵ��Ƿ�֧�ڵ�
    %name���ڵ㻮������
    %branch���ڵ�����ֵ
    %children���ӽڵ�
    node = struct('value','null','name','null','branch','null','children',{});
    temp_type = data{1, n};
    temp_b = true;
    for i = 1 : m
        if temp_type ~= data{i, n}
            temp_b = false;
        end
    end
    %������ȫΪͬһ����������node�ڵ�ΪҶ�ڵ�
    if temp_b == true
        node(1).value = data(1, n); %cell����
        return;
    end
    %���Լ���Ϊ�գ���������Ϊ���������ķ���
    if isempty(feature) == 1
        node.value = type;  %cell����
        return;
    end

    %��ȡ���Ż�������
    feature_bestColumn = bestFeature(data); %��������������double����
    best_feature = data(:,feature_bestColumn); %���������У�cell����
    best_distinct = unique(best_feature); %��������ȡֵ
    best_num = length(best_distinct); %��������ȡֵ����
    best_proc = cell(best_num, 2);
    best_proc(:, 1) = best_distinct(:, 1);
    best_proc(:, 2) = num2cell(zeros(best_num, 1));
    %ѭ�������Ե�ÿһ��ֵ
    for i = 1:best_num
        %Ϊnode����һ��bach_node��֧��������data�и�����ֵΪbest_proc(i, 1)�ļ���ΪDv
        bach_node = struct('value', 'null', 'name', 'null', 'branch', 'null', 'children',{});
        Dv_index = 0;
        for j = 1:m
            if data{j, feature_bestColumn} == best_proc{i, 1}
                Dv_index = Dv_index + 1;
            end
        end
        Dv = cell(Dv_index, n);
        Dv_index2 = 1;
        for j = 1:m
            if best_proc{i, 1} == data{j, feature_bestColumn}
                Dv(Dv_index2, :) = data(j, :);
                Dv_index2 = Dv_index2 + 1;
            end
        end
        Dfeature = feature;
        %DvΪ���򽫽�����Ϊ���������ķ���
        if isempty(Dv) == 1
            bach_node.value = type;
            bach_node.name = feature(feature_bestColumn);
            bach_node.branch = best_proc(i, 1);
            node.children(i) = bach_node;
            return;
        else
            Dfeature(feature_bestColumn) = [];
            Dv(:,feature_bestColumn) = [];
            %�ݹ����createTree����
            bach_node = createTree(Dv, Dfeature);
            bach_node(1).branch = best_proc(i, 1);
            bach_node(1).name = feature(feature_bestColumn);
            node(1).children(i) = bach_node;
        end
    end
end

        