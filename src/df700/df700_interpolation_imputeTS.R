## Missing value imputation for Simple Decimation by linear interpolaion for DF700
# ==

# Interpolation for Parameter 1
linear_impute_sd_700_1 <- na_interpolation(sd_700_1$full_ts, option = "linear")

# Plot interpolation for Parameter 1 # Doesn't work as there's no missing values

# Interpolation for Parameter 2
linear_impute_sd_700_2 <- na_interpolation(sd_700_2$full_ts, option = "linear")

# Plot interpolation for Parameter 2
linear_sd700_2_plot <- ggplot_na_imputations(sd_700_2$full_ts, linear_impute_sd_700_2)

# Interpolation for Parameter 5
linear_impute_sd_700_5 <- na_interpolation(sd_700_5$full_ts, option = "linear")

# Plot interpolation for Parameter 5
linear_sd700_5_plot <- ggplot_na_imputations(sd_700_5$full_ts, linear_impute_sd_700_5)

# Interpolation for Parameter 10
linear_impute_sd_700_10 <- na_interpolation(sd_700_10$full_ts, option = "linear")

# Plot interpolation for Parameter 10
linear_sd700_10_plot <- ggplot_na_imputations(sd_700_10$full_ts, linear_impute_sd_700_10)

# Interpolation for Parameter 20
linear_impute_sd_700_20 <- na_interpolation(sd_700_20$full_ts, option = "linear")

# Plot interpolation for Parameter 20
linear_sd700_20_plot <- ggplot_na_imputations(sd_700_20$full_ts, linear_impute_sd_700_20)

# Combine plots
linear_sd700_2_plot + linear_sd700_5_plot + linear_sd700_10_plot  + linear_sd700_20_plot 



## Missing value imputation for Percentage Change by linear interpolaion for DF700
# ==

# Interpolation for Parameter 1
linear_impute_pc_700_1 <- na_interpolation(pc_700_1$full_ts, option = "linear")

# Plot interpolation for Parameter 1
linear_pc700_1_plot <- ggplot_na_imputations(pc_700_1$full_ts, linear_impute_pc_700_1) # Doesn't work as there's no missing values

# Interpolation for Parameter 2
linear_impute_pc_700_2 <- na_interpolation(pc_700_2$full_ts, option = "linear")

# Plot interpolation for Parameter 2
linear_pc700_2_plot <- ggplot_na_imputations(pc_700_2$full_ts, linear_impute_pc_700_2)

# Interpolation for Parameter 5
linear_impute_pc_700_5 <- na_interpolation(pc_700_5$full_ts, option = "linear")

# Plot interpolation for Parameter 5
linear_pc700_5_plot <- ggplot_na_imputations(pc_700_5$full_ts, linear_impute_pc_700_5)

# Interpolation for Parameter 10
linear_impute_pc_700_10 <- na_interpolation(pc_700_10$full_ts, option = "linear")

# Plot interpolation for Parameter 10
linear_pc700_10_plot <- ggplot_na_imputations(pc_700_10$full_ts, linear_impute_pc_700_10)

# Interpolation for Parameter 20
linear_impute_pc_700_20 <- na_interpolation(pc_700_20$full_ts, option = "linear")

# Plot interpolation for Parameter 20
linear_pc700_20_plot <- ggplot_na_imputations(pc_700_20$full_ts, linear_impute_pc_700_20)

# Combine plots
linear_pc700_2_plot + linear_pc700_5_plot + linear_pc700_10_plot  + linear_pc700_20_plot 
