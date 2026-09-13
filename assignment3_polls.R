# Assignment 3: Analyzing fictional polling data
# Jeremy Foss
# 9/13/2026

# BLOG Post: https://jeremy-r-programming.blogspot.com/2026/09/assignment-3-analyzing-fictional.html


# Create three vectors
Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
ABC_poll <- c(4, 62, 51, 21, 2, 14, 15)
CBS_poll <- c(12, 75, 43, 19, 1, 21, 19)

# Combine the vectors into a data frame
df_polls <- data.frame(Name, ABC_poll, CBS_poll)

# Inspect the structure and first six rows
str(df_polls)
head(df_polls)

# Summary statistics for ABC
mean(df_polls$ABC_poll)
median(df_polls$ABC_poll)
range(df_polls$ABC_poll)

# Summary statistics for CBS
mean(df_polls$CBS_poll)
median(df_polls$CBS_poll)
range(df_polls$CBS_poll)

# Add a column for the difference between CBS and ABC:
df_polls$Diff <- df_polls$CBS_poll - df_polls$ABC_pol

# Display the table
print(df_polls)

# Load the plotting package
library(ggplot2)

# Organize the two polls for plotting
polls_long <- data.frame(
  Name = rep(df_polls$Name, times = 2),
  Poll = rep(c("ABC", "CBS"), each = nrow(df_polls)),
  Value = c(df_polls$ABC_poll, df_polls$CBS_poll)
)

# Keep candidates in their original order
polls_long$Name <- factor(polls_long$Name, levels = df_polls$Name)

# Create a side-by-side bar chart
poll_chart <- ggplot(polls_long, aes(x = Name, y = Value, fill = Poll)) +
  geom_col(position = "dodge") +
  labs(
    title = "Comparing Fictional ABC and CBS Poll Values",
    subtitle = "2016 polling exercise: made-up data",
    x = "Candidate",
    y = "Poll Value",
    fill = "Poll"
  ) +
  theme_minimal()

# Display the chart
print(poll_chart)