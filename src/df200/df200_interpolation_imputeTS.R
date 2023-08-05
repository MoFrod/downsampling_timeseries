## Missing value imputation for Simple Decimation by linear interpolaion for DF200
# ==

# Interpolation for Parameter 1
linear_impute_sd_200_1 <- na_interpolation(sd_200_1$full_ts, option = "linear")

# Plot interpolation for Parameter 1 # Doens't work as there's no missing values

# Interpolation for Parameter 2
linear_impute_sd_200_2 <- na_interpolation(sd_200_2$full_ts, option = "linear")

# Plot interpolation for Parameter 2
linear_sd200_2_plot <- ggplot_na_imputations(sd_200_2$full_ts, linear_impute_sd_200_2)

# Interpolation for Parameter 5
linear_impute_sd_200_5 <- na_interpolation(sd_200_5$full_ts, option = "linear")

# Plot interpolation for Parameter 5
linear_sd200_5_plot <- ggplot_na_imputations(sd_200_5$full_ts, linear_impute_sd_200_5)

# Interpolation for Parameter 10
linear_impute_sd_200_10 <- na_interpolation(sd_200_10$full_ts, option = "linear")

# Plot interpolation for Parameter 10
linear_sd200_10_plot <- ggplot_na_imputations(sd_200_10$full_ts, linear_impute_sd_200_10)

# Interpolation for Parameter 20
linear_impute_sd_200_20 <- na_interpolation(sd_200_20$full_ts, option = "linear")

# Plot interpolation for Parameter 20
linear_sd200_20_plot <- ggplot_na_imputations(sd_200_20$full_ts, linear_impute_sd_200_20)

# Combine plots
linear_sd200_2_plot + linear_sd200_5_plot + linear_sd200_10_plot  + linear_sd200_20_plot 



## Missing value imputation for Percentage Change by linear interpolaion for DF200
# ==

# Interpolation for Parameter 1
linear_impute_pc_200_1 <- na_interpolation(pc_200_1$full_ts, option = "linear")

# Plot interpolation for Parameter 1
linear_pc200_1_plot <- ggplot_na_imputations(pc_200_1$full_ts, linear_impute_pc_200_1) # Doens't work as there's no missing values

# Interpolation for Parameter 2
linear_impute_pc_200_2 <- na_interpolation(pc_200_2$full_ts, option = "linear")

# Plot interpolation for Parameter 2
linear_pc200_2_plot <- ggplot_na_imputations(pc_200_2$full_ts, linear_impute_pc_200_2)

# Interpolation for Parameter 5
linear_impute_pc_200_5 <- na_interpolation(pc_200_5$full_ts, option = "linear")

# Plot interpolation for Parameter 5
linear_pc200_5_plot <- ggplot_na_imputations(pc_200_5$full_ts, linear_impute_pc_200_5)

# Interpolation for Parameter 10
linear_impute_pc_200_10 <- na_interpolation(pc_200_10$full_ts, option = "linear")

# Plot interpolation for Parameter 10
linear_pc200_10_plot <- ggplot_na_imputations(pc_200_10$full_ts, linear_impute_pc_200_10)

# Interpolation for Parameter 20
linear_impute_pc_200_20 <- na_interpolation(pc_200_20$full_ts, option = "linear")

# Plot interpolation for Parameter 20
linear_pc200_20_plot <- ggplot_na_imputations(pc_200_20$full_ts, linear_impute_pc_200_20)

# Combine plots
linear_pc200_2_plot + linear_pc200_5_plot + linear_pc200_10_plot  + linear_pc200_20_plot 
