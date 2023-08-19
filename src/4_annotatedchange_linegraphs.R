# Specify width and heights for plot outputting.
F1_WIDTH = 4.1
F1_HEIGHT = 3

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

#Use ggsave to save out the figure as a file.
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



# Create the difference line graph for df100
ggplot(subset_filtered_df %>%
         filter(dataset == "df100"),
       aes(x = as.numeric(vol), y = scaled, color = method)) +
  scale_color_brewer(palette = "Paired") +
  geom_line(linewidth = 1) +
  scale_x_reverse() +
  theme_minimal() +
  theme(plot.title = element_text(hjust = -0.15), legend.position = "top", legend.justification = c(-0.14, 1)) +
  labs(x = "Volume of Data", y = "Scaled Difference", color = "Method", title = "Variation of Catch22 Features") +
  facet_wrap(~names, ncol = 3)
