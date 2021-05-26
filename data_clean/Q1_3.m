clear all;
clc;

% velocity = xlsread('Car3.xlsx', 'Sheet1', 'C2:C12429');
velocity = xlsread('Car1.xlsx', 'Sheet1', 'C2:C18045');
num = 299;
matrix_zero = [];
matrix_zero_last = [];

for i = 1:length(velocity) - num - 1
	velocity_sub = velocity(i: i + num, :);
	if any(velocity_sub) == 0
		matrix_zero = [matrix_zero; i+1];
        matrix_zero_last = [matrix_zero_last; i + num+1];
	end
end


matrix_zero_begin = []; % ´æ´¢¿ªÊ¼Î»ÖÃ
matrix_right = [];  % ´æ´¢½Ø¶ÏÎ»ÖÃ
matrix_zero_begin = [matrix_zero_begin;matrix_zero(1)];
for i = 1: length(matrix_zero) - 1
    if matrix_zero(i + 1) - matrix_zero(i) ~= 1  
        matrix_right = [matrix_right; matrix_zero(i)];
        matrix_zero_begin = [matrix_zero_begin; matrix_zero(i+1)];
    end
end

matrix_zero_last = [];
for i = 1: length(matrix_right)
    matrix_zero_last(i, :) = matrix_right(i) + num;
end
matrix_zero_last = [matrix_zero_last; matrix_zero(end) + num];




% row_delete = [];
% for i = 1: length(matrix_zero)-1
% 	for j = 1: length(velocity) - num - 1
% 		if velocity(matrix_zero(i) + j) ~= 0
% 			break
% 		end
%     end
%     row_delete = [row_delete; matrix_zero(i) + 18046];
% end