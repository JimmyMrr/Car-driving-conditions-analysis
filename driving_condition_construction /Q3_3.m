time_len = [];
for i = 1: length(time)
    time_stage = time{1, i};
    time_len = [time_len; time_stage(end)-time_stage(1)];
end


% xlswrite('time.xlsx',time_len,'Sheet3', 'A1');
% xlswrite('time.xlsx',time_len,'Sheet2', 'A1');
xlswrite('time.xlsx',time_len,'Sheet1', 'A1');