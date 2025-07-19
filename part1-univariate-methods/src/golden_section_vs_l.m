clearvars;
clc;
close all;

f1 = @(x) (x - 2)^2 + x * log(x + 3);
f2 = @(x) exp(-2 * x) + (x - 2)^2;
f3 = @(x) exp(x) * (x^3 - 1) + (x - 1) * sin(x);

a_0 = -1;
b_0 = 3;
gamma = 0.618; 
l_values = 0.002:0.002:0.1; 

f1_count = zeros(size(l_values));
f2_count = zeros(size(l_values));
f3_count = zeros(size(l_values));

for i = 1:length(l_values)
    l = l_values(i);

    % Golden Section Searches
    [~, ~, f1_count(i)] = goldenSectionSearch(f1, a_0, b_0, l, gamma);

    [~, ~, f2_count(i)] = goldenSectionSearch(f2, a_0, b_0, l, gamma);

    [~, ~, f3_count(i)] = goldenSectionSearch(f3, a_0, b_0, l, gamma);
end

% Plots
figure;
plot(l_values, f1_count, 'r', 'LineWidth', 1.5);
xlabel('l');
ylabel('Function Evaluation Count');
title('Function Evaluation Count for f1(x)');
grid on;

figure;
plot(l_values, f2_count, 'g', 'LineWidth', 1.5);
xlabel('l');
ylabel('Function Evaluation Count');
title('Function Evaluation Count for f2(x)');
grid on;

figure;
plot(l_values, f3_count, 'b', 'LineWidth', 1.5);
xlabel('l');
ylabel('Function Evaluation Count');
title('Function Evaluation Count for f3(x)');
grid on;


function [a, b, eval_count] = goldenSectionSearch(f, a, b, l, gamma)
    x1 = a + (1 - gamma) * (b - a);
    x2 = a + gamma * (b - a);
    f1 = f(x1);
    f2 = f(x2);
    eval_count = 2; % Initial evaluations

    while (b - a) > l
        if f1 < f2
            b = x2;
            x2 = x1;
            f2 = f1;
            x1 = a + (1 - gamma) * (b - a);
            f1 = f(x1);
        else
            a = x1;
            x1 = x2;
            f1 = f2;
            x2 = a + gamma * (b - a);
            f2 = f(x2);
        end
        eval_count = eval_count + 1; % Increases by 1 each iteration
    end
end
