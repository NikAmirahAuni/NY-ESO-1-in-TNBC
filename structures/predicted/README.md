# 🤖 Predicted Structures

This folder contains the AlphaFold3-predicted full-length NY-ESO-1 structure.

## 📥 Files

- `P78358.cif` - AlphaFold3 model
- `P78358_summary_confidences.json` - Confidence metrics
- `P78358_model_info.txt` - Analysis results
- `ny_eso1_confidence_plot.png` - Visualization

## 🎯 Model Information

- **Protein:** NY-ESO-1 (full-length, 180 aa)
- **UniProt ID:** P78358
- **Source:** [AlphaFold3 Server](https://alphafoldserver.com/)
- **Mean pLDDT:** 63.15

## 🔬 Quality Metrics

| Region | Residues | pLDDT | Confidence |
|--------|----------|-------|------------|
| N-terminal | 1-81 | 39.6 | Low (disordered) |
| Pcc-1 domain | 82-168 | 85.0 | High |
| Epitope | 157-165 | 88.2 | High |
| C-terminal | 169-180 | 63.7 | Medium |

## 📖 How to Use

Run the analysis script:
```bash
cd scripts/
python analyze_nyeso1.py
```
