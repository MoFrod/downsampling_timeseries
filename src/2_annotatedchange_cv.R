library(tidyverse)
library(ggplot2)


# Identify the features most sensitive (highest standard deviation) to data loss
cv_sensitivity <- joined_df %>%
  group_by(names) %>%
  summarise(sensitivity = (sd(scaled, na.rm = TRUE)/mean(scaled, na.rm = TRUE))) %>%
  arrange(desc(sensitivity)) %>%
  rename(CombinedSensitivity = sensitivity)

# Identify the features most sensitive (highest standard deviation) to data loss for everyNth
cv_sensitivity_nth <- joined_df %>%
  filter(method == "EveryNth") %>%
  group_by(names) %>%
  summarise(sensitivity = (sd(scaled, na.rm = TRUE)/mean(scaled, na.rm = TRUE))) %>%
  arrange(desc(sensitivity)) %>%
  rename(everyNthSensitivity = sensitivity)

# Identify the features most sensitive (highest standard deviation) to data loss for everyNth
cv_sensitivity_pc <- joined_df %>%
  filter(method == "PercentageChange") %>%
  group_by(names) %>%
  summarise(sensitivity = (sd(scaled, na.rm = TRUE)/mean(scaled, na.rm = TRUE))) %>%
  arrange(desc(sensitivity)) %>%
  rename(PercentageChangeSensitivity = sensitivity)

# Join the sensitive datasets together
cv_sensitivity_joined <- left_join(cv_sensitivity_nth, cv_sensitivity_pc, by = "names")

cv_all_sensitivity<- left_join(cv_sensitivity_joined, cv_sensitivity, by = "names") %>%
  arrange(desc(CombinedSensitivity)) %>%
  head(7)

# Get the top 10 most sensitive names
cv_top_ten <- head(cv_sensitivity$names, 10)


# Filter the sensitivity data to only include these names
cv_subset_sensitivity_joined <- cv_sensitivity_joined %>% 
  filter(names %in% cv_top_ten)

# Get the top 7 most sensitive names
cv_top_seven <- head(cv_sensitivity$names,7)

# Get the top 6 most sensitive names
cv_top_six <- head(cv_sensitivity$names, 6)

# Filter all the data to only include top 10 names
cv_filtered_df <- joined_df %>% 
  filter(names %in% cv_top_ten)

# Filter all the data to only include top 6 names
cv_subset_filtered_df <- joined_df %>% 
  filter(names %in% cv_top_six)

## Further investigation to sensitivity
#=
# Identify sensitivity across datasets
cv_sensitivity_ts <- joined_df %>%
  group_by(names, dataset, method) %>%
  summarise(sensitivity = (sd(scaled, na.rm = TRUE)/mean(scaled, na.rm = TRUE))) 

# Identify sensitivity across datasets for EveryNth
cv_sensitivity_ts_Nth <- cv_sensitivity_ts %>%
  filter(method == "EveryNth", names %in% top_ten)

# Identify sensitivity across datasets for PercentageChange
cv_sensitivity_ts_PC <- cv_sensitivity_ts %>%
  filter(method == "PercentageChange", names %in% cv_top_ten)


## Simple visualiation of catch22 feature standard deviation by method
#= 

# Reshape sensitivity data to a long format
cv_sensitivity_joined_long <- cv_sensitivity_joined %>%
  pivot_longer(cols = c(everyNthSensitivity, PercentageChangeSensitivity), 
               names_to = "Method", 
               values_to = "CoefficientofVariation")

# Make Coefficient of Variation into absolute values
cv_sensitivity_joined_long <- cv_sensitivity_joined_long %>%
  mutate(CoefficientofVariation = abs(CoefficientofVariation))

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
cv_sensitive_subset_plot <- ggplot(cv_subset_sensitivity_joined_long, aes(x = StandardDeviation, y = names, fill = Method)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  theme_minimal() +
  theme(text = element_text(size = 30), legend.position = "top") +
  labs(x = "Standard Deviation", y = "Catch22 Feature", fill = "Method", title = "Standard Deviation of Most Sensitive Features") +
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

