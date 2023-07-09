## Missing value imputation for Simple Decimation by linear interpolaion for DF800b
# ==

# Interpolation for Parameter 1
linear_impute_sd_800b_1 <- na_interpolation(sd_800b_1$full_ts, option = "linear")

# Plot interpolation for Parameter 1 # Doesn't work as there's no missing values

# Interpolation for Parameter 2
linear_impute_sd_800b_2 <- na_interpolation(sd_800b_2$full_ts, option = "linear")

# Plot interpolation for Parameter 2
linear_sd800b_2_plot <- ggplot_na_imputations(sd_800b_2$full_ts, linear_impute_sd_800b_2)

# Interpolation for Parameter 5
linear_impute_sd_800b_5 <- na_interpolation(sd_800b_5$full_ts, option = "linear")

# Plot interpolation for Parameter 5
linear_sd800b_5_plot <- ggplot_na_imputations(sd_800b_5$full_ts, linear_impute_sd_800b_5)

# Interpolation for Parameter 10
linear_impute_sd_800b_10 <- na_interpolation(sd_800b_10$full_ts, option = "linear")

# Plot interpolation for Parameter 10
linear_sd800b_10_plot <- ggplot_na_imputations(sd_800b_10$full_ts, linear_impute_sd_800b_10)

# Interpolation for Parameter 20
linear_impute_sd_800b_20 <- na_interpolation(sd_800b_20$full_ts, option = "linear")

# Plot interpolation for Parameter 20
linear_sd800b_20_plot <- ggplot_na_imputations(sd_800b_20$full_ts, linear_impute_sd_800b_20)

# Combine plots
linear_sd800b_2_plot + linear_sd800b_5_plot + linear_sd800b_10_plot  + linear_sd800b_20_plot 



## Missing value imputation for Percentage Change by linear interpolaion for DF800b
# ==

# Interpolation for Parameter 1
linear_impute_pc_800b_1 <- na_interpolation(pc_800b_1$full_ts, option = "linear")

# Plot interpolation for Parameter 1
linear_pc800b_1_plot <- ggplot_na_imputations(pc_800b_1$full_ts, linear_impute_pc_800b_1) # Doesn't work as there's no missing values

# Interpolation for Parameter 2
linear_impute_pc_800b_2 <- na_interpolation(pc_800b_2$full_ts, option = "linear")

# Plot interpolation for Parameter 2
linear_pc800b_2_plot <- ggplot_na_imputations(pc_800b_2$full_ts, linear_impute_pc_800b_2)

# Interpolation for Parameter 5
linear_impute_pc_800b_5 <- na_interpolation(pc_800b_5$full_ts, option = "linear")

# Plot interpolation for Parameter 5
linear_pc800b_5_plot <- ggplot_na_imputations(pc_800b_5$full_ts, linear_impute_pc_800b_5)

# Interpolation for Parameter 10
linear_impute_pc_800b_10 <- na_interpolation(pc_800b_10$full_ts, option = "linear")

# Plot interpolation for Parameter 10
linear_pc800b_10_plot <- ggplot_na_imputations(pc_800b_10$full_ts, linear_impute_pc_800b_10)

# Interpolation for Parameter 20
linear_impute_pc_800b_20 <- na_interpolation(pc_800b_20$full_ts, option = "linear")

# Plot interpolation for Parameter 20
linear_pc800b_20_plot <- ggplot_na_imputations(pc_800b_20$full_ts, linear_impute_pc_800b_20)

# Combine plots
linear_pc800b_2_plot + linear_pc800b_5_plot + linear_pc800b_10_plot  + linear_pc800b_20_plot 
