## Missing value imputation for Simple Decimation by linear interpolaion for DF600
# ==

# Interpolation for Parameter 1
linear_impute_sd_600_1 <- na_interpolation(sd_600_1$full_ts, option = "linear")

# Plot interpolation for Parameter 1 # Doesn't work as there's no missing values

# Interpolation for Parameter 2
linear_impute_sd_600_2 <- na_interpolation(sd_600_2$full_ts, option = "linear")

# Plot interpolation for Parameter 2
linear_sd600_2_plot <- ggplot_na_imputations(sd_600_2$full_ts, linear_impute_sd_600_2)

# Interpolation for Parameter 5
linear_impute_sd_600_5 <- na_interpolation(sd_600_5$full_ts, option = "linear")

# Plot interpolation for Parameter 5
linear_sd600_5_plot <- ggplot_na_imputations(sd_600_5$full_ts, linear_impute_sd_600_5)

# Interpolation for Parameter 10
linear_impute_sd_600_10 <- na_interpolation(sd_600_10$full_ts, option = "linear")

# Plot interpolation for Parameter 10
linear_sd600_10_plot <- ggplot_na_imputations(sd_600_10$full_ts, linear_impute_sd_600_10)

# Interpolation for Parameter 20
linear_impute_sd_600_20 <- na_interpolation(sd_600_20$full_ts, option = "linear")

# Plot interpolation for Parameter 20
linear_sd600_20_plot <- ggplot_na_imputations(sd_600_20$full_ts, linear_impute_sd_600_20)

# Combine plots
linear_sd600_2_plot + linear_sd600_5_plot + linear_sd600_10_plot  + linear_sd600_20_plot 



## Missing value imputation for Percentage Change by linear interpolaion for DF600
# ==

# Interpolation for Parameter 1
linear_impute_pc_600_1 <- na_interpolation(pc_600_1$full_ts, option = "linear")

# Plot interpolation for Parameter 1
linear_pc600_1_plot <- ggplot_na_imputations(pc_600_1$full_ts, linear_impute_pc_600_1) # Doesn't work as there's no missing values

# Interpolation for Parameter 2
linear_impute_pc_600_2 <- na_interpolation(pc_600_2$full_ts, option = "linear")

# Plot interpolation for Parameter 2
linear_pc600_2_plot <- ggplot_na_imputations(pc_600_2$full_ts, linear_impute_pc_600_2)

# Interpolation for Parameter 5
linear_impute_pc_600_5 <- na_interpolation(pc_600_5$full_ts, option = "linear")

# Plot interpolation for Parameter 5
linear_pc600_5_plot <- ggplot_na_imputations(pc_600_5$full_ts, linear_impute_pc_600_5)

# Interpolation for Parameter 10
linear_impute_pc_600_10 <- na_interpolation(pc_600_10$full_ts, option = "linear")

# Plot interpolation for Parameter 10
linear_pc600_10_plot <- ggplot_na_imputations(pc_600_10$full_ts, linear_impute_pc_600_10)

# Interpolation for Parameter 20
linear_impute_pc_600_20 <- na_interpolation(pc_600_20$full_ts, option = "linear")

# Plot interpolation for Parameter 20
linear_pc600_20_plot <- ggplot_na_imputations(pc_600_20$full_ts, linear_impute_pc_600_20)

# Combine plots
linear_pc600_2_plot + linear_pc600_5_plot + linear_pc600_10_plot  + linear_pc600_20_plot 
