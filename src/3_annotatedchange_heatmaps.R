# Specify width and heights for plot outputting.
F1_WIDTH = 4.1
F1_HEIGHT = 3

## Heatmap of catch22 features
#==

# Convert "names" to a factor
joined_df$names <- factor(joined_df$names, levels = unique(joined_df$names))

# Convert "param" to a factor
joined_df$param <- factor(joined_df$param, levels = unique(joined_df$param))

# Recode the names of the Methods
filtered_df$method <- recode(filtered_df$method,  
                             "PercentageChange" = "Percentage Change")
# Recode the names of the Rcatch22 features
filtered_df$names <- recode(filtered_df$names, 
                            'CO_f1ecac' = "Autocorrelation_ApproxScale",
                            'CO_FirstMin_ac' = "Autocorrelation_FirstMinimum",
                            'SB_BinaryStats_mean_longstretch1' = "LongestSuccessivePeriod_AboveAverage",
                            'PD_PeriodicityWang_th0_01' = "Autocorrelation_FirstPeak",
                            'DN_Mean' = 'Mean',
                            'DN_HistogramMode_10' = "HistogramBin10",
                            'DN_Spread_Std' = 'Spead',
                            'CO_Embed2_Dist_tau_d_expfit_meandiff' = "DistributionExponentialFit_MeanAbsoluteError",
                            'IN_AutoMutualInfoStats_40_gaussian_fmmi' = "Autocorrelation_Automutual",
                            'CO_Embed2_Dist_tau_d_expfit_meandiff' = "DistributionExponentialFit_MeanAbsoluteError",
                            'SB_BinaryStats_diff_longstretch0' = "LongestSuccessivePeriod_SuccessiveDecreases", 
                            'PD_PeriodicityWang_th0_01' = "Autocorrelation_FirstPeak")

# Arrange in alphabetical order
filtered_df <- filtered_df %>%
  arrange(desc(names))

# Convert "names" to a factor
filtered_df$names <- factor(filtered_df$names, levels = unique(filtered_df$names))

# Create heatmap showing scaled difference across parameter, one per method.
ggplot(joined_df, aes(x = param, y = names, fill = scaled)) +
  geom_tile() +
  scale_fill_gradient2(low = "#084594", high = "#eff3ff", mid = "#c6dbef",
                       midpoint = 0, limits = range(joined_df$scaled)) +
  theme_minimal() +
  labs(x = "Parameter", y = "Feature", fill = "Scaled Difference", title = "Scaled Difference of Catch22 Feature by Parameter of Downsampling Method") +
  theme(legend.position = "bottom") +
  facet_wrap(~ method, ncol = 1)

# Create the heatmap showing scaled difference for most sensitive features across parameter, one per method.
ggplot(filtered_df, aes(x = as.numeric(param), y = names, fill = scaled)) +
  geom_tile() +
  scale_fill_gradient2(low = "#084594", high = "#eff3ff", mid = "#c6dbef",
                       midpoint = 0, limits = range(joined_df$scaled)) +
  theme_minimal() +
  labs(x = "Parameter", y = "Features", fill = "Scaled Difference", title = "Scaled Difference of Most Sensitive Catch22 Features by Parameter of Downsampling Method") +
  theme(legend.position = "bottom") +
  facet_wrap(~ method, ncol = 1)

# Create heatmap showing scaled difference across volume, one per method.
ggplot(joined_df, aes(x = as.numeric(vol), y = names, fill = scaled)) +
  geom_tile() +
  scale_fill_gradient2(low = "#084594", high = "#eff3ff", mid = "#c6dbef",
                       midpoint = 0, limits = range(joined_df$scaled)) +
  scale_x_reverse() +
  theme_minimal() +
  labs(x = "Volume of Data", y = "Feature", fill = "Scaled Difference", title = "Scaled Difference of Catch22 Feature by Data Volume of Downsampling Method") +
  theme(legend.position = "bottom") +
  facet_wrap(~ method, ncol = 1)

# Create the heatmap showing scaled difference for most sensitive features across volume, one per method.
ggplot(filtered_df, aes(x = as.numeric(vol), y = names, fill = scaled)) +
  geom_tile() +
  scale_fill_gradient2(low = "#084594", high = "#eff3ff", mid = "#c6dbef",
                       midpoint = 0, limits = range(joined_df$scaled)) +
  scale_x_reverse() +
  theme_minimal() +
  labs(x = "Volume of Data", y = "Catch22 Feature", fill = "Scaled Difference", title = "Scaled Difference of Sensitive Features by Volume") +
  theme(plot.title = element_text(hjust = -0.15), legend.position = "top", legend.justification = c(-0.14, 1)) +
  facet_wrap(~ method, ncol = 1)

# Use ggsave to save out the figure as a file.
ggsave(here("~/Documents/MF MSc/downsampling_timeseries/graphs","data_volume_plot.JPEG"), data_volume_plot, width = F1_WIDTH, height=F1_HEIGHT)

