clearvars;
clc;
close all; 

f1 = @(x) (x - 2)^2 + x * log(x + 3);
f2 = @(x) exp(-2 * x) + (x - 2)^2;
f3 = @(x) exp(x) * (x^3 - 1) + (x - 1) * sin(x);

a_0 = -1;
b_0 = 3;
e = 0.001; 
l_values = 0.003:0.002:0.1; 

f1_count = zeros(size(l_values));
f2_count = zeros(size(l_values));
f3_count = zeros(size(l_values));

for i = 1:length(l_values)
    l = l_values(i);

    % Bisector Searches
    [~, ~, f1_count(i)] = bisecttionSearch(f1, a_0, b_0, l, e);

    [~, ~, f2_count(i)] = bisecttionSearch(f2, a_0, b_0, l, e);

    [~, ~, f3_count(i)] = bisecttionSearch(f3, a_0, b_0, l, e);
end

% Plots
figure;
plot(l_values, f1_count, 'r', 'LineWidth', 2);
xlabel('l');
ylabel('Number of function evaluations');
title('Function evaluations for f1(x)');
grid on;

figure;
plot(l_values, f2_count, 'g', 'LineWidth', 2);
xlabel('l');
ylabel('Number of function evaluations');
title('Function evaluations for f2(x)');
grid on;

figure;
plot(l_values, f3_count, 'b', 'LineWidth', 2);
xlabel('l');
ylabel('Number of function evaluations');
title('Function evaluations for f3(x)');
grid on;

function [a, b, eval_count] = bisecttionSearch(f, a, b, l, e)

    eval_count = 0;
    max_iterations = 50;
    for iter = 1:max_iterations
   
        if (b - a) <= l
            break;
        end
        
        x1 = (a + b) / 2 - e;
        x2 = (a + b) / 2 + e;
        f1 = f(x1);
        f2 = f(x2);

        if f1 < f2
            b = x2;
        else
            a = x1;
        end
        eval_count = eval_count + 2;
    end
end