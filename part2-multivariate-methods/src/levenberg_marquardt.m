function [x_history, f_history] = levenberg_marquardt(f, grad_f, hessian_f, x0, gamma_type, max_iter, tol, sigma)
    x = x0(:);  
    x_history = x;
    f_history = f(x);
    mu = 0.1;  % Initial mu for L-M 

    for k = 1:max_iter
        grad = grad_f(x);  
        H = hessian_f(x);

        % Adjust H to ensure positive definiteness
        while ~all(eig(H + mu * eye(size(H))) > 0)
            mu = mu * 2;  % Gradual increase for stability
        end
        H_modified = H + mu * eye(size(H));
        
        % Compute d
        d = -H_modified \ grad;
        
        % Compute step size gamma
        if gamma_type == 1  % Fixed step size
            gamma = 0.3;  
        elseif gamma_type == 2  % Bisector search
            gamma = bisection(f, x, d, 0, 1, 1e-5, 1e-5);
        elseif gamma_type == 3  % Armijo rule
            gamma = armijo_rule(f, grad_f, x, d, sigma);
            
        end
        
        x_new = x + gamma * d;
        f_new = f(x_new);
        
        x_history = [x_history, x_new(:)];
        f_history = [f_history, f_new];
        
        % Check for convergence
        if norm(x_new - x) < tol
            break;
        end
        
        % Update next iteration
        if f_new < f(x)
            mu = max(mu / 3, 1e-7);  % Gradual decrease
        else
            mu = mu * 2;  % Increase otherwise
        end

        x = x_new;  
    end
end
