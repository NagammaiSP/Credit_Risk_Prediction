# Create a dataframe for the new record without loan_status
new_record <- data.frame(
  person_age = 24,
  person_income = 159000,
  person_home_ownership = "RENT",
  person_emp_length = 123,
  loan_intent = "EDUCATION",
  loan_grade = "B",
  loan_amnt = 65000,
  loan_int_rate = 14.02,
  loan_percent_income = 0.40,
  cb_person_default_on_file = "Y",
  cb_person_cred_hist_length = 5
)

# Impute missing values with the median of each column (using the same preprocessing object)
new_record_imputed <- predict(pre_proc, new_record)

# Predict loan status using the trained models
lm_pred_new <- predict(lm_model, newdata = new_record_imputed)
dt_pred_new <- predict(dt_model, newdata = new_record_imputed)
svm_pred_new <- predict(svm_model, newdata = new_record_imputed)

# Print the predicted loan status for the new record
print("Predicted Loan Status using Linear Regression:")
print(lm_pred_new)

print("Predicted Loan Status using Decision Tree:")
print(dt_pred_new)

print("Predicted Loan Status using SVM:")
print(svm_pred_new)
