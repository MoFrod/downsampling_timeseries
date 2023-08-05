## Confirm which features have the highest standard deviation across all four methods
#==

# For df100
std_top10_100 <- combined_std_100_long %>%
  group_by(names) %>%
  summarise(
    std_dev_spread = sd(std_dev), 
    median_std_dev = median(std_dev), 
    mean_std_dev = mean(std_dev)) %>%
  arrange(desc(median_std_dev))  %>%
  arrange(desc(std_dev_spread))

# For df200
std_top10_200 <- combined_std_200_long %>%
  group_by(names) %>%
  summarise(
    std_dev_spread = sd(std_dev), 
    median_std_dev = median(std_dev), 
    mean_std_dev = mean(std_dev)) %>%
  arrange(desc(median_std_dev))  %>%
  arrange(desc(std_dev_spread))

# For df300
std_top10_300 <- combined_std_300_long %>%
  group_by(names) %>%
  summarise(
    std_dev_spread = sd(std_dev), 
    median_std_dev = median(std_dev), 
    mean_std_dev = mean(std_dev)) %>%
  arrange(desc(median_std_dev))  %>%
  arrange(desc(std_dev_spread))

# For df400
std_top10_400 <- combined_std_400_long %>%
  group_by(names) %>%
  summarise(
    std_dev_spread = sd(std_dev), 
    median_std_dev = median(std_dev), 
    mean_std_dev = mean(std_dev)) %>%
  arrange(desc(median_std_dev))  %>%
  arrange(desc(std_dev_spread))

# For df500
std_top10_500 <- combined_std_500_long %>%
  group_by(names) %>%
  summarise(
    std_dev_spread = sd(std_dev), 
    median_std_dev = median(std_dev), 
    mean_std_dev = mean(std_dev)) %>%
  arrange(desc(median_std_dev))  %>%
  arrange(desc(std_dev_spread))

# For df600
std_top10_600 <- combined_std_600_long %>%
  group_by(names) %>%
  summarise(
    std_dev_spread = sd(std_dev), 
    median_std_dev = median(std_dev), 
    mean_std_dev = mean(std_dev)) %>%
  arrange(desc(median_std_dev))  %>%
  arrange(desc(std_dev_spread))

# For df700
std_top10_700 <- combined_std_700_long %>%
  group_by(names) %>%
  summarise(
    std_dev_spread = sd(std_dev), 
    median_std_dev = median(std_dev), 
    mean_std_dev = mean(std_dev)) %>%
  arrange(desc(median_std_dev))  %>%
  arrange(desc(std_dev_spread))

# For df800a
std_top10_800a <- combined_std_800a_long %>%
  group_by(names) %>%
  summarise(
    std_dev_spread = sd(std_dev), 
    median_std_dev = median(std_dev), 
    mean_std_dev = mean(std_dev)) %>%
  arrange(desc(median_std_dev))  %>%
  arrange(desc(std_dev_spread))

# For df800b
std_top10_800b <- combined_std_800b_long %>%
  group_by(names) %>%
  summarise(
    std_dev_spread = sd(std_dev), 
    median_std_dev = median(std_dev), 
    mean_std_dev = mean(std_dev)) %>%
  arrange(desc(median_std_dev))  %>%
  arrange(desc(std_dev_spread))


## Filter Rcatch22 features based on standard deviation for DF100
#===

# Filter dataframe
subset_std_100_long <- combined_std_100_long %>%
  filter(names %in% c("SB_BinaryStats_mean_longstretch1", "SB_BinaryStats_diff_longstretch0", "CO_FirstMin_ac", "PD_PeriodicityWang_th0_01", 
  "CO_f1ecac", "CO_trev_1_num", "IN_AutoMutualInfoStats_40_gaussian_fmmi", "SP_Summaries_welch_rect_centroid", "DN_Spread_Std", "DN_Mean"))

# Create a bar plot
subset_std_100_plot <- ggplot(subset_std_100_long, aes(x = std_dev, y = names, fill = method)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(x = "Standard Deviation", y = "Feature", fill = "Method", title = "Standard Deviation by Method for DF100") +
  scale_fill_brewer(palette = "Paired") +
  theme_minimal() +
  theme(axis.title.y = element_blank(), axis.title.x = element_blank(), legend.position = "none")

## Filter Rcatch22 features based on standard deviation for DF200
#===

# Filter dataframe
subset_std_200_long <- combined_std_200_long %>%
  filter(names %in% c("SB_BinaryStats_mean_longstretch1", "SB_BinaryStats_diff_longstretch0", "CO_FirstMin_ac", "PD_PeriodicityWang_th0_01", 
                      "CO_f1ecac", "CO_trev_1_num", "IN_AutoMutualInfoStats_40_gaussian_fmmi", "SP_Summaries_welch_rect_centroid", "DN_Spread_Std", "DN_Mean"))

# Create a bar plot
subset_std_200_plot <- ggplot(subset_std_200_long, aes(x = std_dev, y = names, fill = method)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(x = "Standard Deviation", y = "Feature", fill = "Method", title = "Standard Deviation by Method for DF200") +
  scale_fill_brewer(palette = "Paired") +
  theme_minimal() +
  theme(axis.title.y = element_blank(), axis.text.y = element_blank(), axis.title.x = element_blank(), legend.position = "none")


## Filter Rcatch22 features based on standard deviation for DF300
#===

# Filter dataframe
subset_std_300_long <- combined_std_300_long %>%
  filter(names %in% c("SB_BinaryStats_mean_longstretch1", "SB_BinaryStats_diff_longstretch0", "CO_FirstMin_ac", "PD_PeriodicityWang_th0_01", 
                      "CO_f1ecac", "CO_trev_1_num", "IN_AutoMutualInfoStats_40_gaussian_fmmi", "SP_Summaries_welch_rect_centroid", "DN_Spread_Std", "DN_Mean"))

# Create a bar plot
subset_std_300_plot <- ggplot(subset_std_300_long, aes(x = std_dev, y = names, fill = method)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(x = "Standard Deviation", y = "Feature", fill = "Method", title = "Standard Deviation by Method for DF300") +
  scale_fill_brewer(palette = "Paired") +
  theme_minimal() +
  theme(axis.title.y = element_blank(), axis.text.y = element_blank(), axis.title.x = element_blank())

## Combine plots
#==

grid.arrange(patchworkGrob(subset_std_100_plot + subset_std_200_plot + subset_std_300_plot), left = "Feature", bottom = "Standard Deviation")

## Filter Rcatch22 features based on standard deviation for DF400
#===

# Filter dataframe
subset_std_400_long <- combined_std_400_long %>%
  filter(names %in% c("SB_BinaryStats_mean_longstretch1", "SB_BinaryStats_diff_longstretch0", "CO_FirstMin_ac", "PD_PeriodicityWang_th0_01", 
                      "CO_f1ecac", "CO_trev_1_num", "IN_AutoMutualInfoStats_40_gaussian_fmmi", "SP_Summaries_welch_rect_centroid", "DN_Spread_Std", "DN_Mean"))

# Create a bar plot
subset_std_400_plot <- ggplot(subset_std_400_long, aes(x = std_dev, y = names, fill = method)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(x = "Standard Deviation", y = "Feature", fill = "Method", title = "Standard Deviation by Method for DF400") +
  scale_fill_brewer(palette = "Paired") +
  theme_minimal() +
  theme(axis.title.y = element_blank(), axis.title.x = element_blank(), legend.position = "none")

## Filter Rcatch22 features based on standard deviation for DF500
#===

# Filter dataframe
subset_std_500_long <- combined_std_500_long %>%
  filter(names %in% c("SB_BinaryStats_mean_longstretch1", "SB_BinaryStats_diff_longstretch0", "CO_FirstMin_ac", "PD_PeriodicityWang_th0_01", 
                      "CO_f1ecac", "CO_trev_1_num", "IN_AutoMutualInfoStats_40_gaussian_fmmi", "SP_Summaries_welch_rect_centroid", "DN_Spread_Std", "DN_Mean"))

# Create a bar plot
subset_std_500_plot <- ggplot(subset_std_500_long, aes(x = std_dev, y = names, fill = method)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(x = "Standard Deviation", y = "Feature", fill = "Method", title = "Standard Deviation by Method for DF500") +
  scale_fill_brewer(palette = "Paired") +
  theme_minimal() +
  theme(axis.title.y = element_blank(), axis.text.y = element_blank(), axis.title.x = element_blank(), legend.position = "none")


## Filter Rcatch22 features based on standard deviation for DF600
#===

# Filter dataframe
subset_std_600_long <- combined_std_600_long %>%
  filter(names %in% c("SB_BinaryStats_mean_longstretch1", "SB_BinaryStats_diff_longstretch0", "CO_FirstMin_ac", "PD_PeriodicityWang_th0_01", 
                      "CO_f1ecac", "CO_trev_1_num", "IN_AutoMutualInfoStats_40_gaussian_fmmi", "SP_Summaries_welch_rect_centroid", "DN_Spread_Std", "DN_Mean"))

# Create a bar plot
subset_std_600_plot <- ggplot(subset_std_600_long, aes(x = std_dev, y = names, fill = method)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(x = "Standard Deviation", y = "Feature", fill = "Method", title = "Standard Deviation by Method for DF600") +
  scale_fill_brewer(palette = "Paired") +
  theme_minimal() +
  theme(axis.title.y = element_blank(), axis.text.y = element_blank(), axis.title.x = element_blank())

## Combine plots
#==

grid.arrange(patchworkGrob(subset_std_400_plot + subset_std_500_plot + subset_std_600_plot), left = "Feature", bottom = "Standard Deviation")

## Filter Rcatch22 features based on standard deviation for DF700
#===

# Filter dataframe
subset_std_700_long <- combined_std_700_long %>%
  filter(names %in% c("SB_BinaryStats_mean_longstretch1", "SB_BinaryStats_diff_longstretch0", "CO_FirstMin_ac", "PD_PeriodicityWang_th0_01", 
                      "CO_f1ecac", "CO_trev_1_num", "IN_AutoMutualInfoStats_40_gaussian_fmmi", "SP_Summaries_welch_rect_centroid", "DN_Spread_Std", "DN_Mean"))

# Create a bar plot
subset_std_700_plot <- ggplot(subset_std_700_long, aes(x = std_dev, y = names, fill = method)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(x = "Standard Deviation", y = "Feature", fill = "Method", title = "Standard Deviation by Method for DF700") +
  scale_fill_brewer(palette = "Paired") +
  theme_minimal() +
  theme(axis.title.y = element_blank(), axis.title.x = element_blank(), legend.position = "none")

## Filter Rcatch22 features based on standard deviation for DF800a
#===

# Filter dataframe
subset_std_800a_long <- combined_std_800a_long %>%
  filter(names %in% c("SB_BinaryStats_mean_longstretch1", "SB_BinaryStats_diff_longstretch0", "CO_FirstMin_ac", "PD_PeriodicityWang_th0_01", 
                      "CO_f1ecac", "CO_trev_1_num", "IN_AutoMutualInfoStats_40_gaussian_fmmi", "SP_Summaries_welch_rect_centroid", "DN_Spread_Std", "DN_Mean"))

# Create a bar plot
subset_std_800a_plot <- ggplot(subset_std_800a_long, aes(x = std_dev, y = names, fill = method)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(x = "Standard Deviation", y = "Feature", fill = "Method", title = "Standard Deviation by Method for DF800a") +
  scale_fill_brewer(palette = "Paired") +
  theme_minimal() +
  theme(axis.title.y = element_blank(), axis.text.y = element_blank(), axis.title.x = element_blank(), legend.position = "none")


## Filter Rcatch22 features based on standard deviation for DF800b
#===

# Filter dataframe
subset_std_800b_long <- combined_std_800b_long %>%
  filter(names %in% c("SB_BinaryStats_mean_longstretch1", "SB_BinaryStats_diff_longstretch0", "CO_FirstMin_ac", "PD_PeriodicityWang_th0_01", 
                      "CO_f1ecac", "CO_trev_1_num", "IN_AutoMutualInfoStats_40_gaussian_fmmi", "SP_Summaries_welch_rect_centroid", "DN_Spread_Std", "DN_Mean"))

# Create a bar plot
subset_std_800b_plot <- ggplot(subset_std_800b_long, aes(x = std_dev, y = names, fill = method)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(x = "Standard Deviation", y = "Feature", fill = "Method", title = "Standard Deviation by Method for DF800b") +
  scale_fill_brewer(palette = "Paired") +
  theme_minimal() +
  theme(axis.title.y = element_blank(), axis.text.y = element_blank(), axis.title.x = element_blank())

## Combine plots
#==

grid.arrange(patchworkGrob(subset_std_700_plot + subset_std_800a_plot + subset_std_800b_plot), left = "Feature", bottom = "Standard Deviation")

