## Simple Decimation df200
#==

# Renaming 'values' column in each dataframe
names(features_linear_impute_sd200_1)[names(features_linear_impute_sd200_1) == "values"] <- "1"
names(features_linear_impute_sd200_2)[names(features_linear_impute_sd200_2) == "values"] <- "2"
names(features_linear_impute_sd200_5)[names(features_linear_impute_sd200_5) == "values"] <- "5"
names(features_linear_impute_sd200_10)[names(features_linear_impute_sd200_10) == "values"] <- "10"
names(features_linear_impute_sd200_20)[names(features_linear_impute_sd200_20) == "values"] <- "20"

# Joining all datasets by 'names' column
features_linear_impute_sd200 <- full_join(features_linear_impute_sd200_1, features_linear_impute_sd200_2, by = "names") %>%
  full_join(features_linear_impute_sd200_5, by = "names") %>%
  full_join(features_linear_impute_sd200_10, by = "names") %>%
  full_join(features_linear_impute_sd200_20, by = "names")

# normalize columns 1, 2, 5, 10, 20
cols_to_normalize <- c('1', '2', '5', '10', '20')
features_linear_impute_sd200[cols_to_normalize] <- scale(features_linear_impute_sd200[cols_to_normalize])

# Pivoting the data to long format
features_linear_impute_sd200_long <- features_linear_impute_sd200 %>%
  pivot_longer(cols = (2:6), names_to = "parameters", values_to = "value")

# Point plot
Rcatch22_plot_linear_impute_sd200 <- ggplot(features_linear_impute_sd200_long, aes(y = names, x = value, color = as.numeric(parameters))) + 
  geom_point() + 
  theme_minimal() + 
  labs(y = "Names", x = "Values", color = "Param") + 
  ggtitle("Comparative Visualization of Linear Interpolation after Simple Decimation for DF200") +
  theme(axis.title.y = element_blank(), axis.title.x = element_blank())

## Percentage Change df200
#==

# Renaming 'values' column in each dataframe
names(features_linear_impute_pc200_1)[names(features_linear_impute_pc200_1) == "values"] <- "1"
names(features_linear_impute_pc200_2)[names(features_linear_impute_pc200_2) == "values"] <- "2"
names(features_linear_impute_pc200_5)[names(features_linear_impute_pc200_5) == "values"] <- "5"
names(features_linear_impute_pc200_10)[names(features_linear_impute_pc200_10) == "values"] <- "10"
names(features_linear_impute_pc200_20)[names(features_linear_impute_pc200_20) == "values"] <- "20"

# Joining all datasets by 'names' column
features_linear_impute_pc200 <- full_join(features_linear_impute_pc200_1, features_linear_impute_pc200_2, by = "names") %>%
  full_join(features_linear_impute_pc200_5, by = "names") %>%
  full_join(features_linear_impute_pc200_10, by = "names") %>%
  full_join(features_linear_impute_pc200_20, by = "names")

# normalize columns 1, 2, 5, 10, 20
cols_to_normalize <- c('1', '2', '5', '10', '20')
features_linear_impute_pc200[cols_to_normalize] <- scale(features_linear_impute_pc200[cols_to_normalize])

# Pivoting the data to long format
features_linear_impute_pc200_long <- features_linear_impute_pc200 %>%
  pivot_longer(cols = (2:6), names_to = "parameters", values_to = "value")

# Point plot
Rcatch22_plot_linear_impute_pc200 <- ggplot(features_linear_impute_pc200_long, aes(y = names, x = value, color = as.numeric(parameters))) + 
  geom_point() + 
  theme_minimal() + 
  labs(y = "Names", x = "Values", color = "Param") + 
  ggtitle("Comparative Visualization of Linear Interpolation after Percentage Change for DF200") +
  theme(axis.title.y = element_blank(), axis.title.x = element_blank())

## Combine plots
#==

grid.arrange(patchworkGrob(Rcatch22_plot_linear_impute_sd200 + Rcatch22_plot_linear_impute_pc200), left = "Names", bottom = "Values")

