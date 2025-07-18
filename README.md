# Numerical Optimization Algorithms

MATLAB implementations of numerical optimization algorithms, covering univariate, multivariate, and constrained optimization. Each part focuses on applying specific methods to minimize mathematical functions under various conditions and parameters.

Developed as part of the course *Optimization Techniques* at the Aristotle University of Thessaloniki (AUTH), School of Electrical & Computer Engineering.

---

## 📘 Part 1: Univariate Optimization

**Goal:** Minimize three convex one-dimensional functions over fixed intervals using both derivative-free and derivative-based methods.

### 🔍 Methods Implemented:
- **Bisection Method** (without derivative)
- **Bisection Method with derivative**
- **Golden Section Search**
- **Fibonacci Search**

### 🧪 Applied To:
Each method is applied to three convex functions defined on an interval \([a, b]\), with varying:
- Interval tolerance `l`
- Accuracy parameter `ε`

### 🔧 Tasks:
- Compare performance via iteration count and function evaluations
- Plot convergence behavior for all methods
- Analyze robustness and sensitivity to parameter choices

---

## 📘 Part 2: Multivariate Optimization

**Goal:** Minimize the two-variable function:

`f(x, y) = x^5 · e^(−(x² + y²))`

### 🔍 Methods Implemented:
- **Steepest Descent** (Gradient Descent)
- **Newton's Method**
- **Levenberg–Marquardt Algorithm**

### 🚀 Initialization:
Each method is tested from different starting points:
- (0, 0)
- (−1, 1)
- (1, −1)

### 🧭 Step Size Strategies:
- Fixed step size
- **Exact Line Search** using Bisection
- **Armijo Rule**

### 🔧 Tasks:
- Evaluate convergence for each method–point–strategy combination
- Analyze convergence speed, stability, and optimization paths
- Visualize and interpret convergence surfaces and trajectories

---

## 📘 Part 3: Constrained Optimization

**Goal:** Minimize a quadratic function under box constraints using a projected gradient approach.

### 📉 Function:

`f(x₁, x₂) = (1/3)x₁² + 3x₂²`


### 📐 Constraints (Box):
- −10 ≤ x₁ ≤ 5  
- 0 ≤ x₂ ≤ 10


### 🔍 Method Implemented:
- **Projected Gradient Descent**
  - Uses projection operator \( \text{Pr}_X \{\cdot\} \) to enforce feasibility

### 🧪 Experiments:
- Test with different step sizes `s` and interpolation factors `γ`
- Explore behavior from different starting points (e.g. (4, 5), (5, −5), (−5, 10))
- Assess convergence, constraint satisfaction, and oscillatory behavior

### 🧠 Key Insight:
Stability depends on keeping \( s \cdot \gamma \) below a theoretical threshold (e.g., \( < \frac{1}{3} \))

---

## 📊 Tools and Languages

- MATLAB (R2021b or newer recommended)
- Plotting utilities for convergence and trajectory visualization

## 🚀 How to Run

To be added soon.

---

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
│ └── plots/ # Convergence behavior and step comparisons
│
├── part3-projection-method/
│ ├── projected_gradient_descent.m
│ ├── constraints.m
│ └── plots/ # Iteration paths under box constraints
│
└── README.md
```

---

## ✍️ Author

**Panagiotis Koutris**  
Student at ECE AUTH – School of Electrical & Computer Engineering

---

## 📄 License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

