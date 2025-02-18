# Load necessary libraries
library(rpart)
library(rpart.plot)
library(caret)

# Load your dataset
car_data <- read.csv("car_evaluation.csv")
car_data$class <- factor(car_data$class, levels = c("acc", "unacc", "good", "vgood"))

# Split the data into training and testing sets
set.seed(123)  # For reproducibility
train_indices <- createDataPartition(car_data$class, p = 0.8, list = FALSE)
train_data <- car_data[train_indices, ]
test_data <- car_data[-train_indices, ]

# Train the decision tree model on the training data
tree_model <- rpart(class ~ buying + maint + doors + persons + lug_boot + safety, data = train_data, method = "class")

# Make predictions on the test data
predictions <- predict(tree_model, newdata = test_data, type = "class")

# Get unique levels from both predictions and actuals
all_levels <- union(levels(predictions), levels(test_data$class))

# Convert predictions and actuals to factors with the same levels
predictions <- factor(predictions, levels = all_levels)
actuals <- factor(test_data$class, levels = all_levels)

# Evaluate the model
conf_matrix <- confusionMatrix(predictions, actuals)
accuracy <- conf_matrix$overall["Accuracy"]

# Print the evaluation metrics
cat("Accuracy: ", round(accuracy, 4), "\n")


# Visualize the confusion matrix
print(conf_matrix)

# Print the decision tree
print(tree_model)



# Plot the decision tree 
#+ fig.width=12, fig.height=8, fig.dpi=1500
prp(tree_model, type = 2, extra = 1, branch = 0.5, main = "Decision Tree for Car Evaluation")

#Plot the decision tree with improved colors
library(rpart.plot)
#+ fig.width=12, fig.height=8, fig.dpi=1500
rpart.plot(tree_model, main = "Decision Tree for Car Evaluation", tweak=1.1)


# Summary statistics for buying price and maintenance by class
summary_stats <- aggregate(cbind(buying, maint) ~ class, data = car_data, FUN = function(x) c(mean = mean(x), median = median(x), sd = sd(x)))
print(summary_stats)

# Remove rows with missing values
car_data_cleaned <- na.omit(car_data)

# Convert 'buying' and 'maint' to numeric (assuming they are categorical variables)
car_data_cleaned$buying <- as.numeric(as.factor(car_data_cleaned$buying))
car_data_cleaned$maint <- as.numeric(as.factor(car_data_cleaned$maint))
# Convert 'class' to numeric for plotting
car_data_cleaned$class_numeric <- as.numeric(as.factor(car_data_cleaned$class))

# Scatter plot for buying vs. maintenance
plot(car_data_cleaned$buying, car_data_cleaned$maint, col = car_data_cleaned$class_numeric, pch = 16, main = "Scatter Plot of Buying vs. Maintenance", xlab = "Buying Price", ylab = "Maintenance")


citation("rpart")
citation("rpart.plot")
