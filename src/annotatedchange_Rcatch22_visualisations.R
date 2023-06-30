library(dplyr)

# Renaming 'values' column in each dataframe
names(features_sd100_1)[names(features_sd100_1) == "values"] <- "1"
names(features_sd100_2)[names(features_sd100_2) == "values"] <- "2"
names(features_sd100_5)[names(features_sd100_5) == "values"] <- "5"
names(features_sd100_10)[names(features_sd100_10) == "values"] <- "10"
names(features_sd100_20)[names(features_sd100_20) == "values"] <- "20"

# Joining all datasets by 'names' column
features_sd100 <- full_join(features_sd100_1, features_sd100_2, by = "names") %>%
  full_join(features_sd100_5, by = "names") %>%
  full_join(features_sd100_10, by = "names") %>%
  full_join(features_sd100_20, by = "names")

# Pivoting the data to long format
features_sd100_long <- features_sd100 %>%
  pivot_longer(cols = (2:6), names_to = "parameters", values_to = "value")

# Point plot
ggplot(features_sd100_long, aes(x = names, y = value, color = parameters)) + 
  geom_point() + 
  theme_minimal() + 
  labs(x = "Names", y = "Values", color = "Param") + 
  ggtitle("Comparative Visualization of Time Series Data") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
