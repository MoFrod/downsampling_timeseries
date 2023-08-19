# Specify width and heights for plot outputting.
F1_WIDTH = 4.1
F1_HEIGHT = 3

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

## Simple visualiation of catch22 feature coefficient of variation by method
#= 

# Reshape sensitivity data to a long format
cv_sensitivity_joined_long <- cv_sensitivity_joined %>%
  pivot_longer(cols = c(everyNthSensitivity, PercentageChangeSensitivity), 
               names_to = "Method", 
               values_to = "CoefficientofVariation")

# Change the Method into a factor and set the levels
cv_sensitivity_joined_long$Method <- factor(cv_sensitivity_joined_long$Method, levels = c("PercentageChangeSensitivity", "everyNthSensitivity"))

# Recode the names of the Rcatch22 features
cv_sensitivity_joined_long$names <- recode(cv_sensitivity_joined_long$names, 
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
cv_sensitivity_joined_long$Method <- recode(cv_sensitivity_joined_long$Method,  
                                            "PercentageChangeSensitivity" = "Percentage Change", 
                                            "everyNthSensitivity" = "EveryNth")

# Arrange order
cv_sensitivity_joined_long <- cv_sensitivity_joined_long %>%
  arrange(CoefficientofVariation)

# Convert "names" to a factor
cv_sensitivity_joined_long$names <- factor(cv_sensitivity_joined_long$names, levels = unique(cv_sensitivity_joined_long$names))

# Create a bar plot
ggplot(cv_sensitivity_joined_long, aes(x = CoefficientofVariation, y = names, fill = Method)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  theme_minimal() +
  theme(legend.position = "top") +
  labs(x = "Coefficient of Variation", y = "Feature", fill = "Method", title = "Coefficient of Variation of Catch22 Feature by Downsampling Method") +
  scale_fill_brewer(palette = "Paired")

# Reshape sensitivity subset data to a long format
cv_subset_sensitivity_joined_long <- cv_subset_sensitivity_joined %>%
  pivot_longer(cols = c(everyNthSensitivity, PercentageChangeSensitivity), 
               names_to = "Method", 
               values_to = "CoefficientofVariation")

# Change the Method into a factor and set the levels
cv_subset_sensitivity_joined_long$Method <- factor(cv_subset_sensitivity_joined_long$Method, levels = c("PercentageChangeSensitivity", "everyNthSensitivity"))

# Recode the names of the Methods
cv_subset_sensitivity_joined_long$Method <- recode(cv_subset_sensitivity_joined_long$Method,  
                                                   "PercentageChangeSensitivity" = "Percentage Change", 
                                                   "everyNthSensitivity" = "EveryNth")
# Recode the names of the Rcatch22 features
cv_subset_sensitivity_joined_long$names <- recode(cv_subset_sensitivity_joined_long$names,  
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
ggplot(cv_subset_sensitivity_joined_long, aes(x = CoefficientofVariation, y = names, fill = Method)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  theme_minimal() +
  theme(text = element_text(size = 30), legend.position = "top") +
  labs(x = "CoefficientofVariation", y = "Catch22 Feature", fill = "Method", title = "Most Sensitive Features Coefficient of Variation") +
  scale_fill_brewer(palette = "Paired") +
  scale_x_continuous(limits = c(0, NA))

# Use ggsave to save out the figure as a file.
# ggsave(here("~/Documents/MF MSc/downsampling_timeseries/graphs","sensitive_subset_plot.JPEG"), sensitive_subset_plot, width = F1_WIDTH, height=F1_HEIGHT)

# Recode the names of the Rcatch22 features
cv_sensitivity_ts_Nth$names <- recode(cv_sensitivity_ts_Nth$names,  
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
cv_sensitivity_ts_Nth$dataset <- recode(cv_sensitivity_ts_Nth$dataset,
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
cv_sensitivity_ts_Nth <- cv_sensitivity_ts_Nth %>%
  arrange(sensitivity)

# Convert "names" to a factor
cv_sensitivity_ts_Nth$names <- factor(cv_sensitivity_ts_Nth$names, levels = unique(cv_sensitivity_ts_Nth$names))

# Create a bar plot
ggplot(cv_sensitivity_ts_Nth, aes(x = sensitivity, y = names, fill = dataset)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  theme_minimal() +
  theme(text = element_text(size = 30), legend.position = "top") +
  labs(x = "Standard Deviation", y = "Catch22 Feature", fill = "Method", title = "Standard Deviation of Most Sensitive Features") +
  scale_fill_brewer(palette = "Blues") +
  scale_x_continuous(limits = c(0, NA))

# Recode the names of the Rcatch22 features
cv_sensitivity_ts_PC$names <- recode(cv_sensitivity_ts_PC$names,  
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
cv_sensitivity_ts_PC$dataset <- recode(cv_sensitivity_ts_PC$dataset,
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
cv_sensitivity_ts_PC <- cv_sensitivity_ts_PC %>%
  arrange(sensitivity)

# Convert "names" to a factor
cv_sensitivity_ts_PC$names <- factor(cv_sensitivity_ts_PC$names, levels = unique(cv_sensitivity_ts_PC$names))

# Create a bar plot
ggplot(cv_sensitivity_ts_PC, aes(x = sensitivity, y = names, fill = dataset)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  theme_minimal() +
  theme(text = element_text(size = 30), legend.position = "top") +
  labs(x = "Coefficient of Variation", y = "Catch22 Feature", fill = "Method", title = "Coefficient of Variation of Most Sensitive Features") +
  scale_fill_brewer(palette = "Blues") +
  scale_x_continuous(limits = c(0, NA))