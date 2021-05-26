% 每个阶段
% a_positive_percent_matrix: 加速时间比
% a_negative_percent_matrix: 减速时间比
% velocity_std_matrix: 速度标准差
% velocity_max_matrix: 最大行驶速度
a_positive_percent_matrix = [];
a_negative_percent_matrix = [];
velocity_std_matrix = [];
velocity_max_matrix = [];
for i = 1: length(res)
    v = res{1,i};
    t = time{1,i};
    a_stage = [];
    a_positive_num = 0;
    a_negative_num = 0;
    a_positive = [];
    a_negative = [];
    for j = 2: length(v) 
        a_specific = (v(j) - v(j-1))/(t(j)-t(j-1));
        if a_specific > 0.1
            a_positive_num = a_positive_num + 1;
            a_positive = [a_positive; a_specific];
        end
        
        if a_specific < - 0.1
            a_negative = [a_negative; a_specific];
            a_negative_num = a_negative_num + 1;
        end
        a_stage = [a_stage; a_specific];
        
        a{i} = a_stage;
        a_plus{i} = a_positive;
        a_minus{i} = a_negative;
        
    end
    a_positive_percentage = length(a_positive) / length(v);
    a_negative_percentage = length(a_negative) / length(v);
%     a_positive_percentage = a_positive_num / length(v);
%     a_negative_percentage = a_negative_num / length(v);
    a_positive_percent_matrix = [a_positive_percent_matrix; a_positive_percentage];
    a_negative_percent_matrix = [a_negative_percent_matrix; a_negative_percentage];
    velocity_std_matrix = [velocity_std_matrix; std(v)];
    velocity_max_matrix = [velocity_max_matrix; max(v)];

    
%     a_positive_max = max(a_positive);
%     a_negative_min = min(a_negative);
%     a_positive_max_matrix = [a_positive_max_matrix; a_positive_max];
%     a_negative_min_matrix = [a_negative_min_matrix; a_negative_min];
end

% a_positive_max_matrix: 最大加速度
% a_negative_min_matrix: 最大减速度
% velocity_average_matrix: 平均速度
% driving_speed_average_matrix: 平均行驶速度
% uniform_speed_matrix: 匀速时间比
% idle_time_matrix：怠速时间比
a_positive_max_matrix = [];
a_negative_min_matrix = [];
velocity_average_matrix = [];
driving_speed_average_matrix = [];
idle_time_matrix = [];
uniform_speed_matrix = [];
for i = 1: length(a)
   v = res{1,i};
   v0_count = 0;

   a_positive_max =  max(a{1, i});
   a_negative_min = min(a{1,i});
   a_positive_max_matrix = [a_positive_max_matrix; a_positive_max];
   a_negative_min_matrix = [a_negative_min_matrix; a_negative_min];

   for j = 1: length(v)
        if v(j) == 0
            v0_count = v0_count + 1;
        end
   end

   s_sum = sum(v);
   t_sum = length(v);
   velocity_average_sum = s_sum / t_sum;
   velocity_average_matrix = [velocity_average_matrix; velocity_average_sum];

   driving_speed_average = s_sum / (t_sum - v0_count);
   driving_speed_average_matrix = [driving_speed_average_matrix; driving_speed_average];

   idle_time = v0_count / t_sum;
   idle_time_matrix = [idle_time_matrix; idle_time];

end

for i = 1:length(res)
   uniform_speed = 1 - a_positive_percent_matrix(i) - a_negative_percent_matrix(i) -idle_time_matrix(i);
   if uniform_speed < 0
       uniform_speed = 0;
   end
   uniform_speed_matrix = [uniform_speed_matrix; uniform_speed];
end

% a_plus_average: 平均加速度
% a_plus_std: 加速度标准差
% a_minus_average: 平均减速度
% a_minus_std: 减速度标准差
a_plus_average = [];
a_minus_average = [];
a_plus_std = [];
a_minus_std = [];
for i = 1: length(a_plus)
    a_plus_matrix = a_plus{1, i};
    a_minus_matrix = a_minus{1, i};
    a_plus_average = [a_plus_average; mean(a_plus_matrix)];
    a_minus_average = [a_minus_average; mean(a_minus_matrix)];
    a_plus_std = [a_plus_std; std(a_plus_matrix)];
    a_minus_std = [a_minus_std; std(a_minus_matrix)];
end

xlswrite('Parameter3.xlsx',velocity_average_matrix, 'Sheet1', 'A1');
xlswrite('Parameter3.xlsx',driving_speed_average_matrix, 'Sheet1', 'B1');
xlswrite('Parameter3.xlsx',a_plus_average, 'Sheet1', 'C1');
xlswrite('Parameter3.xlsx',a_minus_average, 'Sheet1', 'D1');
xlswrite('Parameter3.xlsx',idle_time_matrix, 'Sheet1', 'E1');
xlswrite('Parameter3.xlsx',a_positive_percent_matrix, 'Sheet1', 'F1');
xlswrite('Parameter3.xlsx',a_negative_percent_matrix, 'Sheet1', 'G1');
xlswrite('Parameter3.xlsx',uniform_speed_matrix, 'Sheet1', 'H1');
xlswrite('Parameter3.xlsx',velocity_std_matrix, 'Sheet1', 'I1');
xlswrite('Parameter3.xlsx',a_plus_std, 'Sheet1', 'J1');
xlswrite('Parameter3.xlsx',a_minus_std, 'Sheet1', 'K1');
xlswrite('Parameter3.xlsx',a_positive_max_matrix, 'Sheet1', 'L1');
xlswrite('Parameter3.xlsx',a_negative_min_matrix, 'Sheet1', 'M1');
xlswrite('Parameter3.xlsx',velocity_max_matrix, 'Sheet1', 'N1');
