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
  scale_fill_gradient2(low = "#084594", high = "#eff3ff", mid = "#c6dbef",
                       midpoint = 0, limits = range(joined_df$scaled)) +
  scale_x_reverse() +
  theme_minimal() +
  labs(x = "Volume", y = "Feature", fill = "Scaled Difference", title = "Scaled Difference of Catch22 Feature by Data Volume") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), legend.position = "bottom") +
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

# Create the heatmap - Doesn't look fabulous
ggplot(filtered_df, aes(x = as.numeric(vol), y = names, fill = scaled)) +
  geom_tile() +
  scale_fill_gradient2(low = "#084594", high = "#eff3ff", mid = "#c6dbef",
                       midpoint = 0, limits = range(joined_df$scaled)) +
  scale_x_reverse() +
  theme_minimal() +
  labs(x = "Volume", y = "Features", fill = "Scaled Difference", title = "Scaled Difference of Most Sensitive Catch22 Features by Data Volume") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), legend.position = "bottom") +
  facet_wrap(~ method, ncol = 1)


# Create the difference line graph for CO_FirstMin_ac
ggplot(filtered_df %>%
         filter(names == "CO_FirstMin_ac"), 
       aes(x = as.numeric(vol), y = difference, color = method)) +
  scale_color_brewer(palette = "Paired") +
  geom_line(linewidth = 1) +
  scale_x_reverse() +
  theme_minimal() +
  labs(x = "Volume", y = "Difference", color = "Method") +
  facet_wrap(~ dataset, ncol = 3)

# Create the scaled difference line graph for CO_FirstMin_ac
ggplot(filtered_df %>%
         filter(names == "CO_FirstMin_ac"), 
       aes(x = as.numeric(vol), y = scaled, color = method)) +
  scale_color_brewer(palette = "Paired") +
  geom_line(linewidth = 1) +
  scale_x_reverse() +
  theme_minimal() +
  labs(x = "Volume", y = "Scaled Difference", color = "Method") +
  facet_wrap(~ dataset, ncol = 3)

# Create the line graph for CO_f1ecac
ggplot(filtered_df %>%
         filter(names == "CO_f1ecac"), 
       aes(x = as.numeric(vol), y = scaled, color = method)) +
  scale_color_brewer(palette = "Paired") +
  geom_line(linewidth = 1) +
  scale_x_reverse() +
  theme_minimal() +
  labs(x = "Volume", y = "Scaled Difference", color = "Method") +
  facet_wrap(~ dataset, ncol = 3)

