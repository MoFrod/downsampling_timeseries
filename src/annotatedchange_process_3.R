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


# Convert "names" to a factor
joined_df$names <- factor(joined_df$names, levels = unique(joined_df$names))

ggplot(joined_df, aes(x = as.numeric(vol), y = names, fill = scaled)) +
  geom_tile() +
  scale_fill_gradient2(low = "#998ec3", high = "#f1a340", mid = "#f7f7f7",
                       midpoint = 0, limits = range(joined_df$scaled)) +
  theme_minimal() +
  labs(x = "Volume", y = "Names", fill = "Scaled Difference") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  facet_wrap(~ method, nrow = 1)

# Identify the features most sensitive to data loss
sensitivity <- joined_df %>%
  group_by(names) %>%
  summarise(sensitivity = sd(scaled, na.rm = TRUE)) %>%
  arrange(desc(sensitivity))

# Get the top 10 most sensitive names
top_names <- head(sensitivity$names, 6)

# Filter the data to only include these names
filtered_df <- joined_df %>% 
  filter(names %in% top_names)

# Convert "names" to a factor
filtered_df$names <- factor(filtered_df$names, levels = top_names)

# Create the heatmap
ggplot(filtered_df, aes(x = as.numeric(vol), y = names, fill = scaled)) +
  geom_tile() +
  scale_fill_gradient2(low = "#998ec3", high = "#f1a340", mid = "#f7f7f7",
                       midpoint = 0, limits = range(joined_df$scaled)) +
  theme_minimal() +
  labs(x = "Volume", y = "Names", fill = "Scaled Difference") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  facet_wrap(~ method, ncol = 1)

# Convert "param" to a factor
filtered_df$param <- factor(filtered_df$param, levels = unique(joined_df$param))

# Create the heatmap
ggplot(filtered_df, aes(x = param, y = names, fill = scaled)) +
  geom_tile() +
  scale_fill_gradient2(low = "#998ec3", high = "#f1a340", mid = "#f7f7f7",
                       midpoint = 0, limits = range(joined_df$scaled)) +
  theme_minimal() +
  labs(x = "Parameter", y = "Names", fill = "Scaled Difference") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  facet_wrap(~ method, ncol = 1)
