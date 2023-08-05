library(tidyverse)
library(ggplot2)

# Reshape catch22_original to long format
catch22_original_long <- catch22_original %>%
  pivot_longer(cols = -names, names_to = "dataset", values_to = "original_values")

# Reshape enriched_df to long format
enriched_df_long <- enriched_df %>%
  select(1, 2, 3, 4, 10:33) %>%
  pivot_longer(cols = -c(1, 2, 3, 4), names_to = "names", values_to = "enriched_values")

# Join catch22_original_long with enriched_df_long
joined_df <- left_join(catch22_original_long, enriched_df_long, by = c("dataset", "names"))

# Subtract enriched_df values from original_values
joined_df <- joined_df %>%
  mutate(difference = original_values - enriched_values)

# Standardize the 'difference' column
joined_df <- joined_df %>%
  mutate(scaled = scale(joined_df$difference))

# Identify the features most sensitive (highest standard deviation) to data loss
sensitivity <- joined_df %>%
  group_by(names) %>%
  summarise(sensitivity = sd(scaled, na.rm = TRUE)) %>%
  arrange(desc(sensitivity)) %>%
  rename(CombinedSensitivity = sensitivity)

# Identify the features most sensitive (highest standard deviation) to data loss for everyNth
sensitivity_nth <- joined_df %>%
  filter(method == "EveryNth") %>%
  group_by(names) %>%
  summarise(sensitivity = sd(scaled, na.rm = TRUE)) %>%
  arrange(desc(sensitivity)) %>%
  rename(everyNthSensitivity = sensitivity)

# Identify the features most sensitive (highest standard deviation) to data loss for everyNth
sensitivity_pc <- joined_df %>%
  filter(method == "PercentageChange") %>%
  group_by(names) %>%
  summarise(sensitivity = sd(scaled, na.rm = TRUE)) %>%
  arrange(desc(sensitivity)) %>%
  rename(PercentageChangeSensitivity = sensitivity)

# Join the sensitive datasets together
sensitivity_joined <- left_join(sensitivity_nth, sensitivity_pc, by = "names")
sensitivity_joined <- left_join(sensitivity_joined, sensitivity, by = "names")


# Get the top 10 most sensitive names
top_names <- head(sensitivity$names, 7)

# Filter the data to only include these names
filtered_df <- joined_df %>% 
  filter(names %in% top_names)

