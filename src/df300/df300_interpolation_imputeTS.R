## Missing value imputation for Simple Decimation by linear interpolaion for DF300
# ==

# Interpolation for Parameter 1
linear_impute_sd_300_1 <- na_interpolation(sd_300_1$full_ts, option = "linear")

# Plot interpolation for Parameter 1 # Doens't work as there's no missing values

# Interpolation for Parameter 2
linear_impute_sd_300_2 <- na_interpolation(sd_300_2$full_ts, option = "linear")

# Plot interpolation for Parameter 2
linear_sd300_2_plot <- ggplot_na_imputations(sd_300_2$full_ts, linear_impute_sd_300_2)

# Interpolation for Parameter 5
linear_impute_sd_300_5 <- na_interpolation(sd_300_5$full_ts, option = "linear")

# Plot interpolation for Parameter 5
linear_sd300_5_plot <- ggplot_na_imputations(sd_300_5$full_ts, linear_impute_sd_300_5)

# Interpolation for Parameter 10
linear_impute_sd_300_10 <- na_interpolation(sd_300_10$full_ts, option = "linear")

# Plot interpolation for Parameter 10
linear_sd300_10_plot <- ggplot_na_imputations(sd_300_10$full_ts, linear_impute_sd_300_10)

# Interpolation for Parameter 20
linear_impute_sd_300_20 <- na_interpolation(sd_300_20$full_ts, option = "linear")

# Plot interpolation for Parameter 20
linear_sd300_20_plot <- ggplot_na_imputations(sd_300_20$full_ts, linear_impute_sd_300_20)

# Combine plots
linear_sd300_2_plot + linear_sd300_5_plot + linear_sd300_10_plot  + linear_sd300_20_plot 



## Missing value imputation for Percentage Change by linear interpolaion for DF300
# ==

# Interpolation for Parameter 1
linear_impute_pc_300_1 <- na_interpolation(pc_300_1$full_ts, option = "linear")

# Plot interpolation for Parameter 1 # Doens't work as there's no missing values

# Interpolation for Parameter 2
linear_impute_pc_300_2 <- na_interpolation(pc_300_2$full_ts, option = "linear")

# Plot interpolation for Parameter 2 # Doens't work as there's no missing values

# Interpolation for Parameter 5
linear_impute_pc_300_5 <- na_interpolation(pc_300_5$full_ts, option = "linear")

# Plot interpolation for Parameter 5
linear_pc300_5_plot <- ggplot_na_imputations(pc_300_5$full_ts, linear_impute_pc_300_5)

# Interpolation for Parameter 10
linear_impute_pc_300_10 <- na_interpolation(pc_300_10$full_ts, option = "linear")

# Plot interpolation for Parameter 10
linear_pc300_10_plot <- ggplot_na_imputations(pc_300_10$full_ts, linear_impute_pc_300_10)

# Interpolation for Parameter 20
linear_impute_pc_300_20 <- na_interpolation(pc_300_20$full_ts, option = "linear")

# Plot interpolation for Parameter 20
linear_pc300_20_plot <- ggplot_na_imputations(pc_300_20$full_ts, linear_impute_pc_300_20)

# Combine plots
linear_pc300_5_plot + linear_pc300_10_plot  + linear_pc300_20_plot 
