library(dplyr)

## Simple Decimation df800b
#==

# Renaming 'values' column in each dataframe
names(features_sd800b_1)[names(features_sd800b_1) == "values"] <- "1"
names(features_sd800b_2)[names(features_sd800b_2) == "values"] <- "2"
names(features_sd800b_5)[names(features_sd800b_5) == "values"] <- "5"
names(features_sd800b_10)[names(features_sd800b_10) == "values"] <- "10"
names(features_sd800b_20)[names(features_sd800b_20) == "values"] <- "20"

# Joining all datasets by 'names' column
features_sd800b <- full_join(features_sd800b_1, features_sd800b_2, by = "names") %>%
  full_join(features_sd800b_5, by = "names") %>%
  full_join(features_sd800b_10, by = "names") %>%
  full_join(features_sd800b_20, by = "names")

# normalize columns 1, 2, 5, 10, 20
cols_to_normalize <- c('1', '2', '5', '10', '20')
features_sd800b[cols_to_normalize] <- scale(features_sd800b[cols_to_normalize])

# Pivoting the data to long format
features_sd800b_long <- features_sd800b %>%
  pivot_longer(cols = (2:6), names_to = "parameters", values_to = "value")

# Point plot
ggplot(features_sd800b_long, aes(x = names, y = value, color = as.numeric(parameters))) + 
  geom_point() + 
  theme_minimal() + 
  labs(x = "Names", y = "Values", color = "Param") + 
  ggtitle("Comparative Visualization of Time Series Data") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))

## Percentage Change df800b
#==

# Renaming 'values' column in each dataframe
names(features_pc800b_1)[names(features_pc800b_1) == "values"] <- "1"
names(features_pc800b_2)[names(features_pc800b_2) == "values"] <- "2"
names(features_pc800b_5)[names(features_pc800b_5) == "values"] <- "5"
names(features_pc800b_10)[names(features_pc800b_10) == "values"] <- "10"
names(features_pc800b_20)[names(features_pc800b_20) == "values"] <- "20"

# Joining all datasets by 'names' column
features_pc800b <- full_join(features_pc800b_1, features_pc800b_2, by = "names") %>%
  full_join(features_pc800b_5, by = "names") %>%
  full_join(features_pc800b_10, by = "names") %>%
  full_join(features_pc800b_20, by = "names")

# normalize columns 1, 2, 5, 10, 20
cols_to_normalize <- c('1', '2', '5', '10', '20')
features_pc800b[cols_to_normalize] <- scale(features_pc800b[cols_to_normalize])

# Pivoting the data to long format
features_pc800b_long <- features_pc800b %>%
  pivot_longer(cols = (2:6), names_to = "parameters", values_to = "value")

# Point plot
ggplot(features_pc800b_long, aes(x = names, y = value, color = as.numeric(parameters))) + 
  geom_point() + 
  theme_minimal() + 
  labs(x = "Names", y = "Values", color = "Param") + 
  ggtitle("Comparative Visualization of Time Series Data") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
