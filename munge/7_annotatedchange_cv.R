library(tidyverse)
library(ggplot2)


# Function to calculate CV
calculate_cv <- function(x) {
  (sd(abs(x), na.rm = TRUE) / mean(abs(x), na.rm = TRUE))
}

# Identify the features most sensitive (highest CV) to data loss
cv_sensitivity <- joined_df %>%
  group_by(names) %>%
  summarise(sensitivity = calculate_cv(scaled)) %>%
  arrange(desc(sensitivity)) %>%
  rename(CombinedSensitivity = sensitivity)

# Repeat for other methods
cv_sensitivity_nth <- joined_df %>%
  filter(method == "EveryNth") %>%
  group_by(names) %>%
  summarise(sensitivity = calculate_cv(scaled)) %>%
  arrange(desc(sensitivity)) %>%
  rename(everyNthSensitivity = sensitivity)

cv_sensitivity_pc <- joined_df %>%
  filter(method == "PercentageChange") %>%
  group_by(names) %>%
  summarise(sensitivity = calculate_cv(scaled)) %>%
  arrange(desc(sensitivity)) %>%
  rename(PercentageChangeSensitivity = sensitivity)

# Join the sensitive datasets together
cv_sensitivity_joined <- left_join(cv_sensitivity_nth, cv_sensitivity_pc, by = "names")

cv_all_sensitivity <- left_join(cv_sensitivity_joined, cv_sensitivity, by = "names") %>%
  arrange(desc(CombinedSensitivity))

# Get the top 10 most sensitive names
top_nine <- head(cv_sensitivity$names, 9)


# Filter the sensitivity data to only include these names
cv_subset_sensitivity_joined <- cv_all_sensitivity %>% 
  filter(names %in% top_nine)

# Get the top 7 most sensitive names
cv_top_seven <- head(cv_sensitivity$names,7)

# Get the top 6 most sensitive names
cv_top_six <- head(cv_sensitivity$names, 6)

# Filter all the data to only include top 10 names
cv_filtered_df <- joined_df %>% 
  filter(names %in% top_nine)

# Filter all the data to only include top 6 names
cv_subset_filtered_df <- joined_df %>% 
  filter(names %in% cv_top_six)

## Further investigation to sensitivity
#=
# Identify sensitivity across datasets
cv_sensitivity_ts <- joined_df %>%
  group_by(names, dataset, method) %>%
  summarise(sensitivity = (var(scaled, na.rm = TRUE)/mean(scaled, na.rm = TRUE))) 

# Identify sensitivity across datasets for EveryNth
cv_sensitivity_ts_Nth <- cv_sensitivity_ts %>%
  filter(method == "EveryNth", names %in% top_nine)

# Identify sensitivity across datasets for PercentageChange
cv_sensitivity_ts_PC <- cv_sensitivity_ts %>%
  filter(method == "PercentageChange", names %in% top_nine)


