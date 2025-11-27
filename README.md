# NY-ESO-1-Structural-Analysis

Structural analysis of NY-ESO-1 in complex with HLA-A2 and TCR/antibody/TCR-like with annotated hydrogen bonds and hydrophobic pockets for immunology review.

## Associated Publication
[NY-ESO-1: A Promising Immunotherapeutic Target in Triple-negative Breast Cancer]  
[Nik Mohd Asri Nik Amirah Auni, Norhanani Mohd Redzwan, Faezahtul Arbaeyah Hussain, Maya Mazuwin Yahya, Kah Keng Wong]  

## Repository Contents

This repository contains:
- **7 experimental crystal structures** from PDB
- **1 AlphaFold3-predicted structure** (NY-ESO-1 full-length)
- ChimeraX session files with structural annotations
- Publication-quality figures
- Analysis scripts and methods

## Structure Overview

| ID | Type | PDB/Model | MHC Allele | Peptide | TCR | Source |
|----|------|-----------|------------|---------|-----|--------|
| 1 | Experimental | 1S9W | HLA-A2 | NY-ESO-1 (SLLMWITQC) | - | PDB |
| 2 | Experimental | 1S9X | HLA-A2 | NY-ESO-1 (SLLMWITQA) | - | PDB |
| 3 | Experimental | 1S9Y | HLA-A2 | NY-ESO-1 (SLLMWITQS) | - | PDB |
| 4 | Experimental | 2BNQ | HLA-A2 | NY-ESO-1 (SLLMWITQV) | TCR | PDB |
| 5 | Experimental | 3HAE | HLA-A2 | NY-ESO-1 (SLLMWITQV) | Antibody | PDB |
| 6 | Experimental | 9DL1 | HLA-A2 | NY-ESO-1 (SLLMWITQV) | TRACeR | PDB |
| 7 | Experimental | 9MIN | HLA-A2 | NY-ESO-1 (SLLMWITQV) | TCR mimic | PDB |
| 8 | Predicted | AlphaFold3 | - | NY-ESO-1 (full-length, 180aa) | - | AlphaFold3 |

See `Structures/Structure_metadata.xslx` for complete details.

## Quick Start

### View Structures in ChimeraX

1. Install [ChimeraX](https://www.rbvi.ucsf.edu/chimerax/)
2. Download `.cxs` files from `chimerax_sessions/`
3. Open in ChimeraX (File → Open or drag-and-drop)
4. All annotations (H-bonds, hydrophobic pockets) will be restored

### Analyze AlphaFold3 Model

Run the Python analysis script:
import os
os.chdir("*include your directory*")
%run analyze_nyeso1.py
```

This will generate confidence metrics and visualizations for the NY-ESO-1 model.

## Repository Structure
```
├── structures/          # PDB and CIF files
│   ├── experimental/   # Crystal structures from PDB
│   └── predicted/      # AlphaFold3 model with confidence data
├── chimerax_sessions/  # Session files (.cxs) with annotations
├── figures/            # Publication-quality images
├── scripts/            # Analysis scripts
└── methods/            # Detailed protocols
```

## Key Findings

- H-bond networks to stabilize the binding between peptide-MHC and TCR/antibody/TCR-like
- Identified conserved hydrophobic pockets across TRACeR-I accomodating peptide hotspot residues
- AlphaFold3 model reveals full structural context of immunogenic NY-ESO-1 regions and the Pcc-1 domain

## Methods

Detailed visualization and analysis protocols are available in `methods/visualization_protocol.md`

**Software used:**
- ChimeraX v1.10
- AlphaFold3
- Spyder v5.5.1

## AlphaFold3 Model Details

The NY-ESO-1 full-length structure was predicted using AlphaFold3:
- **Mean pLDDT:** 63.15 (moderate, expected for intrinsically disordered protein)
- **Epitope region (157-165) pLDDT:** 88.15 (high confidence)
- **Fraction disordered:** 58% (consistent with glycine-rich N-terminus)

Full confidence analysis available in `structures/predicted/model_info.txt`

# ChimeraX Session Files

This folder contains ChimeraX session files (.cxs) with all structural annotations.

## How to Use

1. Install [ChimeraX](https://www.rbvi.ucsf.edu/chimerax/) (version 1.10 or later)
2. Open any `.cxs` file:
   - **File → Open** and select the session
   - Or **drag and drop** the file into ChimeraX
3. All annotations will be restored:
   - Hydrogen bonds
   - Hydrophobic pocket highlights

## Session Files

- `Fig 1B (1S9W).cxs` - HLA-A2/NY-ESO-1(157-165) with solvent-exposed or buried residues
- `Fig 1C (1S9W, 1S9X, 1S9Y).cxs` - HLA-A2/NY-ESO-1(157-165) with substitution at residue 9 of peptide with Alanine or Serine
- `Fig 2 (P79358).cxs` - Full-length NY-ESO-1 (AlphaFold3), with Pcc-1 domain
- `Fig 3A (3HAE).cxs` - HLA-A2/NY-ESO-1(157-165) in complex with Fab antibody with H-bonds
- `Fig 3B (2BNQ).cxs` - HLA-A2/NY-ESO-1(157-165) in complex with TCR with H-bonds
- `Fig 3C (9DL1).cxs` - HLA-A2/NY-ESO-1(157-165) in complex with TRACeR-I with H-bonds and hydrophobic pockets of TRACeR-I
- `Fig 3D (9MIN).cxs` - HLA-A2/NY-ESO-1(157-165) in complex with TCR mimic with H-bonds

## Tips

- The structures reference PDB files in `../Structures/`
- Keep the folder structure intact for sessions to load properly
- To export images: **File → Save → Image**

# Figure

## Figure 1: Schematic Representation of Immunologic Epitopes of NY-ESO-1 and Structure of NY-ESO-1 Peptide Bound to HLA-A2

### Panel A: Immunological Epitope Map of NY-ESO-1
Map of immunological epitopes of NY-ESO-1. The green area is rich in epitopes recognized by antibodies. The naturally occurring anti-NY-ESO-1 antibodies mostly map to this soluble N-terminus region. The purple area, the C-terminus region corresponding to cellular responses, is rich in epitopes recognized by CD4+ and CD8+ T cells.

### Panel B: Crystal Structure of HLA-A2/NY-ESO-1₁₅₇₋₁₆₅ Complex
**PDB ID:** 1S9W  

Crystal structure of NY-ESO-1₁₅₇₋₁₆₅ (SLLMWITQC) bound to HLA-A2, with key residues labeled. The blue residues are solvent-exposed, while orange residues are buried residues for MHC binding.

### Panel C: Structural Comparison of Peptide Variants
**PDB ID:** 1S9W, 1S9X, 1S9Y  

Structural comparison showing that substitution of Cys9 with Ala9 or Ser9 maintains similar geometry with Met4 and Trp5 forming central bulge for TCR recognition.

---

## Figure 2: NY-ESO-1 Expression During Fetal Development and Functional Roles in Spermatogonial Cells

### NY-ESO-1 Expression Timeline
During fetal development, NY-ESO-1 is expressed starting at week 13, reaching peak levels during second trimester (weeks 22-24), and declining before birth.

### Molecular Function in Spermatogonial Cells
NY-ESO-1 is upregulated in spermatogonial cells, containing Pcc-1 domain located at residues 82-168. This Pcc-1 domain mediates NY-ESO-1 incorporation into the EKC/KEOPS complex via Pcc1p. This molecular interaction suggests NY-ESO-1 may play important roles in transcriptional regulation, influencing spermatogonial differentiation and cell cycle progression. However, as noted, the specific transcriptional targets in human germ cells are unknown and require further investigation.

---

## Figure 3: Structural Basis of NY-ESO-1 Recognition by TCR, Antibody, and TCR-like Binding Complexes

### Panel A: HLA-A2/NY-ESO-1₁₅₇₋₁₆₅ in Complex with Fab 3M4E5
**PDB ID:** [3HAE]  

Three-dimensional structure of HLA-A2:NY-ESO-1₁₅₇₋₁₆₅ in complex with Fab 3M4E5, showing heavy chain (orange) and light chain (blue) interactions. Key residues Tyr103 and Glu99 in the Fab interface with the peptide at Met4 and Trp5, serving as central recognition points [54]. Black dashed lines indicate hydrogen bonds.

### Panel B: HLA-A2/NY-ESO-1₁₅₇₋₁₆₅ in Complex with 1G4 TCR
**PDB ID:** [2BNQ]  

Structure of HLA-A2:NY-ESO-1₁₅₇₋₁₆₅ in complex with 1G4 TCR, displaying TCRα (orange) and TCRβ (blue) chains. Similar to Fab recognition, the Tyr100 and Ser93 residues interact with Met4 and Trp5, the key contact points of peptide [54]. Black dashed lines indicate hydrogen bonds.

### Panel C: HLA-A2/NY-ESO-1₁₅₇₋₁₆₅ in Complex with TRACeR
**PDB ID:** [9DL1]  

Structure of HLA-A2:NY-ESO-1₁₅₇₋₁₆₅ in complex with Targeted Recognition of Antigen-MHC Complex Reporter for MHC class I (TRACeR). TRACeR forms extensive contacts across the entire peptide to confer single-residue specificity at the accessible positions (Ser1, Leu2, Leu3, Met4, and Gln8). The hydrophobic pocket (shown in yellow) formed to accommodate Met4 and Trp5 hotspot residues [61]. Black dashed lines indicate hydrogen bonds.

### Panel D: HLA-A2/NY-ESO-1₁₅₇₋₁₆₅ in Complex with TCR Mimic (TCRm)
**PDB ID:** [9MIN]  

Crystal structure of HLA-A2:NY-ESO-1₁₅₇₋₁₆₅ in complex with TCR mimic (TCRm). Structural analysis demonstrates a rigid, TCR-like docking mode in which the binder forms a compact, shape-complementary shell around the peptide, particularly MW motif. Key interacting residues of TCRm include Tyr87, Asn80, and Asn54 contact to Met4, Thr7, and Gln8 of the peptide [63]. Black dashed lines indicate hydrogen bonds.

---

# Analysis Scripts

## analyze_nyeso1.py

Python script to analyze AlphaFold3 confidence metrics for the NY-ESO-1 model.

### Requirements
pip install biopython numpy matplotlib


### Usage
import os
os.chdir("*include your directory*")

%run analyze_nyeso1.py


### Inputs

- `P78358.cif` - AlphaFold3 structure
- `P78358_summary_confidences.json` - Confidence metrics

### Outputs

- `P78358_model_info.txt` - Detailed confidence analysis
- `ny_eso1_confidence_plot.png` - Visualization of pLDDT scores

### What It Does

1. Extracts pLDDT scores from CIF file
2. Reads AlphaFold3 quality metrics from JSON
3. Analyzes confidence by protein region
4. Generates comprehensive report
5. Creates confidence visualization

# Structural Visualization Protocol

## Software

- **ChimeraX** version 1.10 (UCSF)
- Available at: https://www.rbvi.ucsf.edu/chimerax/
- **Python** 3.x with BioPython for AlphaFold3 analysis
- **AlphaFold3** for NY-ESO-1 full-length structure prediction

## Structure Sources

### Experimental Structures (PDB)
All experimental structures were obtained from the RCSB Protein Data Bank (https://www.rcsb.org/):

- **1S9W** - HLA-A2/NY-ESO-1₁₅₇₋₁₆₅ (SLLMWITQC), Resolution: 2.2 Å
- **1S9X** - HLA-A2/NY-ESO-1₁₅₇₋₁₆₅ (SLLMWITQA), Resolution: 2.5 Å
- **1S9Y** - HLA-A2/NY-ESO-1₁₅₇₋₁₆₅ (SLLMWITQS), Resolution: 2.3 Å
- **2BNQ** - HLA-A2/NY-ESO-1₁₅₇₋₁₆₅/1G4 TCR complex, Resolution: 1.7 Å
- **3HAE** - HLA-A2/NY-ESO-1₁₅₇₋₁₆₅/3M4E5 Fab complex, Resolution: 2.9 Å
- **9DL1** - HLA-A2/NY-ESO-1₁₅₇₋₁₆₅/TRACeR complex, Resolution: 2.3 Å
- **9MIN** - HLA-A2/NY-ESO-1₁₅₇₋₁₆₅/TCRm complex, Resolution: 2.05 Å

### Predicted Structure (AlphaFold3)
- **P78358** - Full-length NY-ESO-1 (180 aa)
  - Predicted using AlphaFold3 (https://alphafoldserver.com/)
  - Mean pLDDT: 63.15
  - Model file: fold_p78358_model_0.cif

---

## Protocol

### 1. Loading Structures
```chimerax

# Open PDB file
open 1S9W.ent
open 1S9X.ent
open 1S9Y.ent
open 2BNQ.ent
open 3HAE.ent
open 9DL1ent
open 9MIN.ent

# For AlphaFold models
open P78358.cif
```

### 2. Structural Analysis

#### 2.1 Hydrogen Bond Analysis

**Identification Criteria:**
- Distance: ≤3.5 Å (donor-acceptor)
- Angle: ≥120° (donor-H-acceptor)
- Source: Based on original publications for each structure

**Visualization:**
Hydrogen bonds were manually added based on structural analysis reported in original publications:
```chimerax
# Example: Hydrogen bonds in 9DL1
pbond /A:76@CA /E:1@CA color black dashes 5 radius 0.3
pbond /A:76@CA /E:2@CA color black dashes 5 radius 0.3
pbond /A:72@CA /E:3@CA color black dashes 5 radius 0.3
pbond /A:72@CA /E:4@CA color black dashes 5 radius 0.3
pbond /A:112@CA /E:4@CA color black dashes 5 radius 0.3
pbond /A:10@CA /E:8@CA color black dashes 5 radius 0.3
```
**Note:** Hydrogen bonds shown in figures represent key interactions identified in the original structural studies. Complete interaction networks can be explored in the ChimeraX session files.

#### 2.2 Hydrophobic Pocket Identification

**Method:**
- Visual inspection of peptide-MHC interface
- Focus on aromatic and aliphatic residues
- Identification based on original structural publications

**Visualization:**
```chimerax
# Select hydrophobic pocket residues
select /D:13,/D:16,/D:17,/D:20,/D:72,/D:80,/D:112

# Show surface
surface sel

# Color pocket yellow
color sel yellow
```
---

## Color Scheme and Visualization Details

All structural figures were prepared using UCSF ChimeraX v1.10 with consistent color schemes:

### Standard Color Scheme for pMHC-TCR Complexes

**For pMHC structures:**
- MHC α-chain: Light blue-gray (#636363, 75% transparency)
- β2-microglobulin: Dark blue-gray (#3B3B3B, 45% transparency)
- Peptide: Bright red (#FF0000)

**For pMHC-TCR complexes:**
- TCRα chain: Soft peach/orange (#FF4F00)
- TCRβ chain: Soft blue (#0474BA)

**For pMHC-antibody complexes:**
- Antibody heavy chain: Orange
- Antibody light chain: Blue

**Interaction elements:**
- Hydrogen bonds: Black dashed lines (radius 0.3, dash length 5)
- Hydrophobic pockets: Yellow surface (50% transparency)

**Residue representation:**
- Solvent-exposed residues: Blue (for TCR recognition)
- Buried anchor residues: Orange (for MHC binding)

### Figure-Specific Details

- Figure Assembly and Annotation in BioRender
- Raw structural images from ChimeraX were uploaded into BioRender for final figure preparation
- Text annotations were added: Robotto font, black

---

## AlphaFold3 Model Analysis

### Full-Length NY-ESO-1 Structure

**Model Information:**
- Sequence: 180 amino acids (UniProt: P78358)
- Prediction method: AlphaFold3
- Model file: P78358.cif
- Overall quality: Mean pLDDT 63.15

### Pcc-1 Domain Identification

The Pcc-1 domain in the full-length NY-ESO-1 AlphaFold model was identified using:

**Domain Annotation:**
- Database: InterPro/Pfam (PF09341)
- UniProt entry: P78358
- Domain location: Residues 82-168
- Domain family: CTAG/PCC1 family

**Verification Method:**
Domain boundaries were verified using:
1. UniProt annotation (https://www.uniprot.org/uniprotkb/P78358)
2. InterPro domain search (https://www.ebi.ac.uk/interpro/)
3. NCBI Conserved Domain Database (https://www.ncbi.nlm.nih.gov/Structure/cdd/)

**Visualization in ChimeraX:**
```chimerax
# Open AlphaFold model
open P78358.cif

# Color by confidence (pLDDT stored in B-factor)
color bfactor palette alphafold

# Select and highlight Pcc-1 domain
select :82-168
color sel yellow
cartoon sel

```

### Confidence Analysis

AlphaFold3 confidence metrics were extracted using BioPython:

**Regional confidence analysis:**

| Region | Residues | Mean pLDDT | Confidence Level | Structural Character |
|--------|----------|------------|------------------|---------------------|
| N-terminal (glycine-rich) | 1-81 | 39.6 | Low | Disordered |
| Pcc-1 domain | 82-168 | 85.0 | High | Structured |
| C-terminal tail | 169-180 | 63.7 | Medium | Partially ordered |
| **Immunogenic epitope** | **157-165** | **88.2** | **High** | **Well-defined** |

**Interpretation:**
- The Pcc-1 domain shows significantly higher confidence (85.0) compared to the N-terminus (39.6), consistent with its predicted structural role
- Low N-terminal confidence is expected due to the glycine-rich, intrinsically disordered character
- High confidence in the epitope region (88.2) validates the model for comparative analysis with experimental pMHC structures

**Confidence distribution within Pcc-1 domain:**
- High confidence (pLDDT >90): ~35% of domain residues
- Medium confidence (70-90): ~60% of domain residues
- Low confidence (<70): ~5% of domain residues

This distribution indicates the Pcc-1 domain is well-predicted and suitable for structural analysis.

---

## Figure Preparation

### High-Resolution Export
```chimerax
# Set white background
set bgColor white

# Adjust lighting for publication quality
lighting soft

# Export high-resolution image
save figure.png width 3000 height 2000 supersample 3 transparentBackground false
```

### For Multi-Panel Figures
```chimerax
# Save individual panels at consistent size
save panel_A.png width 1500 height 1500 supersample 3
save panel_B.png width 1500 height 1500 supersample 3
save panel_C.png width 1500 height 1500 supersample 3
```

Panels were assembled using [ImageJ/Photoshop/Inkscape] with consistent scaling and labeling.

---

## Session Files

ChimeraX session files (.cxs) containing all visualizations, annotations, and camera angles are provided in the `chimerax_sessions/` directory. To reproduce figures:

1. Open ChimeraX
2. Load session file: `File → Open` → select `.cxs` file
3. All colors, labels, and hydrogen bonds will be restored
4. Export using commands above

---

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



## Citation

If you use these structures, annotations, or methods, please cite:
```
[Citation - add when paper is published]
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

For the AlphaFold3 model, also cite:
```
Abramson, J., Adler, J., Dunger, J. et al. Accurate structure prediction of 
biomolecular interactions with AlphaFold 3. Nature 630, 493–500 (2024).
```
### Software Citations
```
**ChimeraX:**
Pettersen EF, Goddard TD, Huang CC, et al. UCSF ChimeraX: Structure visualization for researchers, educators, and developers. Protein Sci. 2021;30(1):70-82. doi:10.1002/pro.3943

**AlphaFold3:**
Abramson J, Adler J, Dunger J, et al. Accurate structure prediction of biomolecular interactions with AlphaFold 3. Nature. 2024;630:493-500. doi:10.1038/s41586-024-07487-w

**Spyder:**
Spyder Project Contributors. Spyder - The Scientific Python Development Environment. 
Available at: https://www.spyder-ide.org/

**Python:**
Van Rossum G, Drake FL. Python 3 Reference Manual. Scotts Valley, CA: CreateSpace; 2009.
```
### Database Citations
```
**SWISS-MODEL:**
Waterhouse A, Bertoni M, Bienert S, Studer G, Tauriello G, Gumienny R, Heer FT, de Beer TAP, Rempfer C, Bordoli L, Lepore R, Schwede T. SWISS-MODEL: homology modelling of protein structures and complexes. Nucleic Acids Res 2018;46, W296-W303.

Bienert S, Waterhouse A, de Beer TAP, Tauriello G, Studer G, Bordoli L, Schwede T. The SWISS-MODEL Repository - new features and functionality. Nucleic Acids Res 2017;45, D313-D319.

Guex N, Peitsch MC, Schwede T Automated comparative protein structure modeling with SWISS-MODEL and Swiss-PdbViewer: A historical perspective. Electrophoresis 2009;30, S162-S173.

Studer G, Rempfer C, Waterhouse AM, Gumienny R, Haas J, Schwede T. QMEANDisCo - distance constraints applied on model quality estimation.
Bioinformatics 2020;36, 1765-1771.

Bertoni M, Kiefer F, Biasini M, Bordoli L, Schwede T. Modeling protein quaternary structure of homo- and hetero-oligomers beyond binary interactions by homology. Scientific Reports 2017;7.

**UniProt:**
The UniProt Consortium. UniProt: the universal protein knowledgebase in 2021. Nucleic Acids Res. 2021;49(D1):D480-D489.

**InterPro:**
Paysan-Lafosse T, Blum M, Chuguransky S, et al. InterPro in 2022. Nucleic Acids Res. 2023;51(D1):D418-D427.


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
- Visualization performed with UCSF ChimeraX
