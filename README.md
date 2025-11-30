<div align="center">

# 🧬 NY-ESO-1 as an Immunotherapeutic Target in Triple-negative Breast Cancer 


### ✨ Structural analysis of NY-ESO-1 in complex with HLA-A2 and TCR/antibody/TCR-like with annotated hydrogen bonds and hydrophobic pockets for immunology review.



**Author:** **Nik** **Mohd** **Asri** **Nik** **Amirah** **Auni,** **Norhanani** **Mohd** **Redzwan,** **Faezahtul** **Arbaeyah** **Hussain,** **Maya** **Mazuwin** **Yahya,** **Suzina** **Sheikh** **Ab.** **Hamid,** **Kah** **Keng** **Wong**  



</div>

---

## 📋 Repository Overview
- **7 experimental crystal structures** from PDB and **1 AlphaFold3-predicted structure** (NY-ESO-1 full-length)

- ChimeraX session files with structural annotations

- Analysis scripts and methods to visualize the hydrogen bonds and hydrophobic pockets of pMHC-TCR/antibody complexes

---

## 🚀 Quick Start

**Want to jump right in? Here's the fastest way:**

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

---

## 📂 Repository Structure
```
├── structures/          # PDB and CIF files   
│   ├── experimental/   # Crystal structures from PDB   
│   └── predicted/      # AlphaFold3 model with confidence data   
├── ChimeraX_sessions/  # Session files (.cxs) with annotations   
├── figures/            # Publication-quality images   
├── scripts/            # Analysis scripts   
└── methods/            # Detailed protocols   
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

🎨 4. Figures created with BioRender

Final figures were assembled in BioRender (https://www.biorender.com/)
- Raw ChimeraX images exported at 3000×2000 px   
- Panels assembled with consistent formatting   
- Text annotations: Roboto font, black
- Publication-quality layouts (.jpg, 600 dpi)

**Figures:**

https://github.com/NikAmirahAuni/NY-ESO-1-Structural-Analysis/blob/main/figures/Fig%201%20NYESO1%20in%20TNBC.jpeg

**Figure 1 NY-ESO-1 epitope map and peptide-MHC structure**   
- Panel A: Immunological epitopes (antibody vs T cell regions)   
- Panel B: Crystal structure showing solvent-exposed and buried residues (1S9W)
- Panel C: Structural comparison of C-terminal peptide variants (1S9W, 1S9X, 1S9Y)

https://github.com/NikAmirahAuni/NY-ESO-1-Structural-Analysis/blob/main/figures/Fig%202%20NYESO1%20in%20TNBC.jpeg

**Figure 2 Full-length NY-ESO-1 structure and function**
- AlphaFold3 model with Pcc-1 domain highlighted in yellow
- Expression timeline during fetal development
- Molecular function in spermatogonial development

https://github.com/NikAmirahAuni/NY-ESO-1-Structural-Analysis/blob/main/figures/Fig%203%20NYESO1%20in%20TNBC.jpeg

**Figure 3 Recognition by different binding molecules**
- Panel A: Fab antibody (3HAE) - key contacts at Met4/Trp5
- Panel B: TCR (2BNQ) - similar recognition strategy as antibody
- Panel C: TRACeR-I (9DL1) - hydrophobic pocket accomodation and H-bond stabilizing the complex
- Pandel D: TCR mimic (9MIN) - compact binding mode

---

## 🎯 Key Findings

- **H-bond networks** stabilize peptide-MHC complexes with TCR/antibody/TCR-like molecules
- **Conserved hydrophobic pockets** in TRACeR-I accommodating peptide hotspot residues (MW peg)
- **AlphaFold3 model** reveals full structural context of immunogenic NY-ESO-1 regions and the Pcc-1 domain (residues 82-168)
- **Central peptide bulge** formed by Met4/Trp5 serves as primary recognition site across all binding modes

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

**Python packages:**
```
pip install biopython numpy matplotlib
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
