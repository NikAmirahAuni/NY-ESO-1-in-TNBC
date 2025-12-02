# To install devtools
if (!require("devtools")) {
  install.packages("devtools")
}
# OR, to install remotes
if (!require("remotes")) {
  install.packages("remotes")
}
# Using devtools
devtools::install_github("MathiasHarrer/dmetar")
# OR, using remotes
remotes::install_github("MathiasHarrer/dmetar")

install.packages("meta")
install.packages("metafor")
library(meta)
library(metafor)
library(dmetar)
library(writexl)

setwd("path/to/meta-analysis/")

# Data - Please verify that they are accurate according to each study (the reference number [16] etc) 
study_id <- c("Ademuwiya et al [16]", "Tessari et al [26]", "Lee et al [27]", "Curigliano et al [65]", "Chen et al [67]", 
              "Mrklic et al [68]", "Hamai et al [69]", "Raghavendra et al [70]", "Ceprnja et al [72]", "Xiao et al [117]", "See et al [126]", "Tanja et al [127]")

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
    sm = "PRAW",
    method.tau = "DL",
    method.random.ci = "HK",
    title = "NY-ESO-1 Expression Prevalence in TNBC"
)

# Display results
summary(meta_prop)

# Figure 6A: Forest plot - SHOWS IN RSTUDIO PLOTS PANE
forest(meta_prop,
       xlim = c(0, 0.5),
       rightcols = c("effect", "ci", "w.random"),
       rightlabs = c("Prevalence", "95% CI", "Weight"),
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
       digits = 2)

# Figure 6B: Funnel plot
funnel(meta_prop,
       xlim = c(0, 0.5),
       studlab = TRUE,
       pch = 16,
       col = "navy",
       cex = 1.2,
       main = "Funnel Plot for Publication Bias Assessment")

# Egger's test
eggers_test <- metabias(meta_prop, method.bias = "Egger", k.min = 10)
print(eggers_test)

# Trim and fill analysis
tf <- trimfill(meta_prop)
print(tf)

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
    sm = "PRAW",
    method.tau = "DL",
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
    sm = "PRAW",
    method.tau = "DL",
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
# Custom grouping
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
    sm = "PRAW",
    method.tau = "DL",
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

# Figure 6A: Main forest plot
png("figures/Figure_6A_Forest_Plot.png", width = 3000, height = 2400, res = 300)
forest(meta_prop,
       xlim = c(0, 0.5),
       rightcols = c("effect", "ci", "w.random"),
       rightlabs = c("Prevalence", "95% CI", "Weight"),
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
       digits = 2)
dev.off()

# Figure 6B: Funnel plot
png("figures/Figure_6B_Funnel_Plot.png", width = 2400, height = 2400, res = 300)
funnel(meta_prop,
       xlim = c(0, 0.5),
       studlab = TRUE,
       pch = 16,
       col = "navy",
       cex = 1.2,
       main = "Funnel Plot for Publication Bias Assessment")
dev.off()

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

# Figure 6F: Influence analysis
png("figures/Figure_6F_Influence_Analysis.png", width = 3000, height = 3000, res = 300)
forest(inf)
dev.off()

# Also save as PDF (vector graphics, better for publication)
pdf("figures/Figure_6A_Forest_Plot.pdf", width = 10, height = 8)
forest(meta_prop,
       xlim = c(0, 0.5),
       rightcols = c("effect", "ci", "w.random"),
       rightlabs = c("Prevalence", "95% CI", "Weight"),
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
       digits = 2)
dev.off()

pdf("figures/Figure_6B_Funnel_Plot.pdf", width = 8, height = 8)
funnel(meta_prop,
       xlim = c(0, 0.5),
       studlab = TRUE,
       pch = 16,
       col = "navy",
       cex = 1.2,
       main = "Funnel Plot for Publication Bias Assessment")
dev.off()

pdf("figures/Figure_6C_Antibody_Subgroup.pdf", width = 10, height = 8)
forest(meta_antibody,
       xlim = c(0, 0.6),
       rightcols = c("effect", "ci"),
       xlab = "Prevalence",
       test.subgroup = TRUE,
       print.subgroup.name = TRUE,
       common = FALSE)
dev.off()

pdf("figures/Figure_6D_Study_Size_Subgroup.pdf", width = 10, height = 8)
forest(meta_size,
       xlim = c(0, 0.5),
       rightcols = c("effect", "ci"),
       xlab = "Prevalence",
       test.subgroup = TRUE,
       print.subgroup.name = TRUE,
       common = FALSE)
dev.off()

pdf("figures/Figure_6E_Geographic_Subgroup.pdf", width = 10, height = 8)
forest(meta_region,
       xlim = c(0, 0.5),
       rightcols = c("effect", "ci"),
       xlab = "Prevalence",
       test.subgroup = TRUE,
       print.subgroup.name = TRUE,
       common = FALSE)
dev.off()

pdf("figures/Figure_6F_Influence_Analysis.pdf", width = 10, height = 10)
forest(inf)
dev.off()

cat("\n✓ All figures saved to 'figures/' directory (PNG and PDF formats)\n")

# ============================================
# EXPORT RESULTS TO EXCEL
# ============================================

# Table 1: Individual study results
results_table <- data.frame(
    Study = study_id,
    Events = events,
    Total = n,
    Prevalence = round(events/n, 4),
    Lower_CI = round(meta_prop$lower, 4),
    Upper_CI = round(meta_prop$upper, 4),
    Weight_Percent = round(meta_prop$w.random, 1),
    Region = region,
    Antibody = antibody,
    Study_Size = size_category
)

# Table 2: Overall pooled results
pooled_results <- data.frame(
    Analysis = c("Random Effects Model", 
                 "Trim-and-Fill Adjusted",
                 "E978 Antibody Subgroup",
                 "D8.38 Antibody Subgroup",
                 "Large Studies (n≥100)",
                 "Small Studies (n<100)",
                 "Asia-Pacific Region",
                 "Western Countries Region"),
    k_studies = c(
        13,  # Total studies in main analysis
        18,  # Trim-and-fill adjusted
        sum(antibody[antibody_subset] == "E978"),  # E978 antibody count
        sum(antibody[antibody_subset] == "D8.38"), # D8.38 antibody count
        sum(size_category == "Large (n≥100)"),     # Large studies = 3
        sum(size_category == "Small (n<100)"),     # Small studies = 10
        sum(region_grouped == "Asia-Pacific"),
        sum(region_grouped == "Western Countries")
    ),
    Prevalence = c(
        meta_prop$TE.random,
        tf$TE.random,
        NA, NA, NA, NA, NA, NA
    ),
    Lower_CI = c(
        meta_prop$lower.random,
        tf$lower.random,
        NA, NA, NA, NA, NA, NA
    ),
    Upper_CI = c(
        meta_prop$upper.random,
        tf$upper.random,
        NA, NA, NA, NA, NA, NA
    ),
    I2_percent = c(
        round(meta_prop$I2 * 100, 1),
        round(tf$I2 * 100, 1),
        NA, NA, NA, NA, NA, NA
    ),
    Q_statistic = c(
        round(meta_prop$Q, 2),
        round(tf$Q, 2),
        NA, NA, NA, NA, NA, NA
    ),
    p_value = c(
        meta_prop$pval.Q,
        tf$pval.Q,
        NA, NA, NA, NA, NA, NA
    )
)

# Extract subgroup results
# For antibody subgroups
antibody_subgroups <- meta_antibody$TE.random.w
antibody_lower <- meta_antibody$lower.random.w
antibody_upper <- meta_antibody$upper.random.w
antibody_I2 <- meta_antibody$I2.w

pooled_results$Prevalence[3] <- antibody_subgroups[1]  # E978
pooled_results$Prevalence[4] <- antibody_subgroups[2]  # D8.38
pooled_results$Lower_CI[3] <- antibody_lower[1]
pooled_results$Lower_CI[4] <- antibody_lower[2]
pooled_results$Upper_CI[3] <- antibody_upper[1]
pooled_results$Upper_CI[4] <- antibody_upper[2]
pooled_results$I2_percent[3] <- round(antibody_I2[1] * 100, 1)
pooled_results$I2_percent[4] <- round(antibody_I2[2] * 100, 1)
pooled_results$Q_statistic[3] <- round(meta_antibody$Q.w[1], 2)
pooled_results$Q_statistic[4] <- round(meta_antibody$Q.w[2], 2)

# For study size subgroups
size_subgroups <- meta_size$TE.random.w
size_lower <- meta_size$lower.random.w
size_upper <- meta_size$upper.random.w
size_I2 <- meta_size$I2.w

pooled_results$Prevalence[5] <- size_subgroups[1]  # Large
pooled_results$Prevalence[6] <- size_subgroups[2]  # Small
pooled_results$Lower_CI[5] <- size_lower[1]
pooled_results$Lower_CI[6] <- size_lower[2]
pooled_results$Upper_CI[5] <- size_upper[1]
pooled_results$Upper_CI[6] <- size_upper[2]
pooled_results$I2_percent[5] <- round(size_I2[1] * 100, 1)
pooled_results$I2_percent[6] <- round(size_I2[2] * 100, 1)
pooled_results$Q_statistic[5] <- round(meta_size$Q.w[1], 2)
pooled_results$Q_statistic[6] <- round(meta_size$Q.w[2], 2)

# For geographic region subgroups
region_subgroups <- meta_region$TE.random.w
region_lower <- meta_region$lower.random.w
region_upper <- meta_region$upper.random.w
region_I2 <- meta_region$I2.w

# Get the names to see the actual order
subgroup_names <- names(region_subgroups)
print("Subgroup order from meta package:")
print(subgroup_names)

# Find which index corresponds to which region
asia_pacific_idx <- which(subgroup_names == "Asia-Pacific")
western_idx <- which(subgroup_names == "Western Countries")

# Assign to correct rows in pooled_results
# Row 7: Asia-Pacific Region
# Row 8: Western Countries Region

pooled_results$Prevalence[7] <- region_subgroups[asia_pacific_idx]
pooled_results$Prevalence[8] <- region_subgroups[western_idx]

pooled_results$Lower_CI[7] <- region_lower[asia_pacific_idx]
pooled_results$Lower_CI[8] <- region_lower[western_idx]

pooled_results$Upper_CI[7] <- region_upper[asia_pacific_idx]
pooled_results$Upper_CI[8] <- region_upper[western_idx]

pooled_results$I2_percent[7] <- round(region_I2[asia_pacific_idx] * 100, 1)
pooled_results$I2_percent[8] <- round(region_I2[western_idx] * 100, 1)

pooled_results$Q_statistic[7] <- round(meta_region$Q.w[asia_pacific_idx], 2)
pooled_results$Q_statistic[8] <- round(meta_region$Q.w[western_idx], 2)

# Table 3: Heterogeneity statistics
heterogeneity_table <- data.frame(
    Statistic = c("Tau²", "Tau", "I²", "H", "Q", "Q p-value"),
    Value = c(
        round(meta_prop$tau^2, 4),
        round(meta_prop$tau, 4),
        paste0(round(meta_prop$I2 * 100, 1), "%"),
        round(meta_prop$H, 2),
        round(meta_prop$Q, 2),
        format(meta_prop$pval.Q, scientific = TRUE, digits = 3)
    ),
    CI_or_df = c(
        paste0("[", round(meta_prop$lower.tau2, 4), "; ", round(meta_prop$upper.tau2, 4), "]"),
        paste0("[", round(meta_prop$lower.tau, 4), "; ", round(meta_prop$upper.tau, 4), "]"),
        paste0("[", round(meta_prop$lower.I2 * 100, 1), "%; ", round(meta_prop$upper.I2 * 100, 1), "%]"),
        paste0("[", round(meta_prop$lower.H, 2), "; ", round(meta_prop$upper.H, 2), "]"),
        paste0("df = ", meta_prop$df.Q),
        ""
    )
)

# Table 4: Publication bias tests
publication_bias_table <- data.frame(
    Test = c("Egger's test", "Trim-and-Fill"),
    Statistic = c(
        paste0("t = ", round(eggers_test$statistic, 2)),
        paste0("k = 18 (+6 studies)")
    ),
    p_value = c(
        format(eggers_test$p.value, digits = 4),
        ""
    ),
    Adjusted_Prevalence = c(
        "",
        paste0(round(tf$TE.random, 4), " [", round(tf$lower.random, 4), "; ", round(tf$upper.random, 4), "]")
    )
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

# Print summary to console
cat("\n=== MAIN RESULTS ===\n")
cat(sprintf("Pooled Prevalence: %.2f%% (95%% CI: %.2f%% - %.2f%%)\n", 
            meta_prop$TE.random * 100, 
            meta_prop$lower.random * 100, 
            meta_prop$upper.random * 100))
cat(sprintf("I²: %.1f%% (substantial heterogeneity)\n", meta_prop$I2 * 100))
cat(sprintf("Egger's test p-value: %.4f (publication bias detected)\n", eggers_test$p.value))
cat(sprintf("Trim-and-Fill adjusted: %.2f%% (95%% CI: %.2f%% - %.2f%%)\n",
            tf$TE.random * 100,
            tf$lower.random * 100,
            tf$upper.random * 100))
cat(sprintf("\nE978 antibody: %.2f%% | D8.38 antibody: %.2f%% (p = %.4f)\n",
            antibody_subgroups[1] * 100,
            antibody_subgroups[2] * 100,
            meta_antibody$pval.Q.b.random))
cat(sprintf("Large studies: %.2f%% | Small studies: %.2f%% (p = %.4f)\n",
            size_subgroups[1] * 100,
            size_subgroups[2] * 100,
            meta_size$pval.Q.b.random))
cat(sprintf("\nGeographic regions (p = %.4f):\n", meta_region$pval.Q.b.random))
cat(sprintf("  Asia-Pacific: %.2f%% | Western Countries: %.2f%%\n",
            region_subgroups[1] * 100,
            region_subgroups[2] * 100))

cat("\n=== All plots displayed in RStudio Plots pane ===\n")
cat("Use the arrows in Plots pane to navigate between figures\n")
cat("Use Export > Save as Image/PDF to save individual plots\n")
cat("\n✓ All figures automatically saved to 'figures/' directory\n")