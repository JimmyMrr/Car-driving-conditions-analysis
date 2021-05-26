clear;
clc;

% day_time  = xlsread('Car2.xlsx', 'Sheet1', 'B2:B136701');
velocity = xlsread('Car1.xlsx', 'Sheet1', 'C2:C175417');
day_time = xlsread('Car1.xlsx', 'Sheet1', 'B2:B175417');
% velocity = xlsread('Car2.xlsx', 'Sheet1', 'C2:C136701');
% velocity = xlsread('Car3.xlsx', 'Sheet1', 'C2:C152846');
% day_time = xlsread('Car3.xlsx', 'Sheet1', 'B2:B152846');


% Car3 更新12.2
% for i = 11526: 43361
%     day_time(i) = day_time(i) + day_time(11525) + 1;
% end
% % 更新12.3
% for i = 43362: 72838
%     day_time(i) = day_time(i) + day_time(43361) + 1;
% end
% % 更新12.4
% for i = 72839: 107220
%     day_time(i) = day_time(i) + day_time(72838) + 1;
% end
% % 更新12.5
% for i = 107221: 132598
%     day_time(i) = day_time(i) + day_time(107220) + 1;
% end
% % 更新12.6
% for i = 132599:152845
%     day_time(i) = day_time(i) + day_time(132598) + 1;
% end


%Car2 更新11.2
% for i = 1538: 9881
%     day_time(i) = day_time(i) + day_time(1537) + 1;
% end
% % 更新11.3
% for i = 9882: 28268
%     day_time(i) = day_time(i) + day_time(9881) + 1;
% end
% % 更新11.4
% for i = 28269: 44936
%     day_time(i) = day_time(i) + day_time(28268) + 1;
% end
% % 更新11.5
% for i = 44937: 73782
%     day_time(i) = day_time(i) + day_time(44936) + 1;
% end
% % 更新11.6
% for i = 73783:110423
%     day_time(i) = day_time(i) + day_time(73782) + 1;
% end
% % 更新11.7
% for i =110424: 136700
%     day_time(i) = day_time(i) + day_time(110423) + 1;
% end

% Car1 更新12.19
for i = 17806: 48926
    day_time(i) = day_time(i) + day_time(17805) + 1;
end
% 更新12.20
for i = 48927: 72190
    day_time(i) = day_time(i) + day_time(48926) + 1;
end
% 更新12.21
for i = 72191: 100778
    day_time(i) = day_time(i) + day_time(72190) + 1;
end
% 更新12.22
for i = 100779: 128834
    day_time(i) = day_time(i) + day_time(100778) + 1;
end
% 更新12.23
for i = 128835:160698
    day_time(i) = day_time(i) + day_time(128834) + 1;
end
% 更新12.24
for i =160699: 175416
    day_time(i) = day_time(i) + day_time(160698) + 1;
end

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
    time{i} =  day_time(j: ni);
    ni = ni + 1;
    j = ni;
    i = i + 1;
end