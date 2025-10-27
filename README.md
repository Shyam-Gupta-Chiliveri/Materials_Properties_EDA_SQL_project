# 🧪 Steel Material Properties Analysis

**Author:** Data Science Student  
**Date:** October 20, 2025  
**Dataset:** `complete_axle_test_with_chemistry_311_samples.csv`

---

## 📘 Project Overview

This project performs a **complete end-to-end data science workflow** on steel axle material testing data.  
The goal is to analyze how **material composition and heat treatment processes** affect **mechanical performance** — specifically, hardness, bending force, and ductility.

It includes:
- **Data cleaning and preprocessing**
- **Exploratory Data Analysis (EDA)** using Python
- **Feature engineering**
- **Statistical insights and correlation analysis**
- **SQL-based analytical questions**

---

## 🎯 Research Objectives

1. **Impact of Material & Manufacturing Process**  
   → How do *material type* (4Cr13 vs X46CrS13) and *processing steps* (die-casting, tempering) affect hardness, bending force, and ductility?

2. **Chemical Composition Effects**  
   → How do *Cr, Mn, Si,* and *C* content influence *brittleness* and *bending strength*?

---

## 🧹 Data Cleaning Summary

| Step | Action | Result |
|------|---------|--------|
| 1 | Removed constant column (`Hardening and Quenching`) | Reduced redundancy |
| 2 | Converted categorical columns to `category` dtype | Optimized memory |
| 3 | Created new features | `Has_Tempering`, `HV10_Range`, `Bending_Force_Range` |
| 4 | Checked for missing, duplicates, negatives | None found ✅ |
| 5 | Reorganized columns | Logical order for analysis |

**Final dataset:** `311 rows × 26 columns`  
**Saved as:** `cleaned_data.csv`

---

## 📊 Exploratory Data Analysis (EDA)

### **Univariate Analysis**
- Distribution plots for hardness, bending force, ductility, brittleness  
- Statistical summaries (mean, median, IQR, skewness)  
- Visualized categorical frequencies for material, tempering, die-casting  

### **Bivariate Analysis**
- Compared mechanical properties by material and process  
- Correlation heatmaps and scatterplots  
- Found strong relationships:
  - Hardness ↓ → Bending Force ↑
  - Hardness ↓ → Ductility ↑  
  - Bending Force ↑ ↔ Ductility ↑ (r ≈ 0.86)

### **Key Visuals**
- Dual-axis comparison of hardness vs bending force & ductility  
- Correlation heatmap for mechanical variables  
- Bar plots of material and tempering distributions  

---

## 📐 Key Findings

### ⭐ Tempering Impact
| Metric | Change After Tempering |
|---------|------------------------|
| Bending Force | **+58%** |
| Ductility | **+63%** |
| Hardness | **−8%** |

**Optimal:** Vacuum tempering at 230°C → 6,715 N bending force & 43% ductility.

### ⚙️ Material Comparison
| Material | Hardness | Bending Force | Ductility |
|-----------|-----------|---------------|------------|
| 4Cr13 | Higher hardness | Lower force | Lower ductility |
| X46CrS13 | Slightly softer | Higher force | More ductile ✅ |

### ⚠️ Trade-Off
- Hardness vs Ductility: **r = −0.795**  
- Must choose between **surface hardness** or **flexibility**.

---

## 💾 SQL Questions Developed

Example queries designed for database exploration:

1. Average hardness by material type  
2. Impact of tempering on bending force  
3. Chemical composition vs mechanical strength  
4. Identify samples with highest ductility  
5. Compare die-casting vs non-die-casting samples  

*(Full list of 15 SQL questions provided in the notebook.)*

---

## 🧠 Recommendations

| Goal | Material | Process | Notes |
|------|-----------|----------|-------|
| **Maximum Hardness** | 4Cr13 | No tempering | Suitable for tools |
| **Maximum Flexibility** | 4Cr13 | Vacuum tempering at 230°C | Best ductility and strength | To match X46CrS13 material properties
| **Balanced Design** | X46CrS13 | Controlled tempering | Good trade-off |

---

## 🧰 Technologies Used

| Category | Tools / Libraries |
|-----------|------------------|
| **Language** | Python 3.x |
| **Data Handling** | pandas, numpy |
| **Visualization** | matplotlib, seaborn |
| **Analysis** | SQL (query development) |
| **Environment** | Jupyter Notebook |

---

## 📂 Repository Structure

```
📁 Steel-Material-Analysis/
│
├── 📄 Steel_Material_Analysis.ipynb     # Main project notebook
├── 📄 cleaned_data.csv                  # Processed dataset
├── 📄 README.md                         # Project documentation
├── 📊 analysis_output.png               # Visualization export
└── 📁 data/
    └── complete_axle_test_with_chemistry_311_samples.csv
```

---

## ✅ Project Status

| Stage | Status |
|--------|---------|
| Data Cleaning | ✅ Completed |
| EDA & Visualization | ✅ Completed |
| SQL Questions | ✅ Completed |
| Statistical Insights | ✅ Completed |
| Modeling / ML | ⏳ Future work |

---

## 🚀 Future Improvements
- Perform hypothesis testing (ANOVA, t-tests)
- Build regression or classification models
- Create an interactive dashboard (e.g., Power BI, Streamlit)
- Automate SQL query execution

---

