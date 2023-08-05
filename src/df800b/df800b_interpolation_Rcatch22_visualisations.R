## Simple Decimation df800b
#==

# Renaming 'values' column in each dataframe
names(features_linear_impute_sd800b_1)[names(features_linear_impute_sd800b_1) == "values"] <- "1"
names(features_linear_impute_sd800b_2)[names(features_linear_impute_sd800b_2) == "values"] <- "2"
names(features_linear_impute_sd800b_5)[names(features_linear_impute_sd800b_5) == "values"] <- "5"
names(features_linear_impute_sd800b_10)[names(features_linear_impute_sd800b_10) == "values"] <- "10"
names(features_linear_impute_sd800b_20)[names(features_linear_impute_sd800b_20) == "values"] <- "20"

# Joining all datasets by 'names' column
features_linear_impute_sd800b <- full_join(features_linear_impute_sd800b_1, features_linear_impute_sd800b_2, by = "names") %>%
  full_join(features_linear_impute_sd800b_5, by = "names") %>%
  full_join(features_linear_impute_sd800b_10, by = "names") %>%
  full_join(features_linear_impute_sd800b_20, by = "names")

# normalize columns 1, 2, 5, 10, 20
cols_to_normalize <- c('1', '2', '5', '10', '20')
features_linear_impute_sd800b[cols_to_normalize] <- scale(features_linear_impute_sd800b[cols_to_normalize])

# Pivoting the data to long format
features_linear_impute_sd800b_long <- features_linear_impute_sd800b %>%
  pivot_longer(cols = (2:6), names_to = "parameters", values_to = "value")

# Point plot
Rcatch22_plot_linear_impute_sd800b <- ggplot(features_linear_impute_sd800b_long, aes(y = names, x = value, color = as.numeric(parameters))) + 
  geom_point() + 
  theme_minimal() + 
  labs(y = "Names", x = "Values", color = "Param") + 
  ggtitle("Comparative Visualization of Linear Interpolation after Simple Decimation for DF800b") +
  theme(axis.title.y = element_blank(), axis.title.x = element_blank())

## Percentage Change df800b
#==

# Renaming 'values' column in each dataframe
names(features_linear_impute_pc800b_1)[names(features_linear_impute_pc800b_1) == "values"] <- "1"
names(features_linear_impute_pc800b_2)[names(features_linear_impute_pc800b_2) == "values"] <- "2"
names(features_linear_impute_pc800b_5)[names(features_linear_impute_pc800b_5) == "values"] <- "5"
names(features_linear_impute_pc800b_10)[names(features_linear_impute_pc800b_10) == "values"] <- "10"
names(features_linear_impute_pc800b_20)[names(features_linear_impute_pc800b_20) == "values"] <- "20"

# Joining all datasets by 'names' column
features_linear_impute_pc800b <- full_join(features_linear_impute_pc800b_1, features_linear_impute_pc800b_2, by = "names") %>%
  full_join(features_linear_impute_pc800b_5, by = "names") %>%
  full_join(features_linear_impute_pc800b_10, by = "names") %>%
  full_join(features_linear_impute_pc800b_20, by = "names")

# normalize columns 1, 2, 5, 10, 20
cols_to_normalize <- c('1', '2', '5', '10', '20')
features_linear_impute_pc800b[cols_to_normalize] <- scale(features_linear_impute_pc800b[cols_to_normalize])

# Pivoting the data to long format
features_linear_impute_pc800b_long <- features_linear_impute_pc800b %>%
  pivot_longer(cols = (2:6), names_to = "parameters", values_to = "value")

# Point plot
Rcatch22_plot_linear_impute_pc800b <- ggplot(features_linear_impute_pc800b_long, aes(y = names, x = value, color = as.numeric(parameters))) + 
  geom_point() + 
  theme_minimal() + 
  labs(y = "Names", x = "Values", color = "Param") + 
  ggtitle("Comparative Visualization of Linear Interpolation after Percentage Change for DF800b") +
  theme(axis.title.y = element_blank(), axis.title.x = element_blank())

## Combine plots
#==

grid.arrange(patchworkGrob(Rcatch22_plot_linear_impute_sd800b + Rcatch22_plot_linear_impute_pc800b), left = "Names", bottom = "Values")

