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

all_sensitivity<- left_join(sensitivity_joined, sensitivity, by = "names") %>%
  arrange(desc(CombinedSensitivity)) %>%
  head(7)

# Get the top 10 most sensitive names
top_ten <- head(sensitivity$names, 10)

# Filter the sensitivity data to only include these names
subset_sensitivity_joined <- sensitivity_joined %>% 
  filter(names %in% top_ten)

# Filter all the data to only include these names
filtered_df <- joined_df %>% 
  filter(names %in% top_ten)

## Further investigation to sensitivity
#=
# Identify sensitivity across datasets
sensitivity_ts <- joined_df %>%
  group_by(names, dataset, method) %>%
  summarise(sensitivity = sd(scaled, na.rm = TRUE)) 

# Identify sensitivity across datasets for EveryNth
sensitivity_ts_Nth <- sensitivity_ts %>%
  filter(method == "EveryNth", names %in% top_ten)

# Identify sensitivity across datasets for PercentageChange
sensitivity_ts_PC <- sensitivity_ts %>%
  filter(method == "PercentageChange", names %in% top_ten)


