## Missing value imputation for Simple Decimation by linear interpolaion for DF800a
# ==

# Interpolation for Parameter 1
linear_impute_sd_800a_1 <- na_interpolation(sd_800a_1$full_ts, option = "linear")

# Plot interpolation for Parameter 1 # Doesn't work as there's no missing values

# Interpolation for Parameter 2
linear_impute_sd_800a_2 <- na_interpolation(sd_800a_2$full_ts, option = "linear")

# Plot interpolation for Parameter 2
linear_sd800a_2_plot <- ggplot_na_imputations(sd_800a_2$full_ts, linear_impute_sd_800a_2)

# Interpolation for Parameter 5
linear_impute_sd_800a_5 <- na_interpolation(sd_800a_5$full_ts, option = "linear")

# Plot interpolation for Parameter 5
linear_sd800a_5_plot <- ggplot_na_imputations(sd_800a_5$full_ts, linear_impute_sd_800a_5)

# Interpolation for Parameter 10
linear_impute_sd_800a_10 <- na_interpolation(sd_800a_10$full_ts, option = "linear")

# Plot interpolation for Parameter 10
linear_sd800a_10_plot <- ggplot_na_imputations(sd_800a_10$full_ts, linear_impute_sd_800a_10)

# Interpolation for Parameter 20
linear_impute_sd_800a_20 <- na_interpolation(sd_800a_20$full_ts, option = "linear")

# Plot interpolation for Parameter 20
linear_sd800a_20_plot <- ggplot_na_imputations(sd_800a_20$full_ts, linear_impute_sd_800a_20)

# Combine plots
linear_sd800a_2_plot + linear_sd800a_5_plot + linear_sd800a_10_plot  + linear_sd800a_20_plot 



## Missing value imputation for Percentage Change by linear interpolaion for DF800a
# ==

# Interpolation for Parameter 1
linear_impute_pc_800a_1 <- na_interpolation(pc_800a_1$full_ts, option = "linear")

# Plot interpolation for Parameter 1
linear_pc800a_1_plot <- ggplot_na_imputations(pc_800a_1$full_ts, linear_impute_pc_800a_1) # Doesn't work as there's no missing values

# Interpolation for Parameter 2
linear_impute_pc_800a_2 <- na_interpolation(pc_800a_2$full_ts, option = "linear")

# Plot interpolation for Parameter 2
linear_pc800a_2_plot <- ggplot_na_imputations(pc_800a_2$full_ts, linear_impute_pc_800a_2)

# Interpolation for Parameter 5
linear_impute_pc_800a_5 <- na_interpolation(pc_800a_5$full_ts, option = "linear")

# Plot interpolation for Parameter 5
linear_pc800a_5_plot <- ggplot_na_imputations(pc_800a_5$full_ts, linear_impute_pc_800a_5)

# Interpolation for Parameter 10
linear_impute_pc_800a_10 <- na_interpolation(pc_800a_10$full_ts, option = "linear")

# Plot interpolation for Parameter 10
linear_pc800a_10_plot <- ggplot_na_imputations(pc_800a_10$full_ts, linear_impute_pc_800a_10)

# Interpolation for Parameter 20
linear_impute_pc_800a_20 <- na_interpolation(pc_800a_20$full_ts, option = "linear")

# Plot interpolation for Parameter 20
linear_pc800a_20_plot <- ggplot_na_imputations(pc_800a_20$full_ts, linear_impute_pc_800a_20)

# Combine plots
linear_pc800a_2_plot + linear_pc800a_5_plot + linear_pc800a_10_plot  + linear_pc800a_20_plot 
