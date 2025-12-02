# 🛠 Analysis Scripts

## 📝 analyze_nyeso1.py

Python script to analyze AlphaFold3 confidence metrics for the NY-ESO-1 model.

### ⚙️ Requirements   

```python
pip install biopython numpy matplotlib
```

### 🔧 Usage   

```python
import os
os.chdir("path/to/scripts/")

%run analyze_nyeso1.py
```

### 📂 Inputs

- `P78358.cif` - AlphaFold3 structure
- `P78358_summary_confidences.json` - Confidence metrics

### 📑 Outputs

- `P78358_model_info.txt` - Detailed confidence analysis
- `ny_eso1_confidence_plot.png` - Visualization of pLDDT scores

### 🔥 What It Does

1. Extracts pLDDT scores from CIF file
2. Reads AlphaFold3 quality metrics from JSON
3. Analyzes confidence by protein region
4. Generates comprehensive report
5. Creates confidence visualization
