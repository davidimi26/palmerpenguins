# Homework 5: Analyzing the Palmer Penguins Dataset
# Student: David Imiruaye

# Load the package and its penguins dataset.
library(palmerpenguins)

# Display the first six observations to inspect the dataset.
head(penguins)

# Keep only numeric variables because means and standard deviations
# cannot be calculated for categorical variables.
numeric_data <- penguins[sapply(penguins, is.numeric)]

# Task 1: Calculate the mean of every numeric column.
# MARGIN = 2 tells apply() to work column by column.
numeric_means <- apply(
  numeric_data,
  MARGIN = 2,
  FUN = mean,
  na.rm = TRUE
)

print(numeric_means)

# Task 2: Count the number of penguins in each species.
species_counts <- tapply(
  penguins$species,
  penguins$species,
  length
)

print(species_counts)

# Task 3: Split bill lengths by species and calculate each mean.
bill_length_means <- lapply(
  split(penguins$bill_length_mm, penguins$species),
  mean,
  na.rm = TRUE
)

print(bill_length_means)

# Task 4: Calculate the mean and standard deviation of each numeric variable.
summary_table <- sapply(
  numeric_data,
  function(x) {
    c(
      mean = mean(x, na.rm = TRUE),
      sd = sd(x, na.rm = TRUE)
    )
  }
)

print(summary_table)
