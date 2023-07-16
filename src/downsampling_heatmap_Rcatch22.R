library(forcats)

# Create heatmap of Rcatch22 Feature subset by downsampling method for df100
ggplot(subset_std_100_long, 
       aes(method, names, fill = std_dev)) + 
  geom_tile(color = "white", lwd = 1.5, linetype = 1) +
  labs(x = "Downsampling Method", y = "Rcatch22 Feature", fill = "Parameter Standard Deviation", title = "Parameter Standard Deviaton of Downsampling Method by Rcatch22 Feature for DF100")

# Create subset of least variable downsampling method for df100
subset_features_linear_impute_pc100 <- features_linear_impute_pc100_long %>%
  filter(names %in% c("SB_BinaryStats_mean_longstretch1", "SB_BinaryStats_diff_longstretch0", "CO_FirstMin_ac", "PD_PeriodicityWang_th0_01", 
                      "CO_f1ecac", "CO_trev_1_num", "IN_AutoMutualInfoStats_40_gaussian_fmmi", "SP_Summaries_welch_rect_centroid", "DN_Spread_Std", "DN_Mean"))

# Create heatmap of least variable method parameters by Rcatch22 feature for df100
ggplot(subset_features_linear_impute_pc100, 
       aes(fct_inorder(parameters), names, fill = value)) + 
  geom_tile(color = "white", lwd = 1.5, linetype = 1) +
  labs(x = "Parameter", y = "Rcatch22 Feature", fill = "Impact", title = "Impact of Downsampling Parameter on Rcatch22 Feature for DF100")

# Create heatmap of Rcatch22 Feature subset by downsampling method for df200
ggplot(subset_std_200_long, 
       aes(method, names, fill = std_dev)) + 
  geom_tile(color = "white", lwd = 1.5, linetype = 1) +
  labs(x = "Downsampling Method", y = "Rcatch22 Feature", fill = "Parameter Standard Deviation", title = "Parameter Standard Deviaton of Downsampling Method by Rcatch22 Feature for DF200")

# Create subset of least variable downsampling method for df200
subset_features_linear_impute_pc200 <- features_linear_impute_pc200_long %>%
  filter(names %in% c("SB_BinaryStats_mean_longstretch1", "SB_BinaryStats_diff_longstretch0", "CO_FirstMin_ac", "PD_PeriodicityWang_th0_01", 
                      "CO_f1ecac", "CO_trev_1_num", "IN_AutoMutualInfoStats_40_gaussian_fmmi", "SP_Summaries_welch_rect_centroid", "DN_Spread_Std", "DN_Mean"))
         
# Create heatmap of least variable method parameters by Rcatch22 feature for df200
ggplot(subset_features_linear_impute_pc200, 
       aes(fct_inorder(parameters), names, fill = value)) + 
  geom_tile(color = "white", lwd = 1.5, linetype = 1) +
  labs(x = "Parameter", y = "Rcatch22 Feature", fill = "Impact", title = "Impact of Downsampling Parameter on Rcatch22 Feature for DF200")

# Create heatmap of Rcatch22 Feature subset by downsampling method for df300
ggplot(subset_std_300_long, 
       aes(method, names, fill = std_dev)) + 
  geom_tile(color = "white", lwd = 1.5, linetype = 1) +
  labs(x = "Downsampling Method", y = "Rcatch22 Feature", fill = "Parameter Standard Deviation", title = "Parameter Standard Deviaton of Downsampling Method by Rcatch22 Feature for DF300")

# Create subset of least variable downsampling method for df300
subset_features_linear_impute_pc300 <- features_linear_impute_pc300_long %>%
  filter(names %in% c("SB_BinaryStats_mean_longstretch1", "SB_BinaryStats_diff_longstretch0", "CO_FirstMin_ac", "PD_PeriodicityWang_th0_01", 
                      "CO_f1ecac", "CO_trev_1_num", "IN_AutoMutualInfoStats_40_gaussian_fmmi", "SP_Summaries_welch_rect_centroid", "DN_Spread_Std", "DN_Mean"))

# Create heatmap of least variable method parameters by Rcatch22 feature for df300
ggplot(subset_features_linear_impute_pc300, 
       aes(fct_inorder(parameters), names, fill = value)) + 
  geom_tile(color = "white", lwd = 1.5, linetype = 1) +
  labs(x = "Parameter", y = "Rcatch22 Feature", fill = "Impact", title = "Impact of Downsampling Parameter on Rcatch22 Feature for DF300")

# Create heatmap of Rcatch22 Feature subset by downsampling method for df400
ggplot(subset_std_400_long, 
       aes(method, names, fill = std_dev)) + 
  geom_tile(color = "white", lwd = 1.5, linetype = 1) +
  labs(x = "Downsampling Method", y = "Rcatch22 Feature", fill = "Parameter Standard Deviation", title = "Parameter Standard Deviaton of Downsampling Method by Rcatch22 Feature for DF400")

# Create subset of least variable downsampling method for df400
subset_features_linear_impute_pc400 <- features_linear_impute_pc400_long %>%
  filter(names %in% c("SB_BinaryStats_mean_longstretch1", "SB_BinaryStats_diff_longstretch0", "CO_FirstMin_ac", "PD_PeriodicityWang_th0_01", 
                      "CO_f1ecac", "CO_trev_1_num", "IN_AutoMutualInfoStats_40_gaussian_fmmi", "SP_Summaries_welch_rect_centroid", "DN_Spread_Std", "DN_Mean"))

# Create heatmap of least variable method parameters by Rcatch22 feature for df400
ggplot(subset_features_linear_impute_pc400, 
       aes(fct_inorder(parameters), names, fill = value)) + 
  geom_tile(color = "white", lwd = 1.5, linetype = 1) +
  labs(x = "Parameter", y = "Rcatch22 Feature", fill = "Impact", title = "Impact of Downsampling Parameter on Rcatch22 Feature for DF400")

# Create heatmap of Rcatch22 Feature subset by downsampling method for df500
ggplot(subset_std_500_long, 
       aes(method, names, fill = std_dev)) + 
  geom_tile(color = "white", lwd = 1.5, linetype = 1) +
  labs(x = "Downsampling Method", y = "Rcatch22 Feature", fill = "Parameter Standard Deviation", title = "Parameter Standard Deviaton of Downsampling Method by Rcatch22 Feature for DF500")

# Create subset of least variable downsampling method for df500
subset_features_linear_impute_pc500 <- features_linear_impute_pc500_long %>%
  filter(names %in% c("SB_BinaryStats_mean_longstretch1", "SB_BinaryStats_diff_longstretch0", "CO_FirstMin_ac", "PD_PeriodicityWang_th0_01", 
                      "CO_f1ecac", "CO_trev_1_num", "IN_AutoMutualInfoStats_40_gaussian_fmmi", "SP_Summaries_welch_rect_centroid", "DN_Spread_Std", "DN_Mean"))

# Create heatmap of least variable method parameters by Rcatch22 feature for df500
ggplot(subset_features_linear_impute_pc500, 
       aes(fct_inorder(parameters), names, fill = value)) + 
  geom_tile(color = "white", lwd = 1.5, linetype = 1) +
  labs(x = "Parameter", y = "Rcatch22 Feature", fill = "Impact", title = "Impact of Downsampling Parameter on Rcatch22 Feature for DF500")

# Create heatmap of Rcatch22 Feature subset by downsampling method for df600
ggplot(subset_std_600_long, 
       aes(method, names, fill = std_dev)) + 
  geom_tile(color = "white", lwd = 1.5, linetype = 1) +
  labs(x = "Downsampling Method", y = "Rcatch22 Feature", fill = "Parameter Standard Deviation", title = "Parameter Standard Deviaton of Downsampling Method by Rcatch22 Feature for DF600")

# Create subset of least variable downsampling method for df600
subset_features_linear_impute_pc600 <- features_linear_impute_pc600_long %>%
  filter(names %in% c("SB_BinaryStats_mean_longstretch1", "SB_BinaryStats_diff_longstretch0", "CO_FirstMin_ac", "PD_PeriodicityWang_th0_01", 
                      "CO_f1ecac", "CO_trev_1_num", "IN_AutoMutualInfoStats_40_gaussian_fmmi", "SP_Summaries_welch_rect_centroid", "DN_Spread_Std", "DN_Mean"))

# Create heatmap of least variable method parameters by Rcatch22 feature for df600
ggplot(subset_features_linear_impute_pc600, 
       aes(fct_inorder(parameters), names, fill = value)) + 
  geom_tile(color = "white", lwd = 1.5, linetype = 1) +
  labs(x = "Parameter", y = "Rcatch22 Feature", fill = "Impact", title = "Impact of Downsampling Parameter on Rcatch22 Feature for DF600")

# Create heatmap of Rcatch22 Feature subset by downsampling method for df700
ggplot(subset_std_700_long, 
       aes(method, names, fill = std_dev)) + 
  geom_tile(color = "white", lwd = 1.5, linetype = 1) +
  labs(x = "Downsampling Method", y = "Rcatch22 Feature", fill = "Parameter Standard Deviation", title = "Parameter Standard Deviaton of Downsampling Method by Rcatch22 Feature for DF700")

# Create subset of least variable downsampling method for df700
subset_features_linear_impute_pc700 <- features_linear_impute_pc700_long %>%
  filter(names %in% c("SB_BinaryStats_mean_longstretch1", "SB_BinaryStats_diff_longstretch0", "CO_FirstMin_ac", "PD_PeriodicityWang_th0_01", 
                      "CO_f1ecac", "CO_trev_1_num", "IN_AutoMutualInfoStats_40_gaussian_fmmi", "SP_Summaries_welch_rect_centroid", "DN_Spread_Std", "DN_Mean"))

# Create heatmap of least variable method parameters by Rcatch22 feature for df700
ggplot(subset_features_linear_impute_pc700, 
       aes(fct_inorder(parameters), names, fill = value)) + 
  geom_tile(color = "white", lwd = 1.5, linetype = 1) +
  labs(x = "Parameter", y = "Rcatch22 Feature", fill = "Impact", title = "Impact of Downsampling Parameter on Rcatch22 Feature for DF700")

# Create heatmap of Rcatch22 Feature subset by downsampling method for df800a
ggplot(subset_std_800a_long, 
       aes(method, names, fill = std_dev)) + 
  geom_tile(color = "white", lwd = 1.5, linetype = 1) +
  labs(x = "Downsampling Method", y = "Rcatch22 Feature", fill = "Parameter Standard Deviation", title = "Parameter Standard Deviaton of Downsampling Method by Rcatch22 Feature for DF800a")

# Create subset of least variable downsampling method for df800a
subset_features_linear_impute_pc800a <- features_linear_impute_pc800a_long %>%
  filter(names %in% c("SB_BinaryStats_mean_longstretch1", "SB_BinaryStats_diff_longstretch0", "CO_FirstMin_ac", "PD_PeriodicityWang_th0_01", 
                      "CO_f1ecac", "CO_trev_1_num", "IN_AutoMutualInfoStats_40_gaussian_fmmi", "SP_Summaries_welch_rect_centroid", "DN_Spread_Std", "DN_Mean"))

# Create heatmap of least variable method parameters by Rcatch22 feature for df800a
ggplot(subset_features_linear_impute_pc800a, 
       aes(fct_inorder(parameters), names, fill = value)) + 
  geom_tile(color = "white", lwd = 1.5, linetype = 1) +
  labs(x = "Parameter", y = "Rcatch22 Feature", fill = "Impact", title = "Impact of Downsampling Parameter on Rcatch22 Feature for DF800a")

# Create heatmap of Rcatch22 Feature subset by downsampling method for df800b
ggplot(subset_std_800b_long, 
       aes(method, names, fill = std_dev)) + 
  geom_tile(color = "white", lwd = 1.5, linetype = 1) +
  labs(x = "Downsampling Method", y = "Rcatch22 Feature", fill = "Parameter Standard Deviation", title = "Parameter Standard Deviaton of Downsampling Method by Rcatch22 Feature for DF800b")

# Create subset of least variable downsampling method for df800b
subset_features_linear_impute_pc800b <- features_linear_impute_pc800b_long %>%
  filter(names %in% c("SB_BinaryStats_mean_longstretch1", "SB_BinaryStats_diff_longstretch0", "CO_FirstMin_ac", "PD_PeriodicityWang_th0_01", 
                      "CO_f1ecac", "CO_trev_1_num", "IN_AutoMutualInfoStats_40_gaussian_fmmi", "SP_Summaries_welch_rect_centroid", "DN_Spread_Std", "DN_Mean"))

# Create heatmap of least variable method parameters by Rcatch22 feature for df800b
ggplot(subset_features_linear_impute_pc800b, 
       aes(fct_inorder(parameters), names, fill = value)) + 
  geom_tile(color = "white", lwd = 1.5, linetype = 1) +
  labs(x = "Parameter", y = "Rcatch22 Feature", fill = "Impact", title = "Impact of Downsampling Parameter on Rcatch22 Feature for DF800b")
         