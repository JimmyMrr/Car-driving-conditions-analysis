clear;
clc;

velocity = xlsread('Car1.xlsx', 'Sheet1', 'C2:C175421');
L = length(velocity);
i = 1;
ni = 2;
j = 1;
% res = [];
while ni < L
    while velocity(ni - 1) == 0 || velocity(ni) ~= 0
        ni = ni + 1;
    end
%     res = [res; velocity(j: ni)];
    res{i} = velocity(j: ni);
    ni = ni + 1;
    j = ni;
    i = i + 1;
end
