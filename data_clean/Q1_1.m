% 找出不连续的时间点
clear;
clc;

day  = load('day_1219.txt');
% velocity = load('v_1218.txt');
day_hour = day(:, 1);
day_min = day(:, 2);
day_second = day(:, 3);

time = [];
time_initial = [];
time_fault= zeros(length(day_hour), 1);
for i = 1: length(day_hour)
    time(i) = day_hour(i) * 3600 + day_min(i) * 60 + day_second(i);
end

% 存储时间
time = time.';
for i = 1:length(day_hour)
    time_initial(i) = time(i) - time(1);
end
time_initial = time_initial.';

for i = 1:length(day_hour) - 1
    if time_initial(i+1) - time_initial(i) ~= 1
        time_fault(i) = time_initial(i);
        time_fault(i+1) = time_initial(i+1);
    end
end

index=find(time_fault~=0);
index = index + 1;
xlswrite('falsetime.xlsx', index, 2);
% plot(time_initial(10: 1300, :), velocity(10: 1300, :));
% plot(time_initial, velocity);