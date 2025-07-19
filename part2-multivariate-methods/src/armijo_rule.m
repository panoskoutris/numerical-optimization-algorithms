function gamma = armijo_rule(f, grad_f, x, d, sigma)
    gamma = 1;  % Initial step size
    while f(x + gamma * d) > f(x) + sigma * gamma * grad_f(x)' * d
        gamma = gamma / 2; 
    end
end
