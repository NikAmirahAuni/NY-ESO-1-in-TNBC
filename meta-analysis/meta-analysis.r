library(meta)
library(writexl)

setwd("C:/Users/user/Documents/PhD/Paper/Review Paper/NY-ESO-1_A Promising Immunotherapeutic Target in Triple-Negative Breast Cancer/meta-analysis")

# Helper function to back-transform from logit to proportion
invlogit <- function(x) {
  exp(x) / (1 + exp(x))
}

# Data - Please verify that they are accurate according to each study (the reference number [16] etc) 
study_id <- c("Ademuwiya et al [16]", "Tessari et al [27]", "Lee et al [28]", "Curigliano et al [69]", "Chen et al [71]", 
              "Mrklic et al [72]", "Hamai et al [73]", "Raghavendra et al [74]", "Ceprnja et al [76]", "Xiao et al [121]", "See et al [130]", "Badovinac Crnjevic et al [131]")

events_percent <- c(16, 24, 9.7, 18, 19.1, 27.1, 24, 17, 38, 11.8, 5, 10) # NY-ESO-1-positive in %
n <- c(168, 26, 612, 50, 225, 83, 42, 65, 97, 51, 76, 50) # Sample size

# Convert percentages to actual counts
events <- round((events_percent / 100) * n)

region <- c("USA", "Italy", "Korea", "Italy", "USA", 
            "Croatia", "France", "Australia", "Croatia", "China", "USA", "Croatia")

antibody <- c("E978", "E978", "NA", "E978", "E978", 
              "D8.38", "E978", "sc53869", "D8.38", "E978", "E978", "B.9.8.1.1")

size_category <- ifelse(n >= 100, "Large (n≥100)", "Small (n<100)")

# Diagnostic check
cat("\nStudy size breakdown:\n")
print(table(size_category))
cat("\nTotal studies:", length(study_id), "\n")

# Perform meta-analysis of proportions
meta_prop <- metaprop(
    event = events,
    n = n,
    studlab = study_id,
    common = FALSE,
    random = TRUE,
    method.ci = "NAsm",
    sm = "PLOGIT",
    method.tau = "ML",
    method.random.ci = "HK",
    title = "NY-ESO-1 Expression Prevalence in TNBC"
)

# Display results
summary(meta_prop)

# Figure 6A: Forest plot - SHOWS IN RSTUDIO PLOTS PANE
# Calculate weights for display
se_logit_display <- (meta_prop$upper - meta_prop$lower) / (2 * 1.96)
tau2_display <- meta_prop$tau^2
weights_display <- 1 / (se_logit_display^2 + tau2_display)
weights_percent_display <- (weights_display / sum(weights_display)) * 100

# Temporarily add weights to meta object for display
meta_prop_display <- meta_prop
meta_prop_display$w.random <- weights_percent_display

forest(meta_prop_display,
       xlim = c(0, 0.5),
       rightcols = c("effect", "ci", "w.random"),
       rightlabs = c("Prevalence", "95% CI", "Weight (%)"),
       leftcols = c("studlab", "event", "n"),
       leftlabs = c("Study", "Events", "Total"),
       xlab = "Prevalence",
       smlab = "",
       weight.study = "random",
       squaresize = 0.5,
       col.square = "navy",
       col.square.lines = "navy",
       col.diamond = "maroon",
       col.diamond.lines = "maroon",
       pooled.totals = TRUE,
       common = FALSE,
       fs.hetstat = 10,
       print.tau2 = TRUE,
       print.Q = TRUE,
       print.pval.Q = TRUE,
       print.I2 = TRUE,
       digits = 2,
       digits.weight = 1)

# Figure 6B: Funnel plot
funnel(meta_prop,
       studlab = TRUE,
       pch = 16,
       col = "navy",
       cex = 1.2,
       main = "Funnel Plot for Publication Bias Assessment")

# Egger's test
eggers_test <- metabias(meta_prop, method.bias = "Egger", k.min = 10)
print(eggers_test)

# Figure 6C: Subgroup by antibody
antibody_subset <- antibody %in% c("E978", "D8.38")
meta_antibody <- metaprop(
    event = events[antibody_subset],
    n = n[antibody_subset],
    studlab = study_id[antibody_subset],
    subgroup = antibody[antibody_subset],
    common = FALSE,
    random = TRUE,
    method.ci = "NAsm",
    sm = "PLOGIT",
    method.tau = "ML",
    method.random.ci = "HK",
    title = "Subgroup Analysis by Antibody Clone"
)

forest(meta_antibody,
       xlim = c(0, 0.6),
       rightcols = c("effect", "ci"),
       xlab = "Prevalence",
       test.subgroup = TRUE,
       print.subgroup.name = TRUE,
       common = FALSE)

print(meta_antibody)

# Figure 6D: Subgroup by study size
meta_size <- metaprop(
    event = events,
    n = n,
    studlab = study_id,
    subgroup = size_category,
    common = FALSE,
    random = TRUE,
    method.ci = "NAsm",
    sm = "PLOGIT",
    method.tau = "ML",
    method.random.ci = "HK",
    title = "Subgroup Analysis by Study Size"
)

forest(meta_size,
       xlim = c(0, 0.5),
       rightcols = c("effect", "ci"),
       xlab = "Prevalence",
       test.subgroup = TRUE,
       print.subgroup.name = TRUE,
       common = FALSE)

print(meta_size)

# Figure 6E: Subgroup by geographic region
region_grouped <- ifelse(region %in% c("Korea", "China", "Australia"), "Asia-Pacific",
                  ifelse(region %in% c("USA", "Croatia", "France", "Italy"), "Western Countries", 
                  region))

meta_region <- metaprop(
    event = events,
    n = n,
    studlab = study_id,
    subgroup = region_grouped,
    common = FALSE,
    random = TRUE,
    method.ci = "NAsm",
    sm = "PLOGIT",
    method.tau = "ML",
    method.random.ci = "HK",
    title = "Subgroup Analysis by Geographic Region"
)

forest(meta_region,
       xlim = c(0, 0.5),
       rightcols = c("effect", "ci"),
       xlab = "Prevalence",
       test.subgroup = TRUE,
       print.subgroup.name = TRUE,
       common = FALSE)

print(meta_region)

# Influence analysis
inf <- metainf(meta_prop)
forest(inf)

# ============================================
# SAVE ALL FIGURES
# ============================================

# Create output directory for figures
dir.create("figures", showWarnings = FALSE)

# Close any existing graphics devices to prevent viewport errors
while (dev.cur() > 1) dev.off()

# Figure 6A: Main forest plot
png("figures/Figure_6A_Forest_Plot.png", width = 3000, height = 2400, res = 300)
# Calculate weights for display
se_logit_display <- (meta_prop$upper - meta_prop$lower) / (2 * 1.96)
tau2_display <- meta_prop$tau^2
weights_display <- 1 / (se_logit_display^2 + tau2_display)
weights_percent_display <- (weights_display / sum(weights_display)) * 100

# Temporarily add weights to meta object for display
meta_prop_display <- meta_prop
meta_prop_display$w.random <- weights_percent_display

forest(meta_prop_display,
       xlim = c(0, 0.5),
       rightcols = c("effect", "ci", "w.random"),
       rightlabs = c("Prevalence", "95% CI", "Weight (%)"),
       leftcols = c("studlab", "event", "n"),
       leftlabs = c("Study", "Events", "Total"),
       xlab = "Prevalence",
       smlab = "",
       weight.study = "random",
       squaresize = 0.5,
       col.square = "navy",
       col.square.lines = "navy",
       col.diamond = "maroon",
       col.diamond.lines = "maroon",
       pooled.totals = TRUE,
       common = FALSE,
       fs.hetstat = 10,
       print.tau2 = TRUE,
       print.Q = TRUE,
       print.pval.Q = TRUE,
       print.I2 = TRUE,
       digits = 2,
       digits.weight = 1)
dev.off()
while (dev.cur() > 1) dev.off()  # Extra cleanup

# Figure 6B: Funnel plot
png("figures/Figure_6B_Funnel_Plot.png", width = 2400, height = 2400, res = 300)
funnel(meta_prop,
       studlab = TRUE,
       pch = 16,
       col = "navy",
       cex = 1.2,
       main = "Funnel Plot for Publication Bias Assessment")
dev.off()
while (dev.cur() > 1) dev.off()  # Extra cleanup

# Figure 6C: Antibody subgroup
png("figures/Figure_6C_Antibody_Subgroup.png", width = 3000, height = 2400, res = 300)
forest(meta_antibody,
       xlim = c(0, 0.6),
       rightcols = c("effect", "ci"),
       xlab = "Prevalence",
       test.subgroup = TRUE,
       print.subgroup.name = TRUE,
       common = FALSE)
dev.off()
while (dev.cur() > 1) dev.off()  # Extra cleanup

# Figure 6D: Study size subgroup
png("figures/Figure_6D_Study_Size_Subgroup.png", width = 3000, height = 2400, res = 300)
forest(meta_size,
       xlim = c(0, 0.5),
       rightcols = c("effect", "ci"),
       xlab = "Prevalence",
       test.subgroup = TRUE,
       print.subgroup.name = TRUE,
       common = FALSE)
dev.off()
while (dev.cur() > 1) dev.off()  # Extra cleanup

# Figure 6E: Geographic region subgroup
png("figures/Figure_6E_Geographic_Subgroup.png", width = 3000, height = 2400, res = 300)
forest(meta_region,
       xlim = c(0, 0.5),
       rightcols = c("effect", "ci"),
       xlab = "Prevalence",
       test.subgroup = TRUE,
       print.subgroup.name = TRUE,
       common = FALSE)
dev.off()
while (dev.cur() > 1) dev.off()  # Extra cleanup

# Figure 6F: Influence analysis
png("figures/Figure_6F_Influence_Analysis.png", width = 3000, height = 3000, res = 300)
forest(inf)
dev.off()
while (dev.cur() > 1) dev.off()  # Extra cleanup

# Also save as PDF (vector graphics, better for publication)
pdf("figures/Figure_6A_Forest_Plot.pdf", width = 10, height = 8)
# Calculate weights for display
se_logit_display <- (meta_prop$upper - meta_prop$lower) / (2 * 1.96)
tau2_display <- meta_prop$tau^2
weights_display <- 1 / (se_logit_display^2 + tau2_display)
weights_percent_display <- (weights_display / sum(weights_display)) * 100

# Temporarily add weights to meta object for display
meta_prop_display <- meta_prop
meta_prop_display$w.random <- weights_percent_display

forest(meta_prop_display,
       xlim = c(0, 0.5),
       rightcols = c("effect", "ci", "w.random"),
       rightlabs = c("Prevalence", "95% CI", "Weight (%)"),
       leftcols = c("studlab", "event", "n"),
       leftlabs = c("Study", "Events", "Total"),
       xlab = "Prevalence",
       smlab = "",
       weight.study = "random",
       squaresize = 0.5,
       col.square = "navy",
       col.square.lines = "navy",
       col.diamond = "maroon",
       col.diamond.lines = "maroon",
       pooled.totals = TRUE,
       common = FALSE,
       fs.hetstat = 10,
       print.tau2 = TRUE,
       print.Q = TRUE,
       print.pval.Q = TRUE,
       print.I2 = TRUE,
       digits = 2,
       digits.weight = 1)
dev.off()
while (dev.cur() > 1) dev.off()  # Extra cleanup

pdf("figures/Figure_6B_Funnel_Plot.pdf", width = 8, height = 8)
funnel(meta_prop,
       studlab = TRUE,
       pch = 16,
       col = "navy",
       cex = 1.2,
       main = "Funnel Plot for Publication Bias Assessment")
dev.off()
while (dev.cur() > 1) dev.off()  # Extra cleanup

pdf("figures/Figure_6C_Antibody_Subgroup.pdf", width = 10, height = 8)
forest(meta_antibody,
       xlim = c(0, 0.6),
       rightcols = c("effect", "ci"),
       xlab = "Prevalence",
       test.subgroup = TRUE,
       print.subgroup.name = TRUE,
       common = FALSE)
dev.off()
while (dev.cur() > 1) dev.off()  # Extra cleanup

pdf("figures/Figure_6D_Study_Size_Subgroup.pdf", width = 10, height = 8)
forest(meta_size,
       xlim = c(0, 0.5),
       rightcols = c("effect", "ci"),
       xlab = "Prevalence",
       test.subgroup = TRUE,
       print.subgroup.name = TRUE,
       common = FALSE)
dev.off()
while (dev.cur() > 1) dev.off()  # Extra cleanup

pdf("figures/Figure_6E_Geographic_Subgroup.pdf", width = 10, height = 8)
forest(meta_region,
       xlim = c(0, 0.5),
       rightcols = c("effect", "ci"),
       xlab = "Prevalence",
       test.subgroup = TRUE,
       print.subgroup.name = TRUE,
       common = FALSE)
dev.off()
while (dev.cur() > 1) dev.off()  # Extra cleanup

pdf("figures/Figure_6F_Influence_Analysis.pdf", width = 10, height = 10)
forest(inf)
dev.off()
while (dev.cur() > 1) dev.off()  # Extra cleanup

cat("\n✓ All figures saved to 'figures/' directory (PNG and PDF formats)\n")

# ============================================
# EXPORT RESULTS TO EXCEL - WITH BACK-TRANSFORMATION
# ============================================

# Table 1: Individual study results
# Calculate standard errors from confidence intervals (on logit scale)
se_logit <- (meta_prop$upper - meta_prop$lower) / (2 * 1.96)

# Calculate inverse variance weights (including tau^2)
tau2 <- meta_prop$tau^2
weights_raw <- 1 / (se_logit^2 + tau2)
weights_percent <- (weights_raw / sum(weights_raw)) * 100

cat("\n=== WEIGHT DIAGNOSTICS ===\n")
cat("Manually calculated weights (%):\n")
print(round(weights_percent, 1))
cat("\nSum of weights:", sum(weights_percent), "\n")

results_table <- data.frame(
    Study = study_id,
    Events = events,
    Total = n,
    Prevalence = round(events/n, 4),
    Lower_CI = round(invlogit(meta_prop$lower), 4),
    Upper_CI = round(invlogit(meta_prop$upper), 4),
    Weight_Percent = round(weights_percent, 1),
    Region = region,
    Antibody = antibody,
    Study_Size = size_category
)

cat("\n=== RESULTS TABLE PREVIEW ===\n")
print(results_table[, c("Study", "Events", "Total", "Weight_Percent")])

# Extract subgroup results
antibody_subgroups <- meta_antibody$TE.random.w
antibody_lower <- meta_antibody$lower.random.w
antibody_upper <- meta_antibody$upper.random.w
antibody_I2 <- meta_antibody$I2.w
antibody_Q <- meta_antibody$Q.w

size_subgroups <- meta_size$TE.random.w
size_lower <- meta_size$lower.random.w
size_upper <- meta_size$upper.random.w
size_I2 <- meta_size$I2.w
size_Q <- meta_size$Q.w

region_subgroups <- meta_region$TE.random.w
region_lower <- meta_region$lower.random.w
region_upper <- meta_region$upper.random.w
region_I2 <- meta_region$I2.w
region_Q <- meta_region$Q.w

# Indices (alphabetically ordered by meta package)
d838_idx <- 1  # D8.38 
e978_idx <- 2  # E978
large_idx <- 1  # Large
small_idx <- 2  # Small
asia_pacific_idx <- 1  # Asia-Pacific
western_idx <- 2  # Western

pooled_results <- data.frame(
    Analysis = character(7),
    k_studies = integer(7),
    Prevalence = numeric(7),
    Lower_CI = numeric(7),
    Upper_CI = numeric(7),
    I2_percent = numeric(7),
    Q_statistic = numeric(7),
    p_value = numeric(7),
    stringsAsFactors = FALSE
)

# Row 1: Random Effects Model
pooled_results[1, "Analysis"] <- "Random Effects Model"
pooled_results[1, "k_studies"] <- length(study_id)
pooled_results[1, "Prevalence"] <- invlogit(meta_prop$TE.random[1])
pooled_results[1, "Lower_CI"] <- invlogit(meta_prop$lower.random[1])
pooled_results[1, "Upper_CI"] <- invlogit(meta_prop$upper.random[1])
pooled_results[1, "I2_percent"] <- round(meta_prop$I2[1] * 100, 1)
pooled_results[1, "Q_statistic"] <- round(meta_prop$Q[1], 2)
pooled_results[1, "p_value"] <- meta_prop$pval.Q[1]

# Row 2: E978 Antibody
pooled_results[2, "Analysis"] <- "E978 Antibody Subgroup"
pooled_results[2, "k_studies"] <- sum(antibody[antibody_subset] == "E978")
pooled_results[2, "Prevalence"] <- invlogit(antibody_subgroups[e978_idx])
pooled_results[2, "Lower_CI"] <- invlogit(antibody_lower[e978_idx])
pooled_results[2, "Upper_CI"] <- invlogit(antibody_upper[e978_idx])
pooled_results[2, "I2_percent"] <- round(antibody_I2[e978_idx] * 100, 1)
pooled_results[2, "Q_statistic"] <- round(antibody_Q[e978_idx], 2)
pooled_results[2, "p_value"] <- NA

# Row 3: D8.38 Antibody
pooled_results[3, "Analysis"] <- "D8.38 Antibody Subgroup"
pooled_results[3, "k_studies"] <- sum(antibody[antibody_subset] == "D8.38")
pooled_results[3, "Prevalence"] <- invlogit(antibody_subgroups[d838_idx])
pooled_results[3, "Lower_CI"] <- invlogit(antibody_lower[d838_idx])
pooled_results[3, "Upper_CI"] <- invlogit(antibody_upper[d838_idx])
pooled_results[3, "I2_percent"] <- round(antibody_I2[d838_idx] * 100, 1)
pooled_results[3, "Q_statistic"] <- round(antibody_Q[d838_idx], 2)
pooled_results[3, "p_value"] <- NA

# Row 4: Large Studies
pooled_results[4, "Analysis"] <- "Large Studies (n≥100)"
pooled_results[4, "k_studies"] <- sum(size_category == "Large (n≥100)")
pooled_results[4, "Prevalence"] <- invlogit(size_subgroups[large_idx])
pooled_results[4, "Lower_CI"] <- invlogit(size_lower[large_idx])
pooled_results[4, "Upper_CI"] <- invlogit(size_upper[large_idx])
pooled_results[4, "I2_percent"] <- round(size_I2[large_idx] * 100, 1)
pooled_results[4, "Q_statistic"] <- round(size_Q[large_idx], 2)
pooled_results[4, "p_value"] <- NA

# Row 5: Small Studies
pooled_results[5, "Analysis"] <- "Small Studies (n<100)"
pooled_results[5, "k_studies"] <- sum(size_category == "Small (n<100)")
pooled_results[5, "Prevalence"] <- invlogit(size_subgroups[small_idx])
pooled_results[5, "Lower_CI"] <- invlogit(size_lower[small_idx])
pooled_results[5, "Upper_CI"] <- invlogit(size_upper[small_idx])
pooled_results[5, "I2_percent"] <- round(size_I2[small_idx] * 100, 1)
pooled_results[5, "Q_statistic"] <- round(size_Q[small_idx], 2)
pooled_results[5, "p_value"] <- NA

# Row 6: Asia-Pacific
pooled_results[6, "Analysis"] <- "Asia-Pacific Region"
pooled_results[6, "k_studies"] <- sum(region_grouped == "Asia-Pacific")
pooled_results[6, "Prevalence"] <- invlogit(region_subgroups[asia_pacific_idx])
pooled_results[6, "Lower_CI"] <- invlogit(region_lower[asia_pacific_idx])
pooled_results[6, "Upper_CI"] <- invlogit(region_upper[asia_pacific_idx])
pooled_results[6, "I2_percent"] <- round(region_I2[asia_pacific_idx] * 100, 1)
pooled_results[6, "Q_statistic"] <- round(region_Q[asia_pacific_idx], 2)
pooled_results[6, "p_value"] <- NA

# Row 7: Western Countries
pooled_results[7, "Analysis"] <- "Western Countries Region"
pooled_results[7, "k_studies"] <- sum(region_grouped == "Western Countries")
pooled_results[7, "Prevalence"] <- invlogit(region_subgroups[western_idx])
pooled_results[7, "Lower_CI"] <- invlogit(region_lower[western_idx])
pooled_results[7, "Upper_CI"] <- invlogit(region_upper[western_idx])
pooled_results[7, "I2_percent"] <- round(region_I2[western_idx] * 100, 1)
pooled_results[7, "Q_statistic"] <- round(region_Q[western_idx], 2)
pooled_results[7, "p_value"] <- NA

# Table 3: Heterogeneity statistics
heterogeneity_table <- data.frame(
    Statistic = character(6),
    Value = character(6),
    CI_or_df = character(6),
    stringsAsFactors = FALSE
)

heterogeneity_table[1, "Statistic"] <- "Tau²"
heterogeneity_table[1, "Value"] <- as.character(round(meta_prop$tau[1]^2, 4))
# Check if tau CI is available
if (!is.na(meta_prop$lower.tau2[1]) && !is.na(meta_prop$upper.tau2[1])) {
  heterogeneity_table[1, "CI_or_df"] <- paste0("[", round(meta_prop$lower.tau2[1], 4), "; ", round(meta_prop$upper.tau2[1], 4), "]")
} else {
  heterogeneity_table[1, "CI_or_df"] <- "-"
}

heterogeneity_table[2, "Statistic"] <- "Tau"
heterogeneity_table[2, "Value"] <- as.character(round(meta_prop$tau[1], 4))
# Check if tau CI is available
if (!is.na(meta_prop$lower.tau[1]) && !is.na(meta_prop$upper.tau[1])) {
  heterogeneity_table[2, "CI_or_df"] <- paste0("[", round(meta_prop$lower.tau[1], 4), "; ", round(meta_prop$upper.tau[1], 4), "]")
} else {
  heterogeneity_table[2, "CI_or_df"] <- "-"
}

heterogeneity_table[3, "Statistic"] <- "I²"
heterogeneity_table[3, "Value"] <- paste0(round(meta_prop$I2[1] * 100, 1), "%")
heterogeneity_table[3, "CI_or_df"] <- paste0("[", round(meta_prop$lower.I2[1] * 100, 1), "%; ", round(meta_prop$upper.I2[1] * 100, 1), "%]")

heterogeneity_table[4, "Statistic"] <- "H"
heterogeneity_table[4, "Value"] <- as.character(round(meta_prop$H[1], 2))
heterogeneity_table[4, "CI_or_df"] <- paste0("[", round(meta_prop$lower.H[1], 2), "; ", round(meta_prop$upper.H[1], 2), "]")

heterogeneity_table[5, "Statistic"] <- "Q"
heterogeneity_table[5, "Value"] <- as.character(round(meta_prop$Q[1], 2))
heterogeneity_table[5, "CI_or_df"] <- paste0("df = ", meta_prop$df.Q[1])

heterogeneity_table[6, "Statistic"] <- "Q p-value"
heterogeneity_table[6, "Value"] <- format(meta_prop$pval.Q[1], scientific = TRUE, digits = 3)
heterogeneity_table[6, "CI_or_df"] <- "-"

# Table 4: Publication bias tests
publication_bias_table <- data.frame(
    Test = c("Egger's test"),
    Statistic = c(paste0("t = ", round(eggers_test$statistic, 2))),
    p_value = c(format(eggers_test$p.value, digits = 4))
)

# Table 5: Subgroup comparison tests
subgroup_tests <- data.frame(
    Comparison = c("E978 vs D8.38 Antibody", 
                   "Large vs Small Studies",
                   "Asia-Pacific vs Western Countries"),
    Q_between = c(
        round(meta_antibody$Q.b.random, 2),
        round(meta_size$Q.b.random, 2),
        round(meta_region$Q.b.random, 2)
    ),
    df = c(1, 1, 1),
    p_value = c(
        format(meta_antibody$pval.Q.b.random, digits = 4),
        format(meta_size$pval.Q.b.random, digits = 4),
        format(meta_region$pval.Q.b.random, digits = 4)
    ),
    Significant = c(
        ifelse(meta_antibody$pval.Q.b.random < 0.05, "Yes", "No"),
        ifelse(meta_size$pval.Q.b.random < 0.05, "Yes", "No"),
        ifelse(meta_region$pval.Q.b.random < 0.05, "Yes", "No")
    )
)

# Create list of tables for Excel export
excel_data <- list(
    "Individual_Studies" = results_table,
    "Pooled_Results" = pooled_results,
    "Heterogeneity" = heterogeneity_table,
    "Publication_Bias" = publication_bias_table,
    "Subgroup_Tests" = subgroup_tests
)

# Export to Excel
write_xlsx(excel_data, "NY-ESO-1_Meta_Analysis_Results.xlsx")

cat("\n✓ Results exported to: NY-ESO-1_Meta_Analysis_Results.xlsx\n")

# Print summary to console (with back-transformed values)
cat("\n=== MAIN RESULTS ===\n")
cat(sprintf("Pooled Prevalence: %.2f%% (95%% CI: %.2f%% - %.2f%%)\n", 
            invlogit(meta_prop$TE.random[1]) * 100, 
            meta_prop$lower.random[1] * 100, 
            meta_prop$upper.random[1] * 100))
cat(sprintf("I²: %.1f%% (substantial heterogeneity)\n", meta_prop$I2[1] * 100))
cat(sprintf("Egger's test p-value: %.4f\n", eggers_test$p.value))
cat(sprintf("\nE978 antibody: %.2f%% | D8.38 antibody: %.2f%% (p = %.4f)\n",
            invlogit(antibody_subgroups[e978_idx]) * 100,
            invlogit(antibody_subgroups[d838_idx]) * 100,
            meta_antibody$pval.Q.b.random))
cat(sprintf("Large studies: %.2f%% | Small studies: %.2f%% (p = %.4f)\n",
            invlogit(size_subgroups[large_idx]) * 100,
            invlogit(size_subgroups[small_idx]) * 100,
            meta_size$pval.Q.b.random))
cat(sprintf("\nGeographic regions (p = %.4f):\n", meta_region$pval.Q.b.random))
cat(sprintf("  Asia-Pacific: %.2f%% | Western Countries: %.2f%%\n",
            invlogit(region_subgroups[asia_pacific_idx]) * 100,
            invlogit(region_subgroups[western_idx]) * 100))

cat("\n=== All plots displayed in RStudio Plots pane ===\n")
cat("Use the arrows in Plots pane to navigate between figures\n")
cat("Use Export > Save as Image/PDF to save individual plots\n")
cat("\n✓ All figures automatically saved to 'figures/' directory\n")
cat("\n✓ Excel file created successfully with BACK-TRANSFORMED values\n")
