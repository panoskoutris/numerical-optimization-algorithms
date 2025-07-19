function [x_history, f_history] = steepest_descent_with_constraints(f, grad_f, x0, gamma, s, a, b, max_iter, tol)

    % Initialization
    x = x0(:);  
    x_history = x;
    f_history = f(x);
    
    % Projection function
    project = @(y) [max(a(1), min(b(1), y(1))); max(a(2), min(b(2), y(2)))];

    
    for k = 1:max_iter
        grad = grad_f(x);
        
        % Compute projected point
        x_bar = project(x - s * grad);
        
        % Update x using the step size gamma
        x_new = x + gamma * (x_bar - x);
        
        % Compute function value
        f_new = f(x_new);
        
        % Store history
        x_history = [x_history, x_new(:)];
        f_history = [f_history, f_new];
        
        % Check for convergence
        if norm(grad) < tol
            break;
        end
        
        % Update x for next iteration
        x = x_new;
    end
end


