# Load necessary libraries
library(caret)
library(e1071)
library(rpart)

# Assuming you've stored your data in 'credit_risk_dataset' dataframe

# Convert 'loan_status' to a factor if it's not already
credit_risk_dataset$loan_status <- factor(credit_risk_dataset$loan_status)

# Split data into training and testing sets
set.seed(123) # for reproducibility
train_index <- createDataPartition(credit_risk_dataset$loan_status, p = 0.7, list = FALSE)
train_data <- credit_risk_dataset[train_index, ]
test_data <- credit_risk_dataset[-train_index, ]

# Impute missing values with the median of each column
pre_proc <- preProcess(train_data, method = "medianImpute")
train_data_imputed <- predict(pre_proc, train_data)
test_data_imputed <- predict(pre_proc, test_data)  # Apply the same preprocessing to test data

# Train linear regression model
lm_model <- train(loan_status ~ ., data = train_data_imputed, method = "glm")

# Train decision tree model
dt_model <- train(loan_status ~ ., data = train_data_imputed, method = "rpart")

# Train SVM model
svm_model <- svm(loan_status ~ ., data = train_data_imputed)

# Perform K-Means clustering
# (Already trained in the previous code snippet)

# Predict on test data for all models
lm_pred <- predict(lm_model, newdata = test_data_imputed)
dt_pred <- predict(dt_model, newdata = test_data_imputed)
svm_pred <- predict(svm_model, newdata = test_data_imputed)

# Evaluate model performance
lm_performance <- confusionMatrix(lm_pred, test_data_imputed$loan_status)
dt_performance <- confusionMatrix(dt_pred, test_data_imputed$loan_status)
svm_performance <- confusionMatrix(svm_pred, test_data_imputed$loan_status)

# Print classification reports
print("Linear Regression Classification Report:")
print(lm_performance)
cat("\n")

print("Decision Tree Classification Report:")
print(dt_performance)
cat("\n")

print("SVM Classification Report:")
print(svm_performance)
cat("\n")

# Print the k-means cluster centers
print("K-Means Cluster Centers:")
print(kmeans_model$centers)