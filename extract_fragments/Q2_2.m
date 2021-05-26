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

% ´æ´¢Ê±¼ä
time = time.';
for i = 1:length(day_hour)
    time_initial(i) = time(i) - time(1);
end
time_initial = time_initial.';

fragment_figure = res{1, 7};
% exception = [];
row_sum = 0;
for k = 1: 6
    fragment = res{1, k};
    [row_num, ~] = size(fragment);
    row_sum = row_sum + row_num; 
end

[row_num7, ~] = size(fragment_figure);
time_figure = time_initial(row_sum + 1: row_sum + row_num7, :);

% plot(time_figure, fragment_figure);
% xlabel('t(s)');
% ylabel('v(km/h)'); 



















% for i = 1: length(res)
%     dlmwrite('TestOutput1.txt',res{1,i},  '\n')
% end


% dlmwrite('TestOutput1.txt',res(1,1).',   'newline','pc', '-append')
% dlmwrite('TestOutput1.txt',res(1,2).',   'newline','pc', '-append')

% dlmwrite('TestOutput1.txt',res{1,1},  '\n')
% dlmwrite('TestOutput1.txt',res{1,2},  '\n')
% dlmwrite('TestOutput1.txt',res{1,3},  '\n')
