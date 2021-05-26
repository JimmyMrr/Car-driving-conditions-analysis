clear;
clc;

% day_time  = xlsread('Car2.xlsx', 'Sheet1', 'B2:B136701');
% velocity = xlsread('Car1.xlsx', 'Sheet1', 'C2:C175417');
% day_time = xlsread('Car1.xlsx', 'Sheet1', 'B2:B175417');
velocity = xlsread('Car2.xlsx', 'Sheet1', 'C2:C136701');
% velocity = xlsread('Car3.xlsx', 'Sheet1', 'C2:C152846');
% day_time = xlsread('Car3.xlsx', 'Sheet1', 'B2:B152846');

L = length(velocity);
i = 1;
ni = 2;
j = 1;
% res = [];
while ni <= L-1
    while velocity(ni) == 0 || velocity(ni + 1) ~= 0
        ni = ni + 1;
    end
%     res = [res; velocity(j: ni)];
    res{i} = velocity(j: ni);
%     time{i} =  day_time(j: ni);
    ni = ni + 1;
    j = ni;
    i = i + 1;
end