## Missing value imputation for Simple Decimation by linear interpolaion for DF400
# ==

# Interpolation for Parameter 1
linear_impute_sd_400_1 <- na_interpolation(sd_400_1$full_ts, option = "linear")

# Plot interpolation for Parameter 1 # Doens't work as there's no missing values

# Interpolation for Parameter 2
linear_impute_sd_400_2 <- na_interpolation(sd_400_2$full_ts, option = "linear")

# Plot interpolation for Parameter 2
linear_sd400_2_plot <- ggplot_na_imputations(sd_400_2$full_ts, linear_impute_sd_400_2)

# Interpolation for Parameter 5
linear_impute_sd_400_5 <- na_interpolation(sd_400_5$full_ts, option = "linear")

# Plot interpolation for Parameter 5
linear_sd400_5_plot <- ggplot_na_imputations(sd_400_5$full_ts, linear_impute_sd_400_5)

# Interpolation for Parameter 10
linear_impute_sd_400_10 <- na_interpolation(sd_400_10$full_ts, option = "linear")

# Plot interpolation for Parameter 10
linear_sd400_10_plot <- ggplot_na_imputations(sd_400_10$full_ts, linear_impute_sd_400_10)

# Interpolation for Parameter 20
linear_impute_sd_400_20 <- na_interpolation(sd_400_20$full_ts, option = "linear")

# Plot interpolation for Parameter 20
linear_sd400_20_plot <- ggplot_na_imputations(sd_400_20$full_ts, linear_impute_sd_400_20)

# Combine plots
linear_sd400_2_plot + linear_sd400_5_plot + linear_sd400_10_plot  + linear_sd400_20_plot 



## Missing value imputation for Percentage Change by linear interpolaion for DF400
# ==

# Interpolation for Parameter 1
linear_impute_pc_400_1 <- na_interpolation(pc_400_1$full_ts, option = "linear")

# Plot interpolation for Parameter 1
linear_pc400_1_plot <- ggplot_na_imputations(pc_400_1$full_ts, linear_impute_pc_400_1) # Doens't work as there's no missing values

# Interpolation for Parameter 2
linear_impute_pc_400_2 <- na_interpolation(pc_400_2$full_ts, option = "linear")

# Plot interpolation for Parameter 2
linear_pc400_2_plot <- ggplot_na_imputations(pc_400_2$full_ts, linear_impute_pc_400_2)

# Interpolation for Parameter 5
linear_impute_pc_400_5 <- na_interpolation(pc_400_5$full_ts, option = "linear")

# Plot interpolation for Parameter 5
linear_pc400_5_plot <- ggplot_na_imputations(pc_400_5$full_ts, linear_impute_pc_400_5)

# Interpolation for Parameter 10
linear_impute_pc_400_10 <- na_interpolation(pc_400_10$full_ts, option = "linear")

# Plot interpolation for Parameter 10
linear_pc400_10_plot <- ggplot_na_imputations(pc_400_10$full_ts, linear_impute_pc_400_10)

# Interpolation for Parameter 20
linear_impute_pc_400_20 <- na_interpolation(pc_400_20$full_ts, option = "linear")

# Plot interpolation for Parameter 20
linear_pc400_20_plot <- ggplot_na_imputations(pc_400_20$full_ts, linear_impute_pc_400_20)

# Combine plots
linear_pc400_2_plot + linear_pc400_5_plot + linear_pc400_10_plot  + linear_pc400_20_plot 
