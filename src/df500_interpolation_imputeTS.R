## Missing value imputation for Simple Decimation by linear interpolaion for DF500
# ==

# Interpolation for Parameter 1
linear_impute_sd_500_1 <- na_interpolation(sd_500_1$full_ts, option = "linear")

# Plot interpolation for Parameter 1 # Doens't work as there's no missing values

# Interpolation for Parameter 2
linear_impute_sd_500_2 <- na_interpolation(sd_500_2$full_ts, option = "linear")

# Plot interpolation for Parameter 2
linear_sd500_2_plot <- ggplot_na_imputations(sd_500_2$full_ts, linear_impute_sd_500_2)

# Interpolation for Parameter 5
linear_impute_sd_500_5 <- na_interpolation(sd_500_5$full_ts, option = "linear")

# Plot interpolation for Parameter 5
linear_sd500_5_plot <- ggplot_na_imputations(sd_500_5$full_ts, linear_impute_sd_500_5)

# Interpolation for Parameter 10
linear_impute_sd_500_10 <- na_interpolation(sd_500_10$full_ts, option = "linear")

# Plot interpolation for Parameter 10
linear_sd500_10_plot <- ggplot_na_imputations(sd_500_10$full_ts, linear_impute_sd_500_10)

# Interpolation for Parameter 20
linear_impute_sd_500_20 <- na_interpolation(sd_500_20$full_ts, option = "linear")

# Plot interpolation for Parameter 20
linear_sd500_20_plot <- ggplot_na_imputations(sd_500_20$full_ts, linear_impute_sd_500_20)

# Combine plots
linear_sd500_2_plot + linear_sd500_5_plot + linear_sd500_10_plot  + linear_sd500_20_plot 



## Missing value imputation for Percentage Change by linear interpolaion for DF500
# ==

# Interpolation for Parameter 1
linear_impute_pc_500_1 <- na_interpolation(pc_500_1$full_ts, option = "linear")

# Plot interpolation for Parameter 1
linear_pc500_1_plot <- ggplot_na_imputations(pc_500_1$full_ts, linear_impute_pc_500_1) # Doens't work as there's no missing values

# Interpolation for Parameter 2
linear_impute_pc_500_2 <- na_interpolation(pc_500_2$full_ts, option = "linear")

# Plot interpolation for Parameter 2
linear_pc500_2_plot <- ggplot_na_imputations(pc_500_2$full_ts, linear_impute_pc_500_2)

# Interpolation for Parameter 5
linear_impute_pc_500_5 <- na_interpolation(pc_500_5$full_ts, option = "linear")

# Plot interpolation for Parameter 5
linear_pc500_5_plot <- ggplot_na_imputations(pc_500_5$full_ts, linear_impute_pc_500_5)

# Interpolation for Parameter 10
linear_impute_pc_500_10 <- na_interpolation(pc_500_10$full_ts, option = "linear")

# Plot interpolation for Parameter 10
linear_pc500_10_plot <- ggplot_na_imputations(pc_500_10$full_ts, linear_impute_pc_500_10)

# Interpolation for Parameter 20
linear_impute_pc_500_20 <- na_interpolation(pc_500_20$full_ts, option = "linear")

# Plot interpolation for Parameter 20
linear_pc500_20_plot <- ggplot_na_imputations(pc_500_20$full_ts, linear_impute_pc_500_20)

# Combine plots
linear_pc500_2_plot + linear_pc500_5_plot + linear_pc500_10_plot  + linear_pc500_20_plot 
