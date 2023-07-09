## Calculate the standard deviation across the parameters for each Rcatch22 feature
#==

# SD800b
features_sd800b_std <- features_sd800b_long %>%
  group_by(names) %>%
  summarise(SimpleDecimation = sd(value, na.rm = TRUE)) %>%
  arrange(desc(SimpleDecimation))

# PC800b
features_pc800b_std <- features_pc800b_long %>%
  group_by(names) %>%
  summarise(PercentageChange = sd(value, na.rm = TRUE)) %>%
  arrange(desc(PercentageChange))

# Interpolated SD800b
features_linear_impute_sd800b_std <- features_linear_impute_sd800b_long %>%
  group_by(names) %>%
  summarise(Interpolated_SimpleDecimation = sd(value, na.rm = TRUE)) %>%
  arrange(desc(Interpolated_SimpleDecimation))

# Interpolated PC800b
features_linear_impute_pc800b_std <- features_linear_impute_pc800b_long %>%
  group_by(names) %>%
  summarise(Interpolated_PercentageChange = sd(value, na.rm = TRUE)) %>%
  arrange(desc(Interpolated_PercentageChange))

# Combine dataframes
combined_std_800b <- features_sd800b_std %>%
  full_join(features_pc800b_std, by = "names") %>%
  full_join(features_linear_impute_sd800b_std, by = "names") %>%
  full_join(features_linear_impute_pc800b_std, by = "names")

# Transform the data to a longer format
combined_std_800b_long <- combined_std_800b %>%
  pivot_longer(cols = c(SimpleDecimation, PercentageChange, Interpolated_SimpleDecimation, Interpolated_PercentageChange), 
               names_to = "method", 
               values_to = "std_dev")

# Create a bar plot
ggplot(combined_std_800b_long, aes(x = std_dev, y = names, fill = method)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(x = "Standard Deviation", y = "Feature", fill = "Method", title = "Standard Deviation of Rcatch22 Feature by Method for DF800b") +
  scale_fill_brewer(palette = "Paired") +
  theme_minimal()

