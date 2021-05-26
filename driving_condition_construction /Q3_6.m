clear;
clc;

velocity = xlsread('Answer3_1.xlsx', 'Sheet2');
m = length(velocity);
time = zeros(m, 1);
for i = 1: m
    time(i) = i;
end

% plot( time,velocity);
% xlabel('t(s)');
% ylabel('v(km/h)');


% ƽ���ٶ�
s_sum = sum(velocity);
v_average = s_sum/m;

% ƽ����ʻ�ٶ�
count = 0;
for i = 1: m
	if velocity(i) == 0
		count = count + 1;
    end
end
v_travel_average = s_sum / (m - count);

% ƽ�����ٶ�; ƽ�����ٶ�
a = zeros(m-1, 1);
a_plus = [];
a_minus = [];
for i = 1:m-1
	a_specific = (velocity(i + 1) - velocity(i)) / (time(i+1) - time(i));
	if a_specific > 0.1
		a_plus = [a_plus, a_specific];
	end
	if a_specific < -0.1
		a_minus = [a_minus; a_specific];
	end
end
a_plus_average = sum(a_plus)/length(a_plus);
a_minus_average = sum(a_minus)/length(a_minus);

% ����ʱ���
% ����ʱ���
% ����ʱ���
% ����ʱ���
idle_time_percent = count / m;
plus_time_percent = length(a_plus) / m;
minus_time_percent = length(a_minus)/m;
uniform_time_percent = 1 - idle_time_percent - plus_time_percent - minus_time_percent;

% �ٶȱ�׼��
% ���ٶȱ�׼��
% ���ٶȱ�׼��
v_std = std(velocity);
a_plu_std = std(a_plus);
a_minus_std = std(a_minus);

% ���ٶ����ֵ
% ���ٶ����ֵ
% �����ʻ�ٶ�
a_plus_max = max(a_plus);
a_minus_max = min(a_minus);
v_max = max(velocity);


Parameter = [v_average, v_travel_average, a_plus_average, a_minus_average,...
			idle_time_percent, plus_time_percent, minus_time_percent, uniform_time_percent,....
			v_std, a_plu_std, a_minus_std, a_plus_max, a_minus_max, v_max];
        
xlswrite('All.xlsx',Parameter,'Sheet1');