clearvars;
clc;
close all;

f1 = @(x) (x - 2)^2 + x * log(x + 3);
f2 = @(x) exp(-2 * x) + (x - 2)^2;
f3 = @(x) exp(x) * (x^3 - 1) + (x - 1) * sin(x);

a_0 = -1;
b_0 = 3;
gamma = 0.618; 
l_values = [0.01, 0.05, 0.1]; 

for i = 1:length(l_values)
    l = l_values(i);

    % Golden Section Searches
    [f1_a, f1_b] = goldenSection(f1, a_0, b_0, l, gamma);
      
    [f2_a, f2_b] = goldenSection(f2, a_0, b_0, l, gamma);
      
    [f3_a, f3_b] = goldenSection(f3, a_0, b_0, l, gamma);
    
    % Plots
    figure;
    plot(1:length(f1_a), f1_a, 'r', 'LineWidth', 1.5); hold on;
    plot(1:length(f1_b), f1_b, 'b', 'LineWidth', 1.5);
    xlabel('Iteration (k)');
    ylabel('Interval Bounds');
    title(['Interval Bounds for f1(x) with l = ', num2str(l)]);
    legend('a_k', 'b_k');
    grid on;

    figure;
    plot(1:length(f2_a), f2_a, 'g', 'LineWidth', 1.5); hold on;
    plot(1:length(f2_b), f2_b, 'm', 'LineWidth', 1.5);
    xlabel('Iteration (k)');
    ylabel('Interval Bounds');
    title(['Interval Bounds for f2(x) with l = ', num2str(l)]);
    legend('a_k', 'b_k');
    grid on;

    figure;
    plot(1:length(f3_a), f3_a, 'b', 'LineWidth', 1.5); hold on;
    plot(1:length(f3_b), f3_b, 'c', 'LineWidth', 1.5);
    xlabel('Iteration (k)');
    ylabel('Interval Bounds');
    title(['Interval Bounds for f3(x) with l = ', num2str(l)]);
    legend('a_k', 'b_k');
    grid on;
end


function [a_vals, b_vals] = goldenSection(f, a, b, l, gamma)
    
    x1 = a + (1 - gamma) * (b - a);
    x2 = a + gamma * (b - a);
    f1 = f(x1);
    f2 = f(x2);

    a_vals = a;
    b_vals = b;

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
        a_vals = [a_vals; a];
        b_vals = [b_vals; b];
    end
end
