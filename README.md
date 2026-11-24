#  Kerala Teak (*Tectona grandis*) – Thekkilayan* Defoliation & Timber Growth Analysis


This is an applied forest entomology and biostatistics project I built in **R** to quantify how silvicultural stand diversity and biological control influence **Teak Defoliator (*Hyblaea puera*)**—locally known as ***Thekkilayan*** in Kerala—outbreak severity and annual radial timber growth (**DBH increment**) in Kerala's Nilambur–Wayanad teak belt.

Coming from a plant science background, this is my first data analysis project in R. I designed this analysis to bridge field entomology with quantitative data skills—practicing reproducible data simulation, experimental hypothesis testing (**One-Way ANOVA**), growth-loss modeling (**Simple Linear Regression**), and publication-style visualizations (`ggplot2`).
---

### 🌍 Ecological Background & Problem Statement

**Teak (*Tectona grandis*)** is one of South India’s most prized timber trees, especially across the Nilambur Valley and Wayanad in Kerala. Every year, as the Southwest Monsoon arrives between May and July, these plantations get hit by waves of the **Teak Defoliator (*Hyblaea puera*)**—known locally as ***Thekkilayan***.

* **Losing Leaves When It Matters Most:** The caterpillars feed on fresh, tender teak leaves right when the trees should be putting on their fastest growth. A single outbreak won't usually kill a mature tree, but stripping the canopy takes away its ability to make food, which directly cuts into its yearly wood growth.
* **Why Diversity Helps:** Pure teak plantations are basically an all-you-can-eat buffet for these caterpillars, with very little shelter left for birds, wasps, and other natural predators. Leaving native shrubs on the forest floor, mixing teak with other local trees, or using a targeted bio-pesticide (***HpNPV***) gives the forest a much better chance of keeping outbreaks in check.

---

###  Research Questions

1. **Silvicultural & Biocontrol Efficacy (One-Way ANOVA):** Does canopy defoliation (`Leaves_Eaten_Pct`) differ significantly across four stand management systems (`Only_Teak`, `Teak_Understory`, `Mixed_Forest`, and `Bio_Spray`)?
2. **Timber Growth Impact (Linear Regression):** How strongly does canopy defoliation percentage reduce annual trunk diameter growth (`Trunk_Growth_cm`)?

---
###  The Dataset

To test these questions reproducibly, I simulated a **40-plot dataset** (`teak_data.csv`, 10 plots per group) in R using `set.seed(123)`. The values are based on typical defoliation ranges reported in Kerala Forest Research Institute (KFRI) studies:

| Stand Type | Management Style | Average Leaf Damage |
| :--- | :--- | :--- |
| **`Only_Teak`** | Pure teak plantation | ~75% (±6%) |
| **`Teak_Understory`** | Teak with natural understory shrubs | ~45% (±6%) |
| **`Mixed_Forest`** | Teak mixed with other native tree species | ~28% (±5%) |
| **`Bio_Spray`** | Teak treated with *HpNPV* bio-pesticide | ~20% (±5%) |

Annual radial trunk growth (`Trunk_Growth_cm`) was modeled as a linear response to foliar loss starting from a healthy baseline increment of $1.30\text{ cm/year}$, decreasing at a rate of $0.01\text{ cm}$ per percentage point of canopy defoliation (approximately $0.1\text{ cm}$ lost per $10\%$ increase in leaf loss) plus plot-level random variation ($\text{SD} = 0.06\text{ cm}$).

---

###  Statistical Workflow & Key Findings

1. **One-Way Analysis of Variance (`aov`) & Tukey's HSD (`TukeyHSD`):**
   * Evaluates `Leaves_Eaten_Pct ~ Stand_Type` to test whether differences in mean foliar damage across stand types exceed within-group plot variation.
   * `TukeyHSD()` performs pairwise comparisons across all four stand types, confirming statistically significant reductions ($p < 0.001$) in defoliation under `Mixed_Forest` ($\sim 28\%$), `Teak_Understory` ($\sim 45\%$), and `Bio_Spray` ($\sim 20\%$) compared to pure `Only_Teak` stands ($\sim 75\%$).
2. **Simple Linear Regression (`lm`):**
   * Models `Trunk_Growth_cm ~ Leaves_Eaten_Pct` to quantify radial growth loss per unit increase in foliar damage.
   * Confirms a strong negative linear relationship ($p < 0.001$), illustrating how severe early-monsoon defoliation directly translates into measurable annual DBH increment loss.

---

### charts

#### 1. Canopy Defoliation Across Forest Stand Types
![Leaf Damage Boxplot](defoliation_boxplot.png)
*Comparison of peak monsoon defoliation (%) across the four stand management regimes (`n = 10` plots per group). Pure teak monocultures experience the highest median defoliation, whereas mixed-species stands and HpNPV biocontrol substantially reduce canopy loss.*

#### 2. Relationship Between Canopy Defoliation and Annual Trunk Growth
![Trunk Growth Loss](trunk_growth_loss.png)
*Linear regression fit (`geom_smooth(method = "lm")`) with 95% confidence interval showing annual DBH increment (`cm`) declining steadily as canopy defoliation (`%`) increases.*

---

###  Repository Structure

```text
├── defoliation_boxplot.png    # Boxplot comparing leaf damage across stand types
├── README.md                  # Project background, methodology, and results
├── teak_analysis.R            # Complete R script for simulation, ANOVA, LM, and plots
├── teak_data.csv              # Generated 40-plot plantation dataset
└── trunk_growth_loss.png      # Linear regression plot of trunk growth vs. defoliation
```

---

###  How to Run This

Anyone reviewing this repository can easily reproduce the dataset, statistical outputs, and plots in R or RStudio:

1. Open **R** or **RStudio** on your system.
2. Install and load `ggplot2`:
   ```r
   install.packages("ggplot2")
   library(ggplot2)
   ```
3. Download and run `teak_analysis.R`. The script will automatically generate `teak_data.csv`, print the ANOVA, Tukey's HSD, and regression summaries to the console, and save both plot images to your working directory.
