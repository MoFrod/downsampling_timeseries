## Missing value imputation for Simple Decimation by linear interpolaion for DF100
# ==

# Interpolation for Parameter 1
linear_impute_sd_100_1 <- na_interpolation(sd_100_1$full_ts, option = "linear")

# Plot interpolation for Parameter 1 # Doens't work as there's no missing values

# Interpolation for Parameter 2
linear_impute_sd_100_2 <- na_interpolation(sd_100_2$full_ts, option = "linear")

# Plot interpolation for Parameter 2
linear_sd100_2_plot <- ggplot_na_imputations(sd_100_2$full_ts, linear_impute_sd_100_2)

# Interpolation for Parameter 5
linear_impute_sd_100_5 <- na_interpolation(sd_100_5$full_ts, option = "linear")

# Plot interpolation for Parameter 5
linear_sd100_5_plot <- ggplot_na_imputations(sd_100_5$full_ts, linear_impute_sd_100_5)

# Interpolation for Parameter 10
linear_impute_sd_100_10 <- na_interpolation(sd_100_10$full_ts, option = "linear")

# Plot interpolation for Parameter 10
linear_sd100_10_plot <- ggplot_na_imputations(sd_100_10$full_ts, linear_impute_sd_100_10)

# Interpolation for Parameter 20
linear_impute_sd_100_20 <- na_interpolation(sd_100_20$full_ts, option = "linear")

# Plot interpolation for Parameter 20
linear_sd100_20_plot <- ggplot_na_imputations(sd_100_20$full_ts, linear_impute_sd_100_20)

# Combine plots
linear_sd100_2_plot + linear_sd100_5_plot + linear_sd100_10_plot  + linear_sd100_20_plot 



## Missing value imputation for Percentage Change by linear interpolaion for DF100
# ==

# Interpolation for Parameter 1
linear_impute_pc_100_1 <- na_interpolation(pc_100_1$full_ts, option = "linear")

# Plot interpolation for Parameter 1
linear_pc100_1_plot <- ggplot_na_imputations(pc_100_1$full_ts, linear_impute_pc_100_1) # Doens't work as there's no missing values

# Interpolation for Parameter 2
linear_impute_pc_100_2 <- na_interpolation(pc_100_2$full_ts, option = "linear")

# Plot interpolation for Parameter 2
linear_pc100_2_plot <- ggplot_na_imputations(pc_100_2$full_ts, linear_impute_pc_100_2)

# Interpolation for Parameter 5
linear_impute_pc_100_5 <- na_interpolation(pc_100_5$full_ts, option = "linear")

# Plot interpolation for Parameter 5
linear_pc100_5_plot <- ggplot_na_imputations(pc_100_5$full_ts, linear_impute_pc_100_5)

# Interpolation for Parameter 10
linear_impute_pc_100_10 <- na_interpolation(pc_100_10$full_ts, option = "linear")

# Plot interpolation for Parameter 10
linear_pc100_10_plot <- ggplot_na_imputations(pc_100_10$full_ts, linear_impute_pc_100_10)

# Interpolation for Parameter 20
linear_impute_pc_100_20 <- na_interpolation(pc_100_20$full_ts, option = "linear")

# Plot interpolation for Parameter 20
linear_pc100_20_plot <- ggplot_na_imputations(pc_100_20$full_ts, linear_impute_pc_100_20)

# Combine plots
linear_pc100_2_plot + linear_pc100_5_plot + linear_pc100_10_plot  + linear_pc100_20_plot 
