clearvars;
clc;
close all;
 
f1 = @(x) (x - 2)^2 + x * log(x + 3);
f2 = @(x) exp(-2 * x) + (x - 2)^2;
f3 = @(x) exp(x) * (x^3 - 1) + (x - 1) * sin(x);

a_0 = -1;
b_0 = 3; 
l_values = 0.002:0.002:0.1;
n = 22; % (1/2)^(n/2) <= l / (b - a)

f1_count = zeros(size(l_values));
f2_count = zeros(size(l_values));
f3_count = zeros(size(l_values));

for i = 1:length(l_values)
    l = l_values(i);

    % Derivative Searches
    [~, ~, f1_count(i)] = derivativeSearch(f1, a_0, b_0, l, n);
    [~, ~, f2_count(i)] = derivativeSearch(f2, a_0, b_0, l, n);
    [~, ~, f3_count(i)] = derivativeSearch(f3, a_0, b_0, l, n);
end

% Plots
figure;
plot(l_values, f1_count, 'r', 'LineWidth', 1.5);
xlabel('l');
ylabel('Function Evaluation Count');
title('Function Evaluation Count vs Final Interval Width (l) for f1');
grid on;

figure;
plot(l_values, f2_count, 'g', 'LineWidth', 1.5);
xlabel('l');
ylabel('Function Evaluation Count');
title('Function Evaluation Count vs Final Interval Width (l) for f2');
grid on;

figure;
plot(l_values, f3_count, 'b', 'LineWidth', 1.5);
xlabel('l');
ylabel('Function Evaluation Count');
title('Function Evaluation Count vs Final Interval Width (l) for f3');
grid on;

function [a, b, eval_count] = derivativeSearch(f, a, b, l, n)
    syms x;
    f_sym = f(x); 
    f_prime = diff(f_sym, x); 

    eval_count = 0;

    for k = 1:n
        xk = (a + b) / 2;
        fk = double(subs(f_prime, x, xk)); 
        
        if fk < 0
            a = xk;
        elseif fk > 0
            b = xk;
        else
            break;
        end
        
        eval_count = eval_count + 1; 

        
        if (b - a) < l
            break;
        end
    end
end
