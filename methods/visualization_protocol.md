# 🎇 Structural Visualization Protocol

## 🖥️ Software

- **ChimeraX** version 1.10 (UCSF; https://www.rbvi.ucsf.edu/chimerax/)
- **Python** 3.12 with BioPython for AlphaFold3 analysis
- **AlphaFold3** for NY-ESO-1 full-length structure prediction

## 🧬 Structure Sources

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
  - Model file: P78358.cif

---

## 📋 Protocol

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
**Note:** Hydrophobic pockets shown in figures represent key interactions identified in the original structural studies. Complete interaction networks can be explored in the ChimeraX session files.

---

## 🎨 Color Scheme and Visualization Details

All structural figures were prepared using UCSF ChimeraX v1.10 with consistent color schemes:

### Standard Color Scheme for pMHC-TCR Complexes

**For pMHC structures:**
- MHC α-chain: Light blue-gray (#636363, 75% transparency)
- β2-microglobulin: Dark blue-gray (#3B3B3B, 45% transparency)
- Peptide: Bright red (#FF0000) 
- Additional peptides: Orange (#E7872B) or cyan (#8DDBEE)

**For pMHC-TCR complexes:**
- TCRα chain: Soft peach/orange (#FF4F00)
- TCRβ chain: Soft blue (#0474BA)

**For pMHC-antibody complexes:**
- Antibody heavy chain: Soft peach/orange (#FF4F00)
- Antibody light chain: Soft blue (#0474BA)

**Interaction elements:**
- Hydrogen bonds: Black dashed lines (radius 0.3, dash length 5)
- Hydrophobic pockets: Yellow surface

**Residue representation:**
- Solvent-exposed residues (for TCR recognition): Blue (5AA0E0)
- Buried anchor residues (for MHC binding): Orange (F99F04)

---

## ⚗️ AlphaFold3 Model Analysis

### Full-Length NY-ESO-1 Structure

**Model Information:**
- Sequence: 180 amino acids (UniProt: P78358)
- Prediction method: AlphaFold3
- Model file: P78358.cif
- Overall quality: Mean pLDDT 63.15

### Pcc-1 Domain Identification

The Pcc-1 domain in the full-length NY-ESO-1 AlphaFold model was identified using:

### Domain Annotation
- **Database:** PANTHER Protein Classification System
- **PANTHER ID:** PTHR31283
- **InterPro ID:** IPR015419
- **Family:** EKC/KEOPS complex subunit PCC1 family member
- **UniProt entry:** P78358
- **Domain location:** Residues 82-168

### Verification Method
Domain boundaries were verified using:
1. **PANTHER classification** (http://www.pantherdb.org/) - PTHR31283
2. **InterPro integration** (https://www.ebi.ac.uk/interpro/) - IPR015419
3. **UniProt annotation** (https://www.uniprot.org/uniprotkb/P78358)

### Biological Context
The Pcc-1 domain is a conserved protein domain found in EKC/KEOPS (Endopeptidase-like and Kinase Associated with transcribed Chromatin/Kinase, pUtative Endopeptidase and Other Proteins of Small size) complex subunits. This domain has been implicated in transcriptional regulation and cell cycle progression.

### Visualization in ChimeraX
The Pcc-1 domain (residues 82-168) was highlighted in the AlphaFold3 model:
```chimerax
# Select Pcc-1 domain
select :82-168

# Color domain region
color sel yellow

# Show as cartoon
cartoon sel

# Label domain
label :125 text "Pcc-1 domain (82-168)" size 20 color black
```

### Confidence Analysis
The Pcc-1 domain region showed higher structural confidence compared to the N-terminal glycine-rich region:

| Region | Residues | Mean pLDDT | Classification | Notes |
|--------|----------|------------|----------------|-------|
| N-terminal | 1-81 | 39.6 | Low confidence | Intrinsically disordered |
| **Pcc-1 domain** | **82-168** | **85.0** | **High confidence** | **Structured, functional domain** |
| C-terminal tail | 169-180 | 63.7 | Medium confidence | Partially ordered |
| Epitope region | 157-165 | 88.2 | High confidence | Within Pcc-1 domain |

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

## 🖼 Figure Preparation

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

### Figure-Specific Details

- Figure Assembly and Annotation in BioRender (https://www.biorender.com/)
- Raw structural images from ChimeraX were uploaded into BioRender for final figure preparation
- Text annotations were added: Robotto font, black

---

## 📂 Session Files

ChimeraX session files (.cxs) containing all visualizations, annotations, and camera angles are provided in the `chimerax_sessions/` directory. To reproduce figures:

1. Open ChimeraX
2. Load session file: `File → Open` → select `.cxs` file
3. All colors, labels, and hydrogen bonds will be restored
4. Export using commands above

---

## 💡 Notes and Limitations

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

## 📚 References

### Software Citations

**ChimeraX:**
Pettersen EF, Goddard TD, Huang CC, et al. UCSF ChimeraX: Structure visualization for researchers, educators, and developers. Protein Sci. 2021;30(1):70-82. doi:10.1002/pro.3943

**AlphaFold3:**
Abramson J, Adler J, Dunger J, et al. Accurate structure prediction of biomolecular interactions with AlphaFold 3. Nature. 2024;630:493-500. doi:10.1038/s41586-024-07487-w

**Spyder:**
Spyder Project Contributors. Spyder - The Scientific Python Development Environment. 
Available at: https://www.spyder-ide.org/

**Python:**
Van Rossum G, Drake FL. Python 3 Reference Manual. Scotts Valley, CA: CreateSpace; 2009.

### Database Citations

**RCSB Protein Data Bank:**
H.M. Berman, J. Westbrook, Z. Feng, G. Gilliland, T.N. Bhat, H. Weissig, I.N. Shindyalov, P.E. Bourne, The Protein Data Bank (2000) Nucleic Acids Research 28: 235-242 https://doi.org/10.1093/nar/28.1.235.

**UniProt:**
The UniProt Consortium. UniProt: the universal protein knowledgebase in 2021. Nucleic Acids Res. 2021;49(D1):D480-D489.

**PANTHER:**
Mi H, Muruganujan A, Ebert D, Huang X, Thomas PD. PANTHER version 16: a revised family classification, tree-based classification tool, enhancer regions and extensive API. Nucleic Acids Res. 2021;49(D1):D394-D403. doi:10.1093/nar/gkaa1106

**InterPro:**
Paysan-Lafosse T, Blum M, Chuguransky S, et al. InterPro in 2022. Nucleic Acids Res. 2023;51(D1):D418-D427.
