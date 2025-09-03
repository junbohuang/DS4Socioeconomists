

# Load the necessary ggplot2 library
library(ggplot2)

# Set a seed for reproducibility
set.seed(123)

# Generate random data for years of experience
years_of_experience <- seq(0, 30, by = 1)  # 0 to 30 years

# Create income based on years of experience with a reasonable starting value
income <- 1500 + 45 * years_of_experience + rnorm(length(years_of_experience), mean = 0, sd = 100)  # Adding random noise

# Create a data frame
data <- data.frame(years_of_experience, income)

# Create the scatterplot with the linear regression line and an error band
ggplot(data, aes(x = years_of_experience, y = income)) +
  geom_point(color = "blue") +  # Add points
  geom_smooth(method = "lm", color = "red", se = TRUE, fill = "orange") +  # Add linear regression line and error band
  labs(title = "Scatterplot of Monthly Income vs. Years of experience",
       x = "Years of Expirience",
       y = "Monthly Income (EUR)") +
  scale_y_continuous(breaks = seq(0, 3000, by = 50)) +
  scale_x_continuous(breaks = seq(0, 30, by = 2)) +
  coord_cartesian(xlim = c(0, 30), ylim = c(1400, 2500)) +  # Adjust limits to remove gaps
  theme_minimal()

# Create the scatterplot with the linear regression line and an error band
ggplot(data, aes(x = years_of_experience, y = income)) +
  geom_point(color = "blue") +  # Add points
  geom_smooth(method = "lm", color = "red", se = TRUE, fill = "orange") +  # Add linear regression line and error band
  labs(title = "Scatterplot of Monthly Income vs. Years of experience",
       x = "Years of experience in Company",
       y = "Monthly Income (EUR)") +
  scale_y_continuous(breaks = seq(0, 3000, by = 75)) +
  scale_x_continuous(breaks = seq(0, 30, by = 3)) +
  coord_cartesian(xlim = c(0, 30), ylim = c(1400, 2500)) +  # Adjust limits to remove gaps
  theme_minimal()


# Create the scatterplot with the polynomial regression line and an orange error band
ggplot(data, aes(x = years_of_experience, y = income)) +
  geom_point(color = "blue") +  # Add points
  geom_smooth(method = "lm", formula = y ~ poly(x, 7), color = "red", se = TRUE, fill = "orange") +  # Add polynomial regression line and orange error band
  labs(title = "Scatterplot of Monthly Income vs. Years of experience",
       x = "Years of experience in Company",
       y = "Monthly Income (EUR)") +
  scale_y_continuous(breaks = seq(0, 3000, by = 50)) +
  scale_x_continuous(breaks = seq(0, 30, by = 2)) +
  coord_cartesian(xlim = c(0, 30), ylim = c(1400, 2500)) +  # Adjust limits to remove gaps
  theme_minimal()


# Create income based on years of experience with a reasonable starting value
# Introduce a downward curvature
income <- 3000 - 50 * years_of_experience + 
  0.5 * (years_of_experience^2) +  # Adding a quadratic term to create a downward slope
  rnorm(length(years_of_experience), mean = 0, sd = 100)  # Adding random noise

# Create a data frame
data2 <- data.frame(years_of_experience, income)

# Create the scatterplot with the polynomial regression line and an orange error band
ggplot(data2, aes(x = years_of_experience, y = income)) +
  geom_point(color = "blue") +  # Add points
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), color = "red", se = TRUE, fill = "orange") +  # Add polynomial regression line and orange error band
  labs(title = "Scatterplot of Monthly Income vs. Years of experience",
       x = "Years of experience in Company",
       y = "Monthly Income (EUR)") +
  scale_y_continuous(breaks = seq(0, 3000, by = 50)) +
  scale_x_continuous(breaks = seq(0, 30, by = 2)) + 
  theme_minimal()