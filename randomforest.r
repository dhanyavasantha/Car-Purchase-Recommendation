# Install and load required packages
library(randomForest)
library(caret)

# Load your dataset
car_data <- read.csv("car_evaluation.csv")
summary(car_data)
# Remove rows with missing values in 'buying' or 'maint'
car_data <- na.omit(car_data)

# Convert 'class' to a factor
car_data$class <- as.factor(car_data$class)

# Split the data into training and testing sets
set.seed(123)  # For reproducibility
train_indices <- createDataPartition(car_data$class, p = 0.8, list = FALSE)
train_data <- car_data[train_indices, ]
test_data <- car_data[-train_indices, ]

# Train the random forest model
rf_model <- randomForest(class ~ buying + maint + doors + persons + lug_boot + safety, data = train_data, ntree = 500)
#+ fig.width=12, fig.height=6, fig.dpi=900
print(rf_model)
# Make predictions on the test data
rf_predictions <- predict(rf_model, newdata = test_data)

# Evaluate the random forest model
rf_conf_matrix <- confusionMatrix(rf_predictions, test_data$class)
rf_accuracy <- rf_conf_matrix$overall["Accuracy"]


# Print the evaluation metrics for the random forest model
cat("Random Forest Model Metrics:\n")
cat("Accuracy: ", round(rf_accuracy, 4), "\n")

# Visualize the confusion matrix for the random forest model
print(rf_conf_matrix)

# Plot variable importance
varImpPlot(rf_model)
print(rf_model$importance)

influential_predictor <- rf_model$variable.importance[which.min(rf_model$cptable[, "xerror"]), ]
cat("Most influential predictor:", influential_predictor, "\n")



train_data$buying <- factor(train_data$buying, ordered = TRUE)
summary(train_data$buying)
#+ fig.width=4, fig.height=4, fig.dpi=900
partialPlot(rf_model, train_data, "buying")

train_data$maint <- factor(train_data$maint, ordered = TRUE)
summary(train_data$maint)
#+ fig.width=4, fig.height=4, fig.dpi=900
partialPlot(rf_model, train_data, "maint")

train_data$doors <- factor(train_data$doors, ordered = TRUE)
summary(train_data$doors)
#+ fig.width=4, fig.height=4, fig.dpi=900
partialPlot(rf_model, train_data, "doors")

train_data$persons <- factor(train_data$persons, ordered = TRUE)
summary(train_data$persons)
#+ fig.width=4, fig.height=4, fig.dpi=900
partialPlot(rf_model, train_data, "persons")

train_data$lug_boot <- factor(train_data$lug_boot, ordered = TRUE)
summary(train_data$lug_boot)
#+ fig.width=4, fig.height=4, fig.dpi=900
partialPlot(rf_model, train_data, "lug_boot")

train_data$safety <- factor(train_data$safety, ordered = TRUE)
summary(train_data$safety)
#+ fig.width=4, fig.height=4, fig.dpi=900
partialPlot(rf_model, train_data, "safety")

train_data$class <- factor(train_data$class, ordered = TRUE)
summary(train_data$class)
#+ fig.width=4, fig.height=4, fig.dpi=900
partialPlot(rf_model, train_data, "class")

citation()
citation("randomForest")
citation("caret")

