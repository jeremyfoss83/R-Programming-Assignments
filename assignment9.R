# Assignment 9 - Visualization in R

# Load the iris dataset
data("iris", package = "datasets")

# Preview the dataset
head(iris)

# Base R Graphics

# Scatter plot
plot(iris$Sepal.Length, iris$Petal.Length,
     main = "Base R: Sepal Length vs. Petal Length",
     xlab = "Sepal Length (cm)",
     ylab = "Petal Length (cm)")

# Histogram
hist(iris$Petal.Length,
     main = "Base R: Distribution of Petal Length",
     xlab = "Petal Length (cm)")

# Lattice Graphics
library(lattice)

# Scatter plot separated by flower species
xyplot(Petal.Length ~ Sepal.Length | Species,
       data = iris,
       main = "Lattice: Sepal vs. Petal Length by Species",
       xlab = "Sepal Length (cm)",
       ylab = "Petal Length (cm)")

# ggplot2 Graphics
library(ggplot2)

# Scatter plot with colors and trend lines
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length,
                 color = Species)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "ggplot2: Sepal vs. Petal Length by Species",
       x = "Sepal Length (cm)",
       y = "Petal Length (cm)")
