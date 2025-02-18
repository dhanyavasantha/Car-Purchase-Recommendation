path_to_csv <- "car_evaluation.csv"

# Read the CSV file into a data frame
df <- read.csv(path_to_csv)

# Load the required libraries
library(ggplot2)
library(dplyr)


# Calculate the overall probability of 'very good' class
probability_very_good <- mean(df$class == "vgood")

# Print the probability
cat("Probability of being classified as 'very good':", probability_very_good, "\n")


# Create a data frame for counts
count_df <- df %>%
  group_by(lug_boot, buying) %>%
  summarise(Freq = n())

# Calculate proportions
count_df <- count_df %>%
  group_by(lug_boot) %>%
  mutate(Proportion = Freq / sum(Freq))

# Print the resulting data frame
print(count_df)


df$lug_boot <- as.factor(df$lug_boot)
df$class <- as.factor(df$class)

# Plot the graph
ggplot(df, aes(x = lug_boot, fill = lug_boot)) +
  geom_bar() +
  facet_wrap(~ class) +
  scale_fill_manual(values = c("small" = "red", "med" = "green", "big" = "blue")) +
  labs(title = "Graph between lug_boot and class",
       x = "Luggage Boot Size",
       y = "Count")


ggplot(df, aes(x = safety, fill = safety)) +
  geom_bar() +
  facet_wrap(~ buying) +
  scale_fill_manual(values = c("high" = "red", "low" = "green", "med" = "blue")) +
  labs(title = "Graph between Safety and Buying price",
       x = "Luggage Boot Size",
       y = "Count")
