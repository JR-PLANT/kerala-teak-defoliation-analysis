
Teak Defoliator (Hyblaea puera) Analysis: Forest Management & Tree Growth

This project explores how silvicultural management and biological control influence leaf damage caused by the teak defoliator (Hyblaea puera) also known as Thekkilayan in keralam and how that damage impacts annual tree growth in teak plantations. Outbreaks of H. puera larvae strip canopy foliage during peak growth periods, directly reducing annual wood volume increment and overall plantation productivity. I built this repository as part of my independent learning journey in R to showcase my quantitative mindset and analytical potential.

My Learning Note

This is my very first data analysis project in R! Coming from a forestry background, I wanted to learn how to bridge field entomology with quantitative data skills. I wrote this script step-by-step to practice turning ecological hypotheses into data simulations, performing foundational statistical tests (One-Way ANOVA and Simple Linear Regression), and creating clear data visualizations with ggplot2.

What’s in This Repository

teak_analysis.R: The complete R script that generates the plantation dataset, performs statistical analysis, and exports visualization plots.

teak_data.csv: A CSV file containing simulated observations for 40 forest study plots.

defoliation_boxplot.png: A boxplot comparing canopy leaf damage percentage across four different stand management systems.

trunk_growth_loss.png: A scatter plot with a linear trendline illustrating the relationship between foliar damage and annual diameter growth loss.

The Dataset

To test these forest health questions reproducibly, I simulated a 40-plot plantation dataset (set.seed(123)) based on typical biological parameter ranges reported in Kerala forestry literature (10 plots per management type):

Stand_Type: The forest management regime (Only_Teak monoculture, Teak_Understory with retained native shrubs, Mixed_Forest with mixed tree species, and Bio_Spray using HpNPV bio-pesticide).

Leaves_Eaten_Pct: Estimated percentage of canopy leaf area eaten by caterpillars during peak monsoon outbreaks (0–100%).

Trunk_Growth_cm: Measured annual trunk diameter growth (DBH increment) in centimeters.

How to Run This

Anyone reviewing this repository can easily reproduce the statistical outputs and plots in R or RStudio:

Open R or RStudio on your system.

Install and load ggplot2:

install.packages("ggplot2")
library(ggplot2)


Download and run teak_analysis.R. The script will generate teak_data.csv, display the ANOVA and regression summaries in the R console, and save both plot images to your working directory.

Main Observations & Outputs

1. Forest Diversity and Biological Control Suppress Defoliation

Pure teak monocultures (Only_Teak) experienced the highest level of canopy damage, averaging around 75% defoliation. Incorporating natural understory vegetation (Teak_Understory) reduced leaf loss to ~45%, while mixed-species stands (Mixed_Forest) and targeted biological control (Bio_Spray) kept defoliation levels lowest, under 30%.

2. Canopy Loss Directly Reduces Trunk Diameter Growth

The simple linear regression revealed a strong negative relationship between canopy defoliation and radial timber increment. For every 10% increase in leaf loss, annual trunk diameter growth decreased by approximately 0.1 cm.

Next Steps in My R Journey

Generalized Linear Models (GLMs): Learn how to model count and proportion data that do not meet standard normality assumptions.

Spatial Pest Mapping: Learn spatial R packages (sf and terra) to map insect pest outbreak risk across landscapes using GIS data.
