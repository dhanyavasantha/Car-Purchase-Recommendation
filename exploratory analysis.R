# Read the CSV file into a data frame
df <- read.csv("car_evaluation.csv")

# Load the required libraries
library(ggplot2)
df$class <- factor(df$class, levels = c("acc", "unacc", "good", "vgood"))

# Plot for Safety and Class with the specified order
ggplot(df, aes(x = safety, fill = class)) +
  geom_bar(position = "fill") +
  labs(x = "safety", y = "class" ) +
  ggtitle("Relationship between safety and class") +
  theme_minimal()

ggplot(df,aes(x = persons, fill = class)) +
  geom_bar(position="fill")+
  labs(x = "No of persons", y = "Class" ) +
  ggtitle("Relationship between people capacity and class")+
  theme_minimal()

ggplot(df,aes(x = buying, fill = class)) +
  geom_bar(position="fill")+
  labs(x = "Buying price", y = "class" ) +
  ggtitle("Relationship between buying price and class")+
  theme_minimal()

ggplot(df,aes(x = maint, fill = class)) +
  geom_bar(position="fill")+
  labs(x = "Maintenance", y = "Class" ) +
  ggtitle("Relationship between Maintenance price and class")+
  theme_minimal()

ggplot(df,aes(x = doors, fill = class)) +
  geom_bar(position="fill")+
  labs(x = "No of doors", y = "class" ) +
  ggtitle("Relationship between No of doors and class")+
  theme_minimal()

ggplot(df,aes(x = lug_boot, fill = class)) +
  geom_bar(position="fill")+
  labs(x = "Luggage boot space", y = "Class" ) +
  ggtitle("Relationship between Luggage boot space and class")+
  theme_minimal()

citation()
