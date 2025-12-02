<div align="center">

# 🧬 NY-ESO-1: A Promising Immunotherapeutic Target in Triple-negative Breast Cancer 


### ✨ Structural analysis of NY-ESO-1 in complex with HLA-A2 and TCR/antibody/TCR-like with annotated hydrogen bonds and hydrophobic pockets for immunology review.

### ✨ Meta-analysis on the prevalence of NY-ESO-1 in TNBC




**Author:** **Nik** **Mohd** **Asri** **Nik** **Amirah** **Auni,** **Norhanani** **Mohd** **Redzwan,** **Faezahtul** **Arbaeyah** **Hussain,** **Maya** **Mazuwin** **Yahya,** **Suzina** **Sheikh** **Ab.** **Hamid,** **Kah** **Keng** **Wong**  



</div>

---

## 📋 Repository Overview

### 🔬 **1. Structural Analysis**
- **7 experimental crystal structures** from PDB and **1 AlphaFold3-predicted structure**
- ChimeraX session files with structural annotations
- Visualization of hydrogen bonds and hydrophobic pockets in pMHC-TCR/antibody complexes

### 🖥 **2. Meta-Analysis** 
- **Pooled prevalence analysis** across 12 studies (n=1,595 TNBC patients)
- Subgroup analyses by antibody clone, study size, and geographic region
- Publication bias assessment and heterogeneity evaluation

---

## 🚀 Quick Start

**Want to jump right in? Here's the fastest way:**

### For Structural Analysis:
1. **View pre-annotated structures:**
   - Download any `.cxs` file from `ChimeraX_sessions/`
   - Install [ChimeraX](https://www.rbvi.ucsf.edu/chimerax/)
   - Drag and drop the file into ChimeraX
   - All hydrogen bonds and pockets are already annotated!

2. **Analyze the AlphaFold3 model:**
```python
   pip install biopython numpy matplotlib
   import os
   os.chdir("--add working directory--")
   %run analyze_nyeso1.py
```

3. **Get the structures:**
   - Experimental: Download from `structures/experimental/` (PDB files ready to use)
   - Predicted: Download from `structures/predicted/` (AlphaFold3 model)

**New to structural biology?** Start with Figure 1B session (`Fig 1B (1S9W).cxs`) to see a simple peptide-MHC structure with color-coded residues.

### For Meta-analysis:
1. **Run the analysis:**
```r
   install.packages(c("meta", "writexl"))
   setwd("path/to/meta-analysis/")
   source("meta_analysis.R")
```

2. **View results:**
   - Forest plots and funnel plots: `meta-analysis/figures/`
   - Complete statistical results: `meta-analysis/results/NY-ESO-1_Meta_Analysis_Results.xlsx`

---

## 📂 Repository Structure
```
├── structures/          # PDB and CIF files   
│   ├── experimental/   # Crystal structures from PDB   
│   └── predicted/      # AlphaFold3 model with confidence data   
├── ChimeraX_sessions/  # Session files (.cxs) with annotations   
├── figures/            # Publication-quality images   
├── scripts/            # Analysis scripts   
├── methods/            # Detailed protocols   
└── meta-analysis/            # Meta-analysis of NY-ESO-1 prevalence in TNBC   
```

---

## 📊 Structure Overview

| ID | Type | PDB ID | MHC Allele | Peptide | TCR | Source |
|----|------|-----------|------------|---------|-----|--------|
| 1 | Experimental | 1S9W | HLA-A2 | NY-ESO-1 (SLLMWITQC) | - | PDB |
| 2 | Experimental | 1S9X | HLA-A2 | NY-ESO-1 (SLLMWITQA) | - | PDB |
| 3 | Experimental | 1S9Y | HLA-A2 | NY-ESO-1 (SLLMWITQS) | - | PDB |
| 4 | Experimental | 2BNQ | HLA-A2 | NY-ESO-1 (SLLMWITQV) | TCR | PDB |
| 5 | Experimental | 3HAE | HLA-A2 | NY-ESO-1 (SLLMWITQV) | Antibody | PDB |
| 6 | Experimental | 9DL1 | HLA-A2 | NY-ESO-1 (SLLMWITQV) | TRACeR | PDB |
| 7 | Experimental | 9MIN | HLA-A2 | NY-ESO-1 (SLLMWITQV) | TCR mimic | PDB |
| 8 | Predicted | P78358 | - | NY-ESO-1 (full-length, 180aa) | - | AlphaFold3 |

See `structures/Structure_metadata.xslx` for complete details.

---

## 🔬 Workflow

📥 1. Download PDB files from RCSB Protein Data Bank (https://www.rcsb.org/)

| ID | PDB ID | Complex | Resolution | Description |
|----|------|-----------|------------|---------|
| 1 | 1S9W | HLA-A2/NY-ESO-1₁₅₇₋₁₆₅ (SLLMWITQC) | 2.20 Å | Peptide-MHC only |
| 2 | 1S9X | HLA-A2/NY-ESO-1₁₅₇₋₁₆₅ (SLLMWITQA) | 2.50 Å | Peptide-MHC only |
| 3 | 1S9Y | HLA-A2/NY-ESO-1₁₅₇₋₁₆₅ (SLLMWITQS) | 2.30 Å | Peptide-MHC only |
| 4 | 2BNQ | HLA-A2/NY-ESO-1₁₅₇₋₁₆₅ (SLLMWITQV) + 1G4 TCR | 1.70 Å | Peptide-MHC-TCR complex |
| 5 | 3HAE | HLA-A2/NY-ESO-1₁₅₇₋₁₆₅ (SLLMWITQV) + 3M4E5 Fab | 2.90 Å | Peptide-MHC-antibody complex |
| 6 | 9DL1 | HLA-A2/NY-ESO-1₁₅₇₋₁₆₅ (SLLMWITQV) + TRACER-I | 2.30 Å | Peptide-MHC-TCR-like complex |
| 7 | 9MIN | HLA-A2/NY-ESO-1₁₅₇₋₁₆₅ (SLLMWITQV) + TCR mimic | 2.05 Å | Peptide-MHC-TCR-like complex |

See `structures/experimental` for the PDB files of each structure

⚗️ 2. Model full-length NY-ESO-1 with AlphaFold3

**Sequence source:** UniProt P78358 (https://www.uniprot.org/uniprotkb/P78358/entry#sequences)   
**Model prediction:** AlphaFold3 server (https://alphafoldserver.com/)   
**Model file:** P78358.cif   
**Quality metrics:**   
- Mean pLDDT: 63.15 (expected for intrinsically disordered protein)   
- Epitope region (157-165) pLDDT: 88.15 (high confidence)   
- Pcc-1 domain (82-168) pLDDT: 85.0 (high confidence)   
- Fraction disordered: 58% (glycine-rich N-terminus)   

**Structure verification script:**   
```python
import os   
os.chdir("--add working directory--")   
%run analyze_nyeso1.py   
```

   This generates **P78358_model_info.txt** (confidence analysis) and **ny_eso_1_confidence_plot.png** (pLDDT visualization)
   
See `structures/predicted` for the PDB file and complete details
   
🔍 3. Visualize with ChimeraX

1. Install [ChimeraX](https://www.rbvi.ucsf.edu/chimerax/)
2. Download `.cxs` files from `chimerax_sessions/`
3. Open in ChimeraX (File → Open → select session file or drag-and-drop .cxs files)
4. All annotations will be restored
	- Hydrogen bonds (black dashed lines)
	- Hydrophobic pockets (yellow surfaces)
	- Color-coded residues
	
Available sessions:

| File | Figure | Description |
|----|------|-----------|
| Fig 1B (1S9W).cxs | 1B | Solvent-exposed vs buried residues |
| Fig 1B (1S9W, 1S9X, 1S9Y).cxs | 1C | Peptide residue 9 substitutions |
| Fig 2 (P78358).cxs | 2 | Full-length structure with Pcc-1 domain |
| Fig 3A (3HAE).cxs | 3A | Fab antibody complex with H-bonds |
| Fig 3B (2BNQ).cxs | 3B | TCR complex with H-bonds |
| Fig 3C (9DL1).cxs | 3C | TRACeR-I complex with pockets |
| Fig 3D (9MIN).cxs | 3D | TCR mimic complex with H-bonds |

All ChimeraX sessions are in `ChimeraX_sessions`

Detailed commands and analysis methods are in `visualization_protocol.md`

---

## 💻 Meta-analysis of NY-ESO-1 Prevalence

1. ℹ️ Study overview

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

2. 📈 Statistical analysis
- **Model:** Random-effects meta-analysis
- **Estimator:** DerSimonian-Laird method for τ²
- **Confidence Intervals:** Hartung-Knapp adjustment
- **Summary Measure:** Raw proportions (PRAW)
- **Study-level CI:** Normal approximation (NAsm)

**Analyses Performed:**
- **Pooled prevalence estimation**
- **Heterogeneity assessment**
   - I² statistic with 95% CI
   - Cochran's Q test
   - τ² (between-study variance)
- **Publication bias testing**
   - Funnel plot
   - Egger's regression test (minimum k=10 studies)
   - Trim-and-fill analysis
- **Subgroup analyses:**
   - By antibody clone (E978 vs D8.38)
   - By study size (large ≥100 vs small <100)
   - By geographic region (Asia-Pacific vs Western countries)
- **Influence analysis** (leave-one-out sensitivity analysis)

3 🚀 Run analysis

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

See `meta-analysis` for the scripts and complete details

---

## 🎨 Figures

Final figures 1-3 were assembled in BioRender (https://www.biorender.com/)
- Raw ChimeraX images exported at 3000×2000 px   
- Panels assembled with consistent formatting   
- Text annotations: Roboto font, black
- Publication-quality layouts (.jpg, 600 dpi)

Final figure 4 was post-processed using [Inkscape] for publication quality

**Figures:**

![Figure 1](https://github.com/NikAmirahAuni/NY-ESO-1-Structural-Analysis/blob/main/figures/Fig%201%20NYESO1%20in%20TNBC.jpeg)


**Figure 1 NY-ESO-1 epitope map and peptide-MHC structure**   
- Panel A: Immunological epitopes (antibody vs T cell regions)   
- Panel B: Crystal structure showing solvent-exposed and buried residues (1S9W)
- Panel C: Structural comparison of C-terminal peptide variants (1S9W, 1S9X, 1S9Y)

![Figure 2](https://github.com/NikAmirahAuni/NY-ESO-1-Structural-Analysis/blob/main/figures/Fig%202%20NYESO1%20in%20TNBC.jpeg)

**Figure 2 Full-length NY-ESO-1 structure and function**
- AlphaFold3 model with Pcc-1 domain highlighted in yellow
- Expression timeline during fetal development
- Molecular function in spermatogonial development

![Figure 3](https://github.com/NikAmirahAuni/NY-ESO-1-Structural-Analysis/blob/main/figures/Fig%203%20NYESO1%20in%20TNBC.jpeg)

**Figure 3 Recognition by different binding molecules**
- Panel A: Fab antibody (3HAE) - key contacts at Met4/Trp5
- Panel B: TCR (2BNQ) - similar recognition strategy as antibody
- Panel C: TRACeR-I (9DL1) - hydrophobic pocket accomodation and H-bond stabilizing the complex
- Pandel D: TCR mimic (9MIN) - compact binding mode

see `https://github.com/NikAmirahAuni/NY-ESO-1-in-TNBC/blob/main/meta-analysis/Fig%204%20NYESO%20in%20TNBC.docx`

**Figure 4 Meta-analysis of NY-ESO-1 Expression Prevalence in TNBC.**
- Panel A: Forest plot showing individual study prevalence
- Panel B: Funnel plot for assessment of publication bias
- Panel C: Influence analysis showing leave-one-out sensitivity analysis
- Panel D: Subgroup analysis by antibody clone (E978 vs. D8.38)
- Panel E: Subgroup analysis by study size (large [n≥100] vs. small [n<100])
- Panel F: Subgroup analysis by geography (Western countries vs. Asia-Pacific)

---

## 🎯 Key Findings

- **H-bond networks** stabilize peptide-MHC complexes with TCR/antibody/TCR-like molecules
- **Conserved hydrophobic pockets** in TRACeR-I accommodating peptide hotspot residues (MW peg)
- **AlphaFold3 model** reveals full structural context of immunogenic NY-ESO-1 regions and the Pcc-1 domain (residues 82-168)
- **Central peptide bulge** formed by Met4/Trp5 serves as primary recognition site across all binding modes
- **Meta-analysis shows moderate prevalence (16.1%) in TNBC** with significant geographic and methodological variation
- **Antibody clone selection** (E978 vs D8.38) significantly impacts prevalence estimates, suggesting importance of standardized detection protocols

---

## 📚 Citations and References

**🔗 Structure Sources:**

RCSB Protein Data Bank
```
H.M. Berman, J. Westbrook, Z. Feng, G. Gilliland, T.N. Bhat, H. Weissig, I.N. Shindyalov, P.E. Bourne, The Protein Data Bank (2000) Nucleic Acids Research 28: 235-242 https://doi.org/10.1093/nar/28.1.235.
```

Original Structure Publications:
```
1S9W, 1S9X, 1S9Y:
D. Valmori, V.r. Dutoit, D. Liénard, D. Rimoldi, M.l.J. Pittet, P. Champagne, et al., Naturally Occurring Human Lymphocyte Antigen-A2 Restricted CD8+ T-Cell Response to the Cancer Testis Antigen NY-ESO-1 in Melanoma Patients1, Cancer Research 60 (2000) 4499-4506

3HAE
G. Stewart-Jones, A. Wadle, A. Hombach, E. Shenderov, G. Held, E. Fischer, et al., Rational development of high-affinity T-cell receptor-like antibodies, Proc Natl Acad Sci U S A 106 (2009) 5784-5788

2BNQ
Chen JL, Stewart-Jones G, Bossi G, Lissin NM, Wooldridge L, Choi EM, et al. Structural and kinetic basis for heightened immunogenicity of T cell vaccines. J Exp Med. 2005;201:1243-1255

9DL1
H. Du, L. Mallik, D. Hwang, Y. Sun, C. Kaku, D. Hoces, et al., Targeting peptide antigens using a multiallelic MHC I-binding system, Nat Biotechnol 43 (2025) 1683-1693

9MIN
C.H. Coles, R.M. Mulvaney, S. Malla, A. Walker, K.J. Smith, A. Lloyd, et al., TCRs with Distinct Specificity Profiles Use Different Binding Modes to Engage an Identical Peptide-HLA Complex, J Immunol 204 (2020) 1943-1953
```

** 📄 Studies Included in Meta-analysis:**

Ademuyiwa et al [16]
```
F.O. Ademuyiwa, W. Bshara, K. Attwood, C. Morrison, S.B. Edge, A.R. Karpf, et al., NY-ESO-1 cancer testis antigen demonstrates high immunogenicity in triple negative breast cancer, PLoS One 7 (2012) e38783, https://doi.org/10.1371/journal.pone.0038783.
```

Tessari et al [26]
```
A. Tessari, L. Pilla, D. Silvia, M. Duca, B. Paolini, M.L. Carcangiu, et al., Expression of NY-ESO-1, MAGE-A3, PRAME and WT1 in different subgroups of breast cancer: An indication to immunotherapy?, Breast 42 (2018) 68-73, https://doi.org/10.1016/j.breast.2018.08.106.
```

Lee et al [27]
```
H.J. Lee, J.Y. Kim, I.H. Song, I.A. Park, J.H. Yu, G. Gong, Expression of NY-ESO-1 in Triple-Negative Breast Cancer Is Associated with Tumor-Infiltrating Lymphocytes and a Good Prognosis, Oncology 89 (2015) 337-344, https://doi.org/10.1159/000439535.
```

Curigliano et al [65]
```
G. Curigliano, V. Bagnardi, M. Ghioni, J. Louahed, V. Brichard, F.F. Lehmann, et al., Expression of tumor-associated antigens in breast cancer subtypes, Breast 49 (2020) 202-209, https://doi.org/10.1016/j.breast.2019.12.002.
```

Chen et al [67]
```
Y.T. Chen, D.S. Ross, R. Chiu, X.K. Zhou, Y.Y. Chen, P. Lee, et al., Multiple cancer/testis antigens are preferentially expressed in hormone-receptor negative and high-grade breast cancers, PLoS One 6 (2011) e17876, https://doi.org/10.1371/journal.pone.0017876.
```

Mrklic et al [68]
```
I. Mrklic, G.C. Spagnoli, A. Juretic, Z. Pogorelic, S. Tomic, Co-expression of cancer testis antigens and topoisomerase 2-alpha in triple negative breast carcinomas, Acta Histochem 116 (2014) 740-746, https://doi.org/10.1016/j.acthis.2014.01.003.
```

Hamai et al [69]
```
A. Hamai, K. Duperrier-Amouriaux, P. Pignon, I. Raimbaud, L. Memeo, C. Colarossi, et al., Antibody responses to NY-ESO-1 in primary breast cancer identify a subtype target for immunotherapy, PLoS One 6 (2011) e21129, https://doi.org/10.1371/journal.pone.0021129.
```

Raghavendra et al [70]
```
A. Raghavendra, P. Kalita-de Croft, A.C. Vargas, C.E. Smart, P.T. Simpson, J.M. Saunus, et al., Expression of MAGE-A and NY-ESO-1 cancer/testis antigens is enriched in triple-negative invasive breast cancers, Histopathology 73 (2018) 68-80, https://doi.org/10.1111/his.13498.
```

Ceprnja et al [72]
```
T. Ceprnja, I. Mrklic, M. Peric Balja, Z. Marusic, V. Blazicevic, G.C. Spagnoli, et al., Prognostic Significance of Lymphocyte Infiltrate Localization in Triple-Negative Breast Cancer, J Pers Med 12 (2022), https://doi.org/10.3390/jpm12060941.
```

Xiao et al [117]
```
J. Xiao, F. Huang, L. Li, L. Zhang, L. Xie, B. Liu, Expression of four cancer-testis antigens in TNBC indicating potential universal immunotherapeutic targets, J Cancer Res Clin Oncol 149 (2023) 15003-15011, https://doi.org/10.1007/s00432-023-05274-0.
```

See et al [126]
```
S.H.C. See, S.H. Smith, B.S. Finkelman, C. LaBoy, J.E. Novo, K.P. Siziopikou, et al., The role of PRAME and NY-ESO-1 as potential therapeutic and prognostic biomarkers in triple-negative breast carcinomas, Pathol Res Pract 241 (2023) 154299, https://doi.org/10.1016/j.prp.2022.154299.
```

Tanja et al [127]
```
T. Badovinac Crnjevic, G. Spagnoli, A. Juretic, J. Jakic-Razumovic, P. Podolski, N. Saric, High expression of MAGE-A10 cancer-testis antigen in triple-negative breast cancer, Med Oncol 29 (2012) 1586-1591, https://doi.org/10.1007/s12032-011-0120-9.
```

**🧰 Software citations:**

ChimeraX
```
Pettersen EF, Goddard TD, Huang CC, et al. UCSF ChimeraX: Structure visualization for researchers, educators, and developers. Protein Sci. 2021;30:70-82.
```

AlphaFold3
```
Abramson J, Adler J, Dunger J, et al. Accurate structure prediction of biomolecular interactions with AlphaFold 3. Nature. 2024;630:493-500.
```

Spyder
```
Spyder Project Contributors. Spyder - The Scientific Python Development Environment. 
Available at: https://www.spyder-ide.org/
```

Python & BioPython
```
Van Rossum G, Drake FL. Python 3 Reference Manual. Scotts Valley, CA: CreateSpace; 2009.

Cock PJA, Antao T, Chang JT, et al. Biopython: freely available Python tools for computational molecular biology and bioinformatics. Bioinformatics. 2009;25:1422-1423.
```

**R meta package:**
```
Schwarzer G. meta: An R package for meta-analysis. R News. 2007;7:40-45.
```

**🗄️ Databases:**

UniProt
```
The UniProt Consortium. UniProt: the universal protein knowledgebase in 2021. Nucleic Acids Res. 2021;49:D480-D489.
```

PANTHER
```
Mi H, Muruganujan A, Ebert D, Huang X, Thomas PD. PANTHER version 16: a revised family classification, tree-based classification tool, enhancer regions and extensive API. Nucleic Acids Res. 2021;49(D1):D394-D403. doi:10.1093/nar/gkaa1106
```

InterPro
```
Paysan-Lafosse T, Blum M, Chuguransky S, et al. InterPro in 2022. Nucleic Acids Res. 2023;51(D1):D418-D427.
```

---

## 💻 Requirements

**🧰 Software:**
- ChimeraX v1.10 or later
- Python 3.12
- Spyder IDE v5.5.1 (optional)
- R version 4.5.1
- Inkscape v1.4.2

**Python packages:**
```
pip install biopython numpy matplotlib
```

**R package:**
```r
install.packages("meta")
install.packages("writexl")
```

---

## 🛠️ Usage Guide

**Analyzing AlphaFold3 Model**
```python
import os
os.chdir("--add working directory--")
%run scripts/analyze_nyeso1.py
```

**Inputs:**
- structures/predicted/P78358.cif
- structures/predicted/P78358_summary_confidences.json

**Outputs:**
- P78358_model_info.txt
- ny_eso1_confidence_plot.png

**Reproducing Figures:**
1. Open appropriate ChimeraX session from chimerax_sessions/`
2. Export high-resolution image:
```chimeraX
set bgColor white
lighting soft
save output.png width 3000 height 2000 supersample 3
```

**📌 Notes:**
- Keep folder structure intact for ChimeraX sessions to load properly
- H-bonds based on original publications (manual annotation)
- Hydrophobic pockets identified by literature

---

## 📄 License

This work is licensed under [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/)

**BioRender license:**
Figure 1: Created in BioRender. Nik Amirah Auni, N. (2025) https://BioRender.com/7qg3s7c
Figure 2: Created in BioRender. Nik Amirah Auni, N. (2025) https://BioRender.com/6woif3q
Figure 3: Created in BioRender. Nik Amirah Auni, N. (2025) https://BioRender.com/mbk8ggp

---

## 💬 Contact

**Nik Mohd Asri Nik Amirah Auni**   
nikamirahauni@gmail.com   
Department of Immunology, School of Medical Sciences,   
Universiti Sains Malaysia, Kelantan, Malaysia   

---



################################################################################################

## Notes and Limitations

**Hydrogen bonds:**
- All hydrogen bonds were manually identified based on original publications
- Represent key interactions reported in structural studies
- Complete interaction networks available in ChimeraX session files
- Distances and angles verified using ChimeraX measurement tools

**Hydrophobic pockets:**
- Identified by visual inspection based on original structural analysis
- Residues colored according to reports in original publications
- Pocket boundaries defined by hydrophobic character and peptide contacts

**Structure alignment:**
- Comparative structures aligned using ChimeraX `matchmaker` command
- Alignment based on MHC α1-α2 domain backbone (residues 1-180)
- RMSD values reported in figure legends

**Data sources:**
- Experimental structures: SWISS-MODEL (https://swissmodel.expasy.org/)
- AlphaFold model: Generated via AlphaFold3 server (https://alphafoldserver.com/)
- Domain annotations: UniProt, InterPro, Pfam

**Software versions:**
- **ChimeraX** version 1.10 (UCSF)
  - Available at: https://www.rbvi.ucsf.edu/chimerax/
- **BioRender** 
  - Figure assembly, labeling, and annotation
  - Available at: https://www.biorender.com/
- **Python** 3.12 via Spyder IDE v5.5.1
  - BioPython for structure analysis
  - NumPy for statistical calculations
  - Matplotlib for confidence visualization
- **AlphaFold3** for NY-ESO-1 full-length structure prediction
  - AlphaFold Server: https://alphafoldserver.com/
- Operating system: [Windows]




```


```
**SWISS-MODEL:**
Waterhouse A, Bertoni M, Bienert S, Studer G, Tauriello G, Gumienny R, Heer FT, de Beer TAP, Rempfer C, Bordoli L, Lepore R, Schwede T. SWISS-MODEL: homology modelling of protein structures and complexes. Nucleic Acids Res 2018;46, W296-W303.

Bienert S, Waterhouse A, de Beer TAP, Tauriello G, Studer G, Bordoli L, Schwede T. The SWISS-MODEL Repository - new features and functionality. Nucleic Acids Res 2017;45, D313-D319.

Guex N, Peitsch MC, Schwede T Automated comparative protein structure modeling with SWISS-MODEL and Swiss-PdbViewer: A historical perspective. Electrophoresis 2009;30, S162-S173.

Studer G, Rempfer C, Waterhouse AM, Gumienny R, Haas J, Schwede T. QMEANDisCo - distance constraints applied on model quality estimation.
Bioinformatics 2020;36, 1765-1771.

Bertoni M, Kiefer F, Biasini M, Bordoli L, Schwede T. Modeling protein quaternary structure of homo- and hetero-oligomers beyond binary interactions by homology. Scientific Reports 2017;7.




## License

This work is licensed under [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/)

- PDB structures: SWISS-MODEL (https://swissmodel.expasy.org/)
- AlphaFold3 model: Generated for this study
- Annotations and analysis: CC BY 4.0

## Contact

[Nik Mohd Asri Nik Amirah Auni]  
[nikamirahauni@gmail.com]  
[Department of Immunology, School of Medical Sciences, Universiti Sains Malaysia]

## Acknowledgments

- PDB structures obtained from SWISS-MODEL (https://swissmodel.expasy.org/)
- AlphaFold3 prediction via AlphaFold Server
- Visualization performed with UCSF C
