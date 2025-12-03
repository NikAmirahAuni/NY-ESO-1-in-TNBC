# 📊 Meta-Analysis: NY-ESO-1 Expression Prevalence in TNBC

This folder contains a meta-analysis of NY-ESO-1 expression across multiple studies in triple-negative breast cancer (TNBC).

## 📋 Contents

- `meta_analysis.R` - R script for meta-analysis
- `NY-ESO-1_Meta-Analysis_Results` - Excel output with all tables

## 🎯 Objective

To calculate the pooled prevalence of NY-ESO-1 expression in TNBC across 12 published studies.

## 📊 Included Studies

| Study | Region | Sample Size | Antibody | Prevalence |
|-------|--------|-------------|----------|------------|
| Ademuyiwa et al [16] | USA | 168 | E978 | 16.0% |
| Tessari et al [26] | Italy | 26 | E978 | 24.0% |
| Lee et al [27] | Korea | 612 | NA | 9.7% |
| Curigliano et al [65] | Italy | 50 | E978 | 18.0% |
| Chen et al [67] | USA | 225 | E978 | 19.1% |
| Mrklic et al [68] | Croatia | 83 | D8.38 | 27.1% |
| Hamai et al [69] | France | 42 | E978 | 24.0% |
| Raghavendra et al [70] | Australia | 65 | sc53869 | 17.0% |
| Ceprnja et al [72] | Croatia | 97 | D8.38 | 38.0% |
| Xiao et al [117] | China | 51 | E978 | 11.8% |
| See et al [126] | USA | 76 | E978 | 5.0% |
| Tanja et al [127] | Croatia | 50 | B.9.8.1.1 | 10.0% |

**Total:** 12 studies, 1,595 TNBC patients

## 🔬 Methods

**Software:**
- R version 4.5.1
- Package: `meta` (meta-analysis)
- Package: `writexl` (Excel export)
- Figure editing: Inkscape v1.4.2 (for post-processing)

**Statistical Approach:**
- **Model:** Random-effects meta-analysis
- **Estimator:** Maximum Likelihood for τ²
- **Confidence Intervals:** Hartung-Knapp adjustment
- **Summary Measure:** Logit-transformed proportions (PLOGIT)
- **Study-level CI:** Normal approximation (NAsm)

**Analyses Performed:**
1. **Pooled prevalence estimation**
2. **Heterogeneity assessment**
   - I² statistic with 95% CI
   - Cochran's Q test
   - τ² (between-study variance)
3. **Publication bias testing**
   - Funnel plot
   - Egger's regression test (minimum k=10 studies)
   - Trim-and-fill analysis
4. **Subgroup analyses:**
   - By antibody clone (E978 vs D8.38)
   - By study size (large ≥100 vs small <100)
   - By geographic region (Asia-Pacific vs Western countries)
5. **Influence analysis** (leave-one-out sensitivity analysis)

## 🚀 How to Run

### Requirements
```r
install.packages("meta")
install.packages("writexl")
```

### Usage
```r
# Set working directory
setwd("path/to/meta-analysis/")

# Run the script
source("meta_analysis.R")
```

### Outputs

The script generates:
#### Excel File
📁 `results/NY-ESO-1_Meta_Analysis_Results.xlsx`

Contains 5 sheets:
- **Individual_Studies** - Study-level data and weights
- **Pooled_Results** - Overall and subgroup pooled estimates
- **Heterogeneity** - I², Q, τ² statistics with 95% CIs
- **Publication_Bias** - Egger's test and trim-and-fill results
- **Subgroup_Tests** - Comparison tests between subgroups

#### Figures
📁 `figures/` directory (PNG @ 300 DPI and PDF formats)

- **Figure 6A:** Main forest plot with pooled estimate
- **Figure 6B:** Funnel plot for publication bias assessment
- **Figure 6C:** Subgroup analysis by antibody clone
- **Figure 6D:** Subgroup analysis by study size
- **Figure 6E:** Subgroup analysis by geographic region
- **Figure 6F:** Influence analysis (leave-one-out)

All figures are also displayed in RStudio Plots pane during execution.

## 📈 Key Results

**Pooled Prevalence:** 16.8% (95% CI: 10.5% - 21.6%)

**Heterogeneity:** I² = 83.7% (substantial heterogeneity)
- τ² = 0.278
- Q = 67.6 (p < 0.0001)

**Publication Bias:** 
- Egger's test: p = 0.796 (no significant bias detected)
- Trim-and-Fill: 0 studies imputed, adjusted prevalence = 17.3% (95% CI: 12.3-23.7%)

**Subgroup Findings:**
- **E978 vs D8.38 antibody:** 32.6% vs 15.9% (p < 0.0001) - Significant difference
- **Large vs Small studies:** 17.8% vs 14.1% (p = 0.373) - No significant difference
- **Asia-Pacific vs Western Countries:** 18.7% vs 10.4% (p = 0.005) - Significant difference

**Interpretation:**
- Moderate NY-ESO-1 expression prevalence in TNBC (16.8%)
- Substantial heterogeneity across studies
- Detection method (antibody clone) significantly affects prevalence estimates
- Geographic variation suggests potential ethnic/population differences
- No publication bias detected - pooled estimate of 16.8% is stable and unbiased

## 📚 References

See main README for complete citations to all included studies.

## 📄 License

CC BY 4.0 - See main repository LICENSE
