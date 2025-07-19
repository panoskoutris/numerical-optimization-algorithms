clearvars;
clc;
close all;

f1 = @(x) (x - 2)^2 + x * log(x + 3);
f2 = @(x) exp(-2 * x) + (x - 2)^2;
f3 = @(x) exp(x) * (x^3 - 1) + (x - 1) * sin(x);


a_0 = -1;
b_0 = 3; 
l_values = 0.008:0.002:0.1;
n = 15; % Fn > (b - a)/l

f1_count = zeros(size(l_values));
f2_count = zeros(size(l_values));
f3_count = zeros(size(l_values));

for i = 1:length(l_values)
    l = l_values(i);

    % Fibonacci Searches
    [~, ~, f1_count(i)] = fibonacciSearch(f1, a_0, b_0, l, n);

    [~, ~, f2_count(i)] = fibonacciSearch(f2, a_0, b_0, l, n);

    [~, ~, f3_count(i)] = fibonacciSearch(f3, a_0, b_0, l, n);
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


function [a, b, eval_count] = fibonacciSearch(f, a, b, l, n)
    fibo1 = fibonacci(n-2)/fibonacci(n);
    fibo2 = fibonacci(n-1)/fibonacci(n);
    x1 = a + fibo1 * (b - a);
    x2 = a + fibo2 * (b - a);
    f1 = f(x1);
    f2 = f(x2);
    eval_count = 2;

    k=1;
    while k < n-2 && (b - a) > l
        if f1 < f2
            b = x2;
            x2 = x1;
            f2 = f1;
            x1 = a + fibonacci(n - k - 2)/fibonacci(n - k) * (b - a);
            f1 = f(x1);
        else
            a = x1;
            x1 = x2;
            f1 = f2;
            x2 = a + fibonacci(n - k - 2)/fibonacci(n - k) * (b - a);
            f2 = f(x2);
        end
        eval_count = eval_count + 1; % Increases by 1 each iteration
        k = k +1;
    end

    % k = n - 2
    epsilon = l / 4; % I chose it so epsilon < l/2
    x2 = x1 + epsilon;
    if f(x1) > f(x2)
        a = x1;
    else
        b = x2;
    end

end

function fib_num = fibonacci(n)
    if n <= 0
        fib_num = 0;  
    elseif n == 1
        fib_num = 1;  
    else
        a = 0;  
        b = 1;  
        count = 2;  

        while count <= n
            fib_num = a + b;  
            a = b;            
            b = fib_num;      
            count = count + 1; 
        end
    end
end

