Loan Application Analysis and Model Performance
Analysis Report


The analysis provides insights into various factors that influence loan repayment. It includes detailed tables showing the relationship between different variables such as loan intent, interest rate, home ownership, loan amount, credit history, income range, and loan repayment status.

Model Performance Analysis

Three models were trained and evaluated:

Linear Regression Model: Accuracy of 86.05%, Sensitivity of 94.91%, Specificity of 54.32%.

Decision Tree Model: Accuracy of 85.63%, Sensitivity of 100%, Specificity of 34.15%.

SVM Model: Accuracy of 90.3%, Sensitivity of 98.19%, Specificity of 62.01%.

Based on the performance metrics and the balance between sensitivity and specificity, the SVM model appears to be the best model for loan prediction in this case.

R Workflow
The R workflow includes the following steps:

Library Imports: Necessary libraries such as caret, e1071, and rpart are loaded.

Data Preparation: The data is stored in a dataframe named credit_risk_dataset. The loan_status variable is converted to a factor if it’s not already. The data is split into training and testing sets using a 70-30 split.

Data Preprocessing: Missing values in both training and testing data are imputed using median imputation.

Model Training: Three different models are trained: Linear Regression (glm method in caret package), Decision Tree (rpart method in caret package), and Support Vector Machine (SVM) (svm function in e1071 package).

Model Evaluation: Each trained model is used to predict on the test data. The performance of each model is evaluated using confusion matrices.

Predicting on New Data: A new record is created as a dataframe named new_record without the loan_status variable. Missing values in the new record are imputed using the same preprocessing object. The loan status of the new record is predicted using the trained models.

Tableau Techniques
The Tableau techniques used in this analysis include creating detailed tables to show the relationship between different variables. These tables provide a visual representation of the data, making it easier to understand the patterns and trends in the dataset. The tables are interactive, allowing the user to filter and sort the data based on different variables. This interactivity enhances the user’s ability to explore the data and gain insights. The use of color coding in the tables also helps to highlight important information and draw attention to specific data points.

Conclusion
This analysis and model performance report provides valuable insights into loan repayment probabilities. It also demonstrates the effectiveness of using machine learning models for prediction tasks. The R workflow and Tableau techniques used in this analysis can be applied to other similar datasets to gain insights and make predictions. The SVM model, with its high accuracy and balanced sensitivity and specificity, is recommended for loan prediction in this case. However, it’s important to note that correlation does not imply causation, and these factors should be considered as part of a broader context when assessing loan repayment probabilities.
