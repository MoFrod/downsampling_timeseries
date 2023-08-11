# Specify width and heights for plot outputting.
F1_WIDTH = 4.1
F1_HEIGHT = 3

## All datasets as line and point graphs
#==

# Simple visualisation of each dataset, one per facet.
tsp <- merged %>% ggplot(aes(x = id, y = val)) + geom_line(color = "#084594") + geom_point(color = "#084594") + facet_grid(dataset~., scales = "free") + 
  labs(x = "Time Series ID", y = "Time Series Value", title = "Annotated Change Time Series Data")

# Show the visualisation
tsp

# Recode the names of the datasets
merged$dataset <- recode(merged$dataset,
                              "100" = "A", 
                              "200" = "B", 
                              "300" = "C", 
                              "400" = "D", 
                              "500" = "E", 
                              "600" = "F", 
                              "700" = "G", 
                              "800A" = "H", 
                              "800B" = "I")

# Create matching visualisation
ggplot(merged, 
       aes(x = id, y = val)) + geom_line(linewidth = 1, color = "#084594") + facet_grid(dataset~., scales = "free") +
  labs(x = "Time ID", y = "Time Value", title = "Annotated Change Nine Synthetic Time Series") +
  facet_grid(dataset~., scales = "free") +
  theme_minimal()

## Simple visualiation of catch22 feature standard deviation by method
#= 

# Reshape sensitivity data to a long format
sensitivity_joined_long <- sensitivity_joined %>%
  pivot_longer(cols = c(everyNthSensitivity, PercentageChangeSensitivity), 
               names_to = "Method", 
               values_to = "StandardDeviation")

# Change the Method into a factor and set the levels
sensitivity_joined_long$Method <- factor(sensitivity_joined_long$Method, levels = c("PercentageChangeSensitivity", "everyNthSensitivity"))

# Recode the names of the Rcatch22 features
sensitivity_joined_long$names <- recode(sensitivity_joined_long$names, 
                                 'DN_HistogramMode_5' = "HistogramBin5",
                                 'DN_HistogramMode_10' = "HistogramBin10",
                                 'CO_f1ecac' = "Autocorrelation_ApproxScale",
                                 'CO_FirstMin_ac' = "Autocorrelation_FirstMinimum",
                                 'CO_HistogramAMI_even_2_5' = "NonLinearcorrelation_HistogramBin5",
                                 'CO_trev_1_num' = "CubeDifference_Average",
                                 'MD_hrv_classic_pnn40' = "DifferenceMagnitudeProportions_Above4%",
                                 'SB_BinaryStats_mean_longstretch1' = "LongestSuccessivePeriod_AboveAverage",
                                 'SB_TransitionMatrix_3ac_sumdiagcov' = "TransitionMatrix_Column-wiseVariances",
                                 'PD_PeriodicityWang_th0_01' = "Autocorrelation_FirstPeak",
                                 'CO_Embed2_Dist_tau_d_expfit_meandiff' = "DistributionExponentialFit_MeanAbsoluteError",
                                 'IN_AutoMutualInfoStats_40_gaussian_fmmi' = "Autocorrelation_Automutual",
                                 'FC_LocalSimple_mean1_tauresrat' = "Ratio_SuccessivePairIncrementalDifferences_AutocorrelationZero-crossing",
                                 'DN_OutlierInclude_p_001_mdrmd' = "Over-thresholdEvents_Positive",
                                 'DN_OutlierInclude_n_001_mdrmd' = "Over-thresholdEvents_Negative",
                                 'SP_Summaries_welch_rect_area_5_1' = "PowerSpectrum_Lowest20%",
                                 'SB_BinaryStats_diff_longstretch0' = "LongestSuccessivePeriod_SuccessiveDecreases",
                                 'SB_MotifThree_quantile_hh' = "ThreeSymbolProbability_Entropy",
                                 'SC_FluctAnal_2_rsrangefit_50_1_logi_prop_r1' = "RescaledRangeAnalysis_LogarithmicTimescaleFluctuation",
                                 'SC_FluctAnal_2_dfa_50_1_2_logi_prop_r1' = "RescaledRangeAnalysis_DetrendedTimescaleFluctuation",
                                 'SP_Summaries_welch_rect_centroid' = "PowerSpectrum_Centroid",
                                 'FC_LocalSimple_mean3_stderr' = "ErrorMeasure_Previous3Values", 
                                 'DN_Spread_Std' = 'Spead',
                                 'DN_Mean' = 'Mean')

# Recode the names of the Methods
sensitivity_joined_long$Method <- recode(sensitivity_joined_long$Method,  
                                                "PercentageChangeSensitivity" = "Percentage Change", 
                                                "everyNthSensitivity" = "EveryNth")

# Arrange order
sensitivity_joined_long <- sensitivity_joined_long %>%
  arrange(StandardDeviation)

# Convert "names" to a factor
sensitivity_joined_long$names <- factor(sensitivity_joined_long$names, levels = unique(sensitivity_joined_long$names))

# Create a bar plot
ggplot(sensitivity_joined_long, aes(x = StandardDeviation, y = names, fill = Method)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  theme_minimal() +
  theme(legend.position = "top") +
  labs(x = "Standard Deviation", y = "Feature", fill = "Method", title = "Standard Deviation of Catch22 Feature by Downsampling Method") +
  scale_fill_brewer(palette = "Paired")

# Reshape sensitivity subset data to a long format
subset_sensitivity_joined_long <- subset_sensitivity_joined %>%
  pivot_longer(cols = c(everyNthSensitivity, PercentageChangeSensitivity), 
               names_to = "Method", 
               values_to = "StandardDeviation")

# Change the Method into a factor and set the levels
subset_sensitivity_joined_long$Method <- factor(subset_sensitivity_joined_long$Method, levels = c("PercentageChangeSensitivity", "everyNthSensitivity"))

# Recode the names of the Methods
subset_sensitivity_joined_long$Method <- recode(subset_sensitivity_joined_long$Method,  
                                                "PercentageChangeSensitivity" = "Percentage Change", 
                                                "everyNthSensitivity" = "EveryNth")
# Recode the names of the Rcatch22 features
subset_sensitivity_joined_long$names <- recode(subset_sensitivity_joined_long$names,  
                                               'CO_f1ecac' = "Autocorrelation_ApproxScale",
                                               'CO_FirstMin_ac' = "Autocorrelation_FirstMinimum",
                                               'SB_BinaryStats_mean_longstretch1' = "LongestSuccessivePeriod_AboveAverage",
                                               'PD_PeriodicityWang_th0_01' = "Autocorrelation_FirstPeak",
                                               'DN_Mean' = 'Mean',
                                               'DN_HistogramMode_10' = "HistogramBin10",
                                               'DN_Spread_Std' = 'Spead',
                                               'CO_Embed2_Dist_tau_d_expfit_meandiff' = "DistributionExponentialFit_MeanAbsoluteError",
                                               'IN_AutoMutualInfoStats_40_gaussian_fmmi' = "Autocorrelation_Automutual",
                                               'SB_BinaryStats_diff_longstretch0' = "LongestSuccessivePeriod_SuccessiveDecreases")

# Create a bar plot
sensitive_subset_plot <- ggplot(subset_sensitivity_joined_long, aes(x = StandardDeviation, y = names, fill = Method)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  theme_minimal() +
  theme(text = element_text(size = 30), legend.position = "top") +
  labs(x = "Standard Deviation", y = "Catch22 Feature", fill = "Method", title = "Standard Deviation of Most Sensitive Features") +
  scale_fill_brewer(palette = "Paired") +
  scale_x_continuous(limits = c(0, NA))

# Use ggsave to save out the figure as a file.
# ggsave(here("~/Documents/MF MSc/downsampling_timeseries/graphs","sensitive_subset_plot.JPEG"), sensitive_subset_plot, width = F1_WIDTH, height=F1_HEIGHT)

# Recode the names of the Rcatch22 features
sensitivity_ts_Nth$names <- recode(sensitivity_ts_Nth$names,  
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

# Recode the names of the datasets
sensitivity_ts_Nth$dataset <- recode(sensitivity_ts_Nth$dataset,
                         "df100" = "100", 
                         "df200" = "200", 
                         "df300" = "300", 
                         "df400" = "400", 
                         "df500" = "500", 
                         "df600" = "600", 
                         "df700" = "700", 
                         "df800a" = "800A", 
                         "df800b" = "800B")

# Arrange order
sensitivity_ts_Nth <- sensitivity_ts_Nth %>%
  arrange(sensitivity)

# Convert "names" to a factor
sensitivity_ts_Nth$names <- factor(sensitivity_ts_Nth$names, levels = unique(sensitivity_ts_Nth$names))

# Create a bar plot
ggplot(sensitivity_ts_Nth, aes(x = sensitivity, y = names, fill = dataset)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  theme_minimal() +
  theme(text = element_text(size = 30), legend.position = "top") +
  labs(x = "Standard Deviation", y = "Catch22 Feature", fill = "Method", title = "Standard Deviation of Most Sensitive Features") +
  scale_fill_brewer(palette = "Blues") +
  scale_x_continuous(limits = c(0, NA))

# Recode the names of the Rcatch22 features
sensitivity_ts_PC$names <- recode(sensitivity_ts_PC$names,  
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

# Recode the names of the datasets
sensitivity_ts_PC$dataset <- recode(sensitivity_ts_PC$dataset,
                                     "df100" = "100", 
                                     "df200" = "200", 
                                     "df300" = "300", 
                                     "df400" = "400", 
                                     "df500" = "500", 
                                     "df600" = "600", 
                                     "df700" = "700", 
                                     "df800a" = "800A", 
                                     "df800b" = "800B")

# Arrange order
sensitivity_ts_PC <- sensitivity_ts_PC %>%
  arrange(sensitivity)

# Convert "names" to a factor
sensitivity_ts_PC$names <- factor(sensitivity_ts_PC$names, levels = unique(sensitivity_ts_PC$names))

# Create a bar plot
ggplot(sensitivity_ts_PC, aes(x = sensitivity, y = names, fill = dataset)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  theme_minimal() +
  theme(text = element_text(size = 30), legend.position = "top") +
  labs(x = "Standard Deviation", y = "Catch22 Feature", fill = "Method", title = "Standard Deviation of Most Sensitive Features") +
  scale_fill_brewer(palette = "Blues") +
  scale_x_continuous(limits = c(0, NA))


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



## Line graps of catch22 features
#=
# Recode the names of the datasets
#filtered_df$dataset <- recode(filtered_df$dataset,
                              #"df100" = "A", 
                              #"df200" = "B", 
                              #"df300" = "C", 
                              #"df400" = "D", 
                              #"df500" = "E", 
                              #"df600" = "F", 
                              #"df700" = "G", 
                              #"df800a" = "H", 
                              #"df800b" = "I")
# Recode the names of the datasets
filtered_df$dataset <- recode(filtered_df$dataset,
                              "df100" = "100", 
                              "df200" = "200", 
                              "df300" = "300", 
                              "df400" = "400", 
                              "df500" = "500", 
                              "df600" = "600", 
                              "df700" = "700", 
                              "df800a" = "800A", 
                              "df800b" = "800B")


# Create the difference line graph for CO_FirstMin_ac for datasets A, B, C
CO_FirstMin_subset_plot <- ggplot(filtered_df %>%
         filter(names == "Autocorrelation_FirstMinimum", dataset == c("A", "B")), 
       aes(x = as.numeric(vol), y = scaled, color = method)) +
  scale_color_brewer(palette = "Paired") +
  geom_line(linewidth = 2) +
  scale_x_reverse() +
  theme_minimal() +
  theme(text = element_text(size = 30), legend.position = "top") +
  labs(x = "Volume of Data", y = "Scaled Difference", color = "Method", title = "The First Minimum of the Autocorrelation Function Scaled Difference across Volume") +
  facet_wrap(~ dataset, ncol = 1)

Use ggsave to save out the figure as a file.
#ggsave(here("~/Documents/MF MSc/downsampling_timeseries/graphs","CO_FirstMin_subset_plot.JPEG"), CO_FirstMin_subset_plot, width = F1_WIDTH, height=F1_HEIGHT)



# Create the difference line graph for CO_FirstMin_ac
ggplot(filtered_df %>%
         filter(names == "Autocorrelation_FirstMinimum"), 
       aes(x = as.numeric(vol), y = scaled, color = method)) +
  scale_color_brewer(palette = "Paired") +
  geom_line(linewidth = 1) +
  scale_x_reverse() +
  theme_minimal() +
  theme(plot.title = element_text(hjust = -0.15), legend.position = "top", legend.justification = c(-0.14, 1)) +
  labs(x = "Volume of Data", y = "Scaled Difference", color = "Method", title = "The First Minimum of the Autocorrelation Function Scaled Difference across Data Volume") +
  facet_wrap(~ dataset, ncol = 3)


# Create the scaled difference line graph for SB_BinaryStats_diff_longstretch0
ggplot(filtered_df %>%
         filter(names == "LongestSuccessivePeriod_SuccessiveDecreases"), 
       aes(x = as.numeric(vol), y = scaled, color = method)) +
  scale_color_brewer(palette = "Paired") +
  geom_line(linewidth = 1) +
  scale_x_reverse() +
  theme_minimal() +
  theme(plot.title = element_text(hjust = -0.15), legend.position = "top", legend.justification = c(-0.14, 1)) +
  labs(x = "Volume of Data", y = "Scaled Difference", color = "Method", title = "Longest Sequence of Successive Steps that Decrease Scaled Difference across Data Volume") +
  facet_wrap(~ dataset, ncol = 3)

# Create the line graph for SB_BinaryStats_mean_longstretch1
ggplot(filtered_df %>%
         filter(names == "LongestSuccessivePeriod_AboveAverage"), 
       aes(x = as.numeric(vol), y = scaled, color = method)) +
  scale_color_brewer(palette = "Paired") +
  geom_line(linewidth = 1) +
  scale_x_reverse() +
  theme_minimal() +
  theme(plot.title = element_text(hjust = -0.15), legend.position = "top", legend.justification = c(-0.14, 1)) +
  labs(x = "Volume of Data", y = "Scaled Difference", color = "Method", title = "Longest Sequence of Successive Values Greater than the Mean Scaled Difference across Data Volume") +
  facet_wrap(~ dataset, ncol = 3)

# Create the difference line graph for IN_AutoMutualInfoStats_40_gaussian_fmmi
ggplot(filtered_df %>%
         filter(names == "Autocorrelation_Automutual"), 
       aes(x = as.numeric(vol), y = difference, color = method)) +
  scale_color_brewer(palette = "Paired") +
  geom_line(linewidth = 1) +
  scale_x_reverse() +
  theme_minimal() +
  theme(plot.title = element_text(hjust = -0.15), legend.position = "top", legend.justification = c(-0.14, 1)) +
  labs(x = "Volume of Data", y = "Scaled Difference", color = "Method", title = "Minimum of the Automutual Information Function Scaled Difference across Data Volume") +
  facet_wrap(~ dataset, ncol = 3)

# Create the difference line graph for PD_PeriodicityWang_th0_01 
ggplot(filtered_df %>%
         filter(names == "Autocorrelation_FirstPeak"), 
       aes(x = as.numeric(vol), y = difference, color = method)) +
  scale_color_brewer(palette = "Paired") +
  geom_line(linewidth = 1) +
  scale_x_reverse() +
  theme_minimal() +
  theme(plot.title = element_text(hjust = -0.15), legend.position = "top", legend.justification = c(-0.14, 1)) +
  labs(x = "Volume of Data", y = "Scaled Difference", color = "Method", title = "First Peak in the Autocorrelation Function Scaled Difference across Data Volume") +
  facet_wrap(~ dataset, ncol = 3)

# Create the difference line graph for CO_f1ecac
ggplot(filtered_df %>%
         filter(names == "Autocorrelation_ApproxScale"), 
       aes(x = as.numeric(vol), y = difference, color = method)) +
  scale_color_brewer(palette = "Paired") +
  geom_line(linewidth = 1) +
  scale_x_reverse() +
  theme_minimal() +
  theme(plot.title = element_text(hjust = -0.15), legend.position = "top", legend.justification = c(-0.14, 1)) +
  labs(x = "Volume of Data", y = "Scaled Difference", color = "Method", title = "Approximate Scale of Autocorrelation Scaled Difference across Data Volume") +
  facet_wrap(~ dataset, ncol = 3)


# Create the difference line graph for CO_Embed2_Dist_tau_d_expfit_meandiff
ggplot(filtered_df %>%
         filter(names == "DistributionExponentialFit_MeanAbsoluteError"), 
       aes(x = as.numeric(vol), y = difference, color = method)) +
  scale_color_brewer(palette = "Paired") +
  geom_line(linewidth = 1) +
  scale_x_reverse() +
  theme_minimal() +
  theme(plot.title = element_text(hjust = -0.15), legend.position = "top", legend.justification = c(-0.14, 1)) +
  labs(x = "Volume of Data", y = "Scaled Difference", color = "Method", title = "Mean Absolute Error of an Exponential Fit Scaled Difference across Data Volume") +
  facet_wrap(~ dataset, ncol = 3)
