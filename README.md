# twostate-thermompnn

This github repo contains a jupyter notebook which was used for the difference map calculation of the following paper:

**Stabilization of viral glycoproteins in prefusion conformation using ThermoMPNN with negative state design**
(Riccabona, Peter et al. 2025; unpublished)

---
## pipeline overview

![graphical-abstract](https://github.com/user-attachments/assets/6f99c2c2-9981-4158-b3c8-37dd6d81d061)

Thermostability profiles are calculated with the THERMOMPNN default model. If experimentally determined structures contained non-resolved regions in one of the states, these regions have to be excluded for the generation of the difference map.

The difference map are calculated with:

<p align="center">
$∆∆G = ∆G_{prefusion} - ∆G_{postfusion}$
</p>

Since the ΔΔG-based difference calculation is not sensitive to slightly destabilizing mutations in the pre-fusion conformation, we introduced a scoring function to more effectively prioritize stabilizing mutations. 

This function is defined as:

<p align="center">
    $S = ∆∆G + λ × max⁡(0, ∆G_{prefusion} - ∆G_{threshold})$
</p>

with `λ = 10` being a weighting factor and `∆G_threshold = 0.2 kcal/mol` represents a destabilizing tolerance threshold. This formulation penalizes mutations that increased the free energy of the pre-fusion state beyond the defined threshold.

---
## Repository Structure

this Repository contains the following files:

```
twostate-thermompnn/
├── create-differencemap.ipynb # jupyter notebook that contains the code for the difference map generation
├── rosetta/ # containes the necessary input files to run the rosetta jobs described in the paper
└── data/ # containes the raw computational data that is analyzed in the paper
```

Note: the scripts are optimized for viral glycoproteins, which are multimeric proteins. For the biopyhsical analysis, you need to create a symmetry file beforehand. 
**This repository just describes how the data was analyzed.**
For ThermoMPNN predictions, please visit: https://github.com/Kuhlman-Lab/ThermoMPNN

---
## necessary packages for the analysis

```
pip install pandas numpy seaborn matplotlib
```