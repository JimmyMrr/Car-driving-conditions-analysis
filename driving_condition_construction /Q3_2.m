clear;
clc;

result1 = xlsread('result.xlsx','Sheet1','A2:A4469');
result2 = xlsread('result.xlsx','Sheet1','H2:H4469');
index = xlsread('result.xlsx','Sheet1','M2:M4469');
index_result = zeros(length(result1), 1);

for i = 1: length(result1)
	for j = 1: length(result2)
		if result2(j) == result1(i)
			index_result(i) = index(j);
		end
	end
end

xlswrite('result.xlsx',index_result,'Sheet1', 'G2');