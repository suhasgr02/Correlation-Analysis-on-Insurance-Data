# Correlation-Analysis-on-Insurance-Data
This repository contains an R-based analysis of insurance data, focusing on identifying correlations between variables such as age, BMI, smoking status, and insurance charges. The analysis includes colorful visualizations like correlation heatmaps, pairwise plots, and scatter plots to present key relationships.

### Overview
This R code performs a comprehensive correlation analysis and visualization of relationships between various variables in an insurance dataset. It explores numeric data relationships using correlation matrices and scatterplots and compares categorical variables using boxplots.

### Step-by-Step Breakdown

1. **Loading Libraries**:
   - `ggplot2`: Used for creating advanced visualizations.
   - `reshape2`: Helps reshape data, though not explicitly used in this code.
   - `corrplot`: Provides tools for visually exploring correlation matrices.
   - `dplyr`: Simplifies data manipulation tasks such as filtering and selecting columns.
   -  `GGally`: Creates a grid of pairwise plots for a set of variables. These plots can include scatterplots, correlation coefficients, histograms, and density plots.

2. **Reading the Dataset**:
   The dataset, `"insurance details.csv"`, is loaded into R and stored as `insurance_data`. The `head()` function displays the first few rows to give an initial look at the data.

3. **Data Preprocessing**:
   - The categorical columns (`sex`, `smoker`, `region`) are converted to factors to ensure proper handling in analysis and visualization. This is important for differentiating between categorical and numeric data, especially when visualizing relationships.

4. **Step 1: Correlation Analysis**:
   - **Data Selection**: Only numeric columns (`age`, `bmi`, `children`, and `charges`) are selected for correlation analysis. This step filters out categorical variables since correlations require numerical data.
   - **Correlation Matrix**: The `cor()` function computes the correlation matrix, revealing the strength and direction of linear relationships between these numeric variables. 
   - **Interpretation**: Values close to 1 or -1 suggest strong positive or negative correlations, respectively, while values near 0 indicate weak or no correlation.

5. **Step 2: Visualizing the Correlation Matrix**:
   - The `corrplot()` function visualizes the correlation matrix with a colorful plot. 
   - **Color Scheme**: A gradient from blue (negative correlation) to white (no correlation) to red (positive correlation) visually distinguishes the strength and direction of correlations.
   - **Customization**: Correlation values are added in black, making it easy to interpret the numeric correlations, and labels are rotated for readability.

6. **Step 3: Scatterplots for Individual Relationships**:
   - **Age vs Charges**: A scatterplot examines the relationship between age and insurance charges, with smokers and non-smokers distinguished by color. A linear regression line (`geom_smooth`) shows the trend between the two variables.
   - **BMI vs Charges**: Similar to the age vs charges plot, this visualization examines the relationship between Body Mass Index (BMI) and insurance charges. Smokers vs non-smokers are again differentiated by color.

7. **Pairwise Relationships**:
   - A `ggpairs()` plot shows pairwise relationships between multiple variables (age, BMI, children, charges, smoker) using both scatterplots and correlation coefficients. This visualization provides an intuitive overview of relationships between several variables in one plot.

8. **Step 4: Boxplots for Categorical Variables**:
   Boxplots provide a visual summary of the distribution of insurance charges across categorical variables:
   - **Smoker vs Charges**: The plot shows how insurance charges differ between smokers and non-smokers. Since smokers tend to have higher health risks, they may incur higher charges.
   - **Region vs Charges**: This plot compares how charges vary across different geographic regions, possibly reflecting regional healthcare cost differences.
   - **Sex vs Charges**: The distribution of charges based on sex is visualized here, potentially exploring any gender-related differences in insurance costs.

### Conclusion:
This code effectively combines correlation analysis and visualizations to explore the relationships between numeric variables and how categorical factors (like smoker status, region, and sex) impact insurance charges. The combination of correlation matrices, scatterplots, and boxplots offers a comprehensive look at both linear relationships and group-based comparisons within the dataset.

