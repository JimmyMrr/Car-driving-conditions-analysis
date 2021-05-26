clear
clc

% velocity = xlsread('Car3.xlsx', 'Sheet2', 'C2:C32630');
%velocity = xlsread('Car3.xlsx', 'Sheet3', 'C2:C30371');
% velocity = xlsread('Car3.xlsx', 'Sheet4', 'C2:C35170');
% velocity = xlsread('Car3.xlsx', 'Sheet5', 'C2:C26378');
% velocity = xlsread('Car3.xlsx', 'Sheet6', 'C2:C21403');
%velocity = xlsread('Car2.xlsx', 'Sheet1', 'C2:C1550');
%velocity = xlsread('Car2.xlsx', 'Sheet2', 'C2:C8603');
%velocity = xlsread('Car2.xlsx', 'Sheet3', 'C2:C18813');
%velocity = xlsread('Car2.xlsx', 'Sheet4', 'C2:C1550');
%velocity = xlsread('Car2.xlsx', 'Sheet5', 'C2:C29719');
%velocity = xlsread('Car2.xlsx', 'Sheet6', 'C2:C37412');
%velocity = xlsread('Car2.xlsx', 'Sheet7', 'C2:C27389');
velocity = xlsread('Car1.xlsx', 'Sheet1', 'C2:C18045');
num = 179;
matrix_zero = [];

for i = 1:length(velocity) - num - 1
	velocity_sub = velocity(i: i + num, :);
	if any(velocity_sub) == 0
		matrix_zero = [matrix_zero; i + 1];
	end
end

row_delete = [];
for i = 1: length(matrix_zero)
	for j = 1: length(velocity) - num - 1
		if velocity(matrix_zero(i) + j) ~= 0
            break;
		end
    end
    row_delete = [row_delete; matrix_zero(i) + num + 1];
end


matrix_zero_begin = []; % 存储开始位置
matrix_zero_last = [];     % 存储结束位置
matrix_right = [];
matrix_zero_begin = [matrix_zero_begin;row_delete(1)];
for i = 1: length(row_delete) - 1
    if (row_delete(i + 1) - row_delete(i)) ~= 1  
        matrix_right = [matrix_right; row_delete(i)];
        matrix_zero_begin = [matrix_zero_begin; row_delete(i+1)];
        matrix_zero_last = [matrix_zero_last; row_delete(i)];
    end
end
matrix_zero_last = [matrix_zero_last; row_delete(end)];

% matrix_zero_last = [];
% for i = 1: length(matrix_right)
%     matrix_zero_last(i, :) = matrix_right(i) + num;
% end
% matrix_zero_last = [matrix_zero_last; row_delete(end) + num];
