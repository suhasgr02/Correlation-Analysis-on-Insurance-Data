# Load required libraries
library(ggplot2)       # For data visualization
library(reshape2)      # For reshaping data
library(corrplot)      # For correlation matrix plot
library(dplyr)         # For data manipulation

# Read the dataset
insurance_data <- read.csv("C:/Users/suhas/Desktop/Suhas Projects/Data Sets/insurance details.csv")

# Display the first few rows of the dataset
head(insurance_data)

# Convert categorical columns into factors
insurance_data$sex <- as.factor(insurance_data$sex)
insurance_data$smoker <- as.factor(insurance_data$smoker)
insurance_data$region <- as.factor(insurance_data$region)

# Step 1: Correlation Analysis
# Select only numeric columns for correlation
numeric_columns <- insurance_data %>%
  select(age, bmi, children, charges)

# Calculate the correlation matrix
correlation_matrix <- cor(numeric_columns)

# Display the correlation matrix
print(correlation_matrix)

# Step 2: Visualizing the Correlation Matrix
# Plot the correlation matrix using corrplot
corrplot(correlation_matrix, method = "color", addCoef.col = "black", 
         tl.col = "black", tl.srt = 45, number.cex = 0.7, 
         col = colorRampPalette(c("blue", "white", "red"))(200))

# Step 3: Scatterplots for individual relationships
# Scatterplot for age vs charges
ggplot(insurance_data, aes(x = age, y = charges, color = smoker)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  labs(title = "Age vs Charges (Smoker Status)", 
       x = "Age", 
       y = "Insurance Charges") +
  theme_minimal()

# Scatterplot for BMI vs Charges
ggplot(insurance_data, aes(x = bmi, y = charges, color = smoker)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  labs(title = "BMI vs Charges (Smoker Status)", 
       x = "BMI", 
       y = "Insurance Charges") +
  theme_minimal()

# Create pairwise plots to visualize relationships between variables
ggpairs(insurance_data, columns = c("age", "bmi", "children", "charges", "smoker"),
        aes(color = factor(smoker), alpha = 0.6)) +
  theme_minimal() +
  ggtitle("Pairwise Correlation Plot")

# Step 4: Boxplots for categorical variables
# Boxplot for smoker vs charges
ggplot(insurance_data, aes(x = smoker, y = charges, fill = smoker)) +
  geom_boxplot() +
  labs(title = "Charges by Smoking Status", 
       x = "Smoker", 
       y = "Insurance Charges") +
  theme_minimal()

# Boxplot for region vs charges
ggplot(insurance_data, aes(x = region, y = charges, fill = region)) +
  geom_boxplot() +
  labs(title = "Charges by Region", 
       x = "Region", 
       y = "Insurance Charges") +
  theme_minimal()

# Boxplot for sex vs charges
ggplot(insurance_data, aes(x = sex, y = charges, fill = sex)) +
  geom_boxplot() +
  labs(title = "Charges by Sex", 
       x = "Sex", 
       y = "Insurance Charges") +
  theme_minimal()


