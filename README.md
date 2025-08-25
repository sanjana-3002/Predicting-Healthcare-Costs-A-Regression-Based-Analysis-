# Predicting Healthcare Costs — A Regression-Based Analysis

Estimate individual **medical charges** from demographics and risk factors using **interpretable regression**. This repo summarizes the workflow and gives you a clean path to reproduce the analysis.

---

## Project Goals

* Build an **interpretable regression** model to predict healthcare charges.
* Diagnose and address **heteroscedasticity**, **multicollinearity**, and **influential points**.
* Provide a transparent baseline that policy, pricing, or care-management teams can understand and extend.

---

## Dataset

* Commonly used **medical cost** dataset (features include: `age`, `sex`, `bmi`, `children`, `smoker`, `region`, and target `charges`).
* Categorical features are one-hot encoded; `smoker` is converted to a binary indicator.

> Place `insurance.csv` (or your dataset) in `data/`.

---

## Key Findings

* **Smoking** status is the **strongest positive driver** of charges (controlling for other factors).
* **BMI** and **Age** have positive associations with charges.
* **Variance is not constant** under raw OLS; **log-transforming** `charges` and/or using **WLS** improves assumptions and stability.
* Final models remain **interpretable**, suitable for decision support.

---

## Modeling Approach

1. **EDA** → distributions, missingness, transformations.
2. **Baseline OLS** → `charges ~ age + bmi + smoker + children + sex + region`.
3. **Diagnostics** → residual plots, Q–Q, **VIF**, **Cook’s distance**.
4. **Refinements** → `log(charges)` and/or **WLS** (variance stabilization), retain significant predictors.
5. **Evaluation** → R²/Adj-R², RMSE/MAE (hold-out), coefficient CIs & p-values.

---

## Quickstart

```bash
# 1) Place your CSV in data/
# 2) add .R file from this README structure
# 3) Open in R.
```

---

## Diagnostics & Improvements

* **Heteroscedasticity:** Inspect residuals vs fitted; prefer `log(charges)` or **WLS**.
* **Normality:** Q–Q plots; log-target typically improves tails.
* **Multicollinearity:** Check **VIF**; drop/merge redundant dummies if needed.
* **Influential points:** Leverage vs residuals & **Cook’s distance**; report with and without high-influence cases.
* **Validation:** Hold-out or k-fold; report **RMSE/MAE** alongside R²/Adj-R².

---

## Policy & Pricing Insights

* **Target prevention:** Smoking cessation has outsized cost impact.
* **Risk adjustment:** **Age** and **BMI** should be central to pricing and proactive care programs.
* **Governance:** Favor **transparent models**; introduce non-linearities only when diagnostics justify.

---

## Roadmap

* [ ] Publish full notebooks (EDA → OLS → log/WLS → diagnostics).
* [ ] Add **k-fold CV**, robust SEs, and calibration plots.
* [ ] Explore **splines** for age/BMI and **regularization** (Lasso/Ridge).
* [ ] Ship a small **Streamlit** app for scenario testing.

