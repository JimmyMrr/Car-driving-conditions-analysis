clear;
clc;

day  = load('day3_1204.txt');
velocity = xlsread('Car3.xlsx', 'Sheet4', 'C2: C35134');

day_hour = day(:, 1);
day_min = day(:, 2);
day_second = day(:, 3);

time = [];
time_initial = [];
time_fault= zeros(length(day_hour), 1);
for i = 1: length(day_hour)
    time(i, :) = day_hour(i) * 3600 + day_min(i) * 60 + day_second(i);
end

% time_initial: 存储时间, 用来计算速度
for i = 1:length(day_hour)
    time_initial(i, :) = time(i) - time(1);
end

a_positive = [];
a_negative = [];
a_hundred = 100/3.6/7;
a_brake = -7.5;

% 存储异常加速度的索引
a_exception = [];
for i = 1: length(velocity) - 1
   a = (velocity(i + 1) - velocity(i))/(time_initial(i + 1) - time_initial(i));
   if a > a_hundred || a < a_brake
       a_exception = [a_exception; i + 1];
   end
   
   if a < 0
       a_positive = [a_positive; a];
   else
       a_negative = [a_negative; a];
   end
end


xlswrite('Test.xlsx', time_initial , 1, 'B2:B35134');