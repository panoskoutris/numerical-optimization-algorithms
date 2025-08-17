# Numerical Optimization Algorithms

MATLAB implementations of numerical optimization algorithms, covering univariate, multivariate, and constrained optimization. Each part focuses on applying specific methods to minimize mathematical functions under various conditions and parameters.

Developed as part of the course **Optimization Techniques** at the Aristotle University of Thessaloniki (AUTH), School of Electrical & Computer Engineering.

---

##  Part 1: Univariate Optimization

**Goal:** Minimize three convex one-dimensional functions over fixed intervals using both derivative-free and derivative-based methods.

###  Methods Implemented:
- **Bisection Method** (without derivative)
- **Bisection Method with derivative**
- **Golden Section Search**
- **Fibonacci Search**

###  Applied To:
Each method is applied to three convex functions defined on an interval \([a, b]\), with varying:
- Interval tolerance `l`
- Accuracy parameter `ε`

###  Tasks:
- Compare performance via iteration count and function evaluations
- Plot convergence behavior for all methods
- Analyze robustness and sensitivity to parameter choices

---

## Part 2: Multivariate Optimization

**Goal:** Minimize the two-variable function:

`f(x, y) = x^5 · e^(−(x² + y²))`

###  Methods Implemented:
- **Steepest Descent** (Gradient Descent)
- **Newton's Method**
- **Levenberg–Marquardt Algorithm**

###  Initialization:
Each method is tested from different starting points:
- (0, 0)
- (−1, 1)
- (1, −1)

###  Step Size Strategies:
- Fixed step size
- **Exact Line Search** using Bisection
- **Armijo Rule**

###  Tasks:
- Evaluate convergence for each method–point–strategy combination
- Analyze convergence speed, stability, and optimization paths
- Visualize and interpret convergence surfaces and trajectories

---

##  Part 3: Constrained Optimization

**Goal:** Minimize a quadratic function under box constraints using a projected gradient approach.

###  Function:

`f(x₁, x₂) = (1/3)x₁² + 3x₂²`


###  Constraints (Box):
- −10 ≤ x₁ ≤ 5  
- 0 ≤ x₂ ≤ 10


###  Method Implemented:
- **Projected Gradient Descent**
  - Uses projection operator Prₓ{·}  to enforce feasibility

###  Experiments:
- Test with different step sizes `s` and interpolation factors `γ`
- Explore behavior from different starting points (e.g. (4, 5), (5, −5), (−5, 10))
- Assess convergence, constraint satisfaction, and oscillatory behavior

###  Key Insight:
Stability depends on keeping *s · γ*  below a theoretical threshold (e.g., less than 1/3)

---

##  Tools and Languages

- MATLAB
- Symbolic Math Toolbox
- Plotting utilities for convergence and trajectory visualization

---

##  Repository Structure

```
numerical-optimization-algorithms
├── part1-univariate-methods                  # Univariate unconstrained optimization algorithms and comparisons
│   ├── src
│   │   ├── bisection_bounds.m                # Plots interval bounds [a_k, b_k] during bisection method iterations
│   │   ├── bisection_derivative_bounds.m     # Plots interval bounds [a_k, b_k] during bisection with derivative method iterations
│   │   ├── bisection_derivative_vs_l.m       # Compares evaluation count vs l for bisection method with derivative
│   │   ├── bisection_vs_e.m                  # Compares evaluation count vs ε for bisection method
│   │   ├── bisection_vs_l.m                  # Compares evaluation count vs l for bisection method
│   │   ├── fibonacci_bounds.m                # Plots interval bounds [a_k, b_k] during Fibonacci method iterations
│   │   ├── fibonacci_vs_l.m                  # Compares evaluation count vs l for Fibonacci method
│   │   ├── golden_section_bounds.m           # Plots interval bounds [a_k, b_k] during ggolden section method iterations
│   │   ├── golden_section_vs_l.m             # Compares evaluation count vs l for Golden Section method
│   └── report1.pdf                           # Report for Part 1
│
├── part2-multivariate-methods                # Multivariate (2-D) unconstrained optimization algorithms and comparisons
│   ├── src
│   │   ├── armijo_rule.m                     # Implements Armijo line search rule
│   │   ├── bisection.m                       # Bisection search function for multivariate methods
│   │   ├── check_hessian_pos_def.m           # Checks whether the Hessian is positive definite at given points
│   │   ├── levenberg_marquardt.m             # Levenberg-Marquardt method function with multiple step strategies
│   │   ├── levenberg_marquardt_comparison.m  # Runs L-M with different γ rules and starting points and compares convergence
│   │   ├── newton.m                          # Newton's method function with optional Armijo or bisection line search
│   │   ├── steepest_descent.m                # Steepest descent with configurable γ (fixed, bisection, Armijo)
│   │   ├── steepest_descent_comparison.m     # Runs steepest descent with different γ rules and starting points and compares convergence
│   │   ├── visualize_function.m              # Plots 3D surface and contour of the main test function
│   └── report2.pdf                           # Report for Part 2
│
├── part3-projection-method                   # Multivariate box-constrained optimization algorithm and comparisons using projected method
│   ├── src
│   │   ├── run_constrained_steepest_descent_1.m  # Steepest descent from x₀ = [5; -5]
│   │   ├── run_constrained_steepest_descent_2.m  # Same method from x₀ = [-5; 10]
│   │   ├── run_constrained_steepest_descent_3.m  # Same method from x₀ = [8; -10]
│   │   ├── run_steepest_descent_vs_gamma.m       # Runs basic steepest descent with varying γ values 
│   │   ├── steepest_descent.m                    # Unconstrained steepest descent method function 
│   │   ├── steepest_descent_with_constraints.m   # Unconstrained steepest descent method function 
│   │   ├── visualize_function.m                  # Plots 2D quadratic test function 
│   └── report3.pdf                           # Report for Part 3
│
└── README.md                                 # Repository overview and instructions


```

---

##  Author

**Panagiotis Koutris**  
Undergraduate at ECE AUTH – School of Electrical & Computer Engineering

---

##  License

Licensed under the [Apache 2.0 License](https://www.apache.org/licenses/LICENSE-2.0.html).

