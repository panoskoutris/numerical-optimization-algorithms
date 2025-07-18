# Numerical Optimization Algorithms

MATLAB implementations of numerical optimization algorithms, covering univariate, multivariate, and constrained optimization. Each part focuses on applying specific methods to minimize given mathematical functions under various conditions and parameters.

Developed as part of the course Optimization Techniques at the Aristotle University of Thessaloniki (AUTH), School of Electrical & Computer Engineering.

## 📘 Part 1: Univariate Optimization

**Goal:** Minimize three convex one-dimensional functions over fixed intervals using derivative-free and derivative-based methods.

### 🔍 Methods Implemented:

- **Bisection Method** (without derivative)
- **Bisection Method with derivative**
- **Golden Section Search**
- **Fibonacci Search**

### 🧪 Applied To:
Each method is tested on 3 different convex functions defined on a closed interval \([a, b]\), with varying:
- Interval tolerance `l`
- Accuracy parameter `ε`

### 🔧 Tasks:
- Compare performance by iteration count and function evaluations
- Plot convergence behavior across all methods
- Analyze robustness and sensitivity to parameter changes

---

## 📘 Part 2: Multivariate Optimization

**Goal:** Minimize the two-variable function:
\[
f(x, y) = x^5 \cdot e^{-(x^2 + y^2)}
\]

### 🔍 Methods Implemented:

- **Steepest Descent** (Gradient Descent)
- **Newton's Method**
- **Levenberg–Marquardt Algorithm**

### 🚀 Initialization:
Each method is tested from the following starting points:
- (0, 0)
- (−1, 1)
- (1, −1)

### 🧭 Step Size Strategies:
- Fixed step size
- **Exact Line Search** using Bisection
- **Armijo Rule**

### 🔧 Tasks:
- Evaluate convergence for each method–point–strategy combination
- Analyze convergence speed, stability, and path taken
- Visualize and interpret convergence surfaces and trajectories

---

## 📘 Part 3: Constrained Optimization

**Goal:** Minimize a quadratic function with projection to satisfy box constraints.

### 📉 Function:
\[
f(x_1, x_2) = \frac{1}{3}x_1^2 + 3x_2^2
\]

### 📐 Constraints (Box):
- \(-10 \leq x_1 \leq 5\)
- \(0 \leq x_2 \leq 10\)

### 🔍 Method Implemented:

- **Projected Gradient Descent**
  - Uses projection operator \( \text{Pr}_X \{\cdot\} \) to ensure feasibility

### 🧪 Experiments:
- Run the algorithm with different step sizes `s` and interpolation factors `γ`
- Apply method from different starting points: e.g. (4,5), (5, -5), (−5, 10)
- Assess convergence, feasibility, and oscillatory behavior

### 🧠 Key Insight:
Stability and convergence depend heavily on the product \( s \cdot \gamma \) staying below a derived theoretical threshold (e.g. \( < \frac{1}{3} \))

---

## 📊 Tools and Languages

- MATLAB (R2021b or newer recommended)
- Plotting utilities for convergence and trajectory visualization

## 🚀 How to Run

TO BE IMPLEMENTED

## 📁 Repository Structure

```
numerical-optimization-algorithms/
├── part1-univariate-methods/
│ ├── bisection.m
│ ├── bisection_with_derivative.m
│ ├── golden_section.m
│ ├── fibonacci.m
│ └── plots/ # Convergence plots for different l and ε
│
├── part2-multivariate-methods/
│ ├── steepest_descent.m
│ ├── newton_method.m
│ ├── levenberg_marquardt.m
│ ├── line_search_strategies.m
│ └── plots/ # Convergence behavior for different step rules and starting points
│
├── part3-projection-method/
│ ├── projected_gradient_descent.m
│ ├── constraints.m
│ └── plots/ # Iteration paths and convergence under box constraints
│
└── README.md
```
## ✍️ Author

**Panagiotis Koutris**  
Student at ECE AUTH – School of Electrical & Computer Engineering


## 📄 License

This project is released under the MIT License.

