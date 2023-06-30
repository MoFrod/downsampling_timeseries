library(dplyr)

## Simple Decimation df300
#==

# Renaming 'values' column in each dataframe
names(features_sd300_1)[names(features_sd300_1) == "values"] <- "1"
names(features_sd300_2)[names(features_sd300_2) == "values"] <- "2"
names(features_sd300_5)[names(features_sd300_5) == "values"] <- "5"
names(features_sd300_10)[names(features_sd300_10) == "values"] <- "10"
names(features_sd300_20)[names(features_sd300_20) == "values"] <- "20"

# Joining all datasets by 'names' column
features_sd300 <- full_join(features_sd300_1, features_sd300_2, by = "names") %>%
  full_join(features_sd300_5, by = "names") %>%
  full_join(features_sd300_10, by = "names") %>%
  full_join(features_sd300_20, by = "names")

# normalize columns 1, 2, 5, 10, 20
cols_to_normalize <- c('1', '2', '5', '10', '20')
features_sd300[cols_to_normalize] <- scale(features_sd300[cols_to_normalize])

# Pivoting the data to long format
features_sd300_long <- features_sd300 %>%
  pivot_longer(cols = (2:6), names_to = "parameters", values_to = "value")

# Point plot
ggplot(features_sd300_long, aes(x = names, y = value, color = as.numeric(parameters))) + 
  geom_point() + 
  theme_minimal() + 
  labs(x = "Names", y = "Values", color = "Param") + 
  ggtitle("Comparative Visualization of Time Series Data") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))

## Percentage Change df300
#==

# Renaming 'values' column in each dataframe
names(features_pc300_1)[names(features_pc300_1) == "values"] <- "1"
names(features_pc300_2)[names(features_pc300_2) == "values"] <- "2"
names(features_pc300_5)[names(features_pc300_5) == "values"] <- "5"
names(features_pc300_10)[names(features_pc300_10) == "values"] <- "10"
names(features_pc300_20)[names(features_pc300_20) == "values"] <- "20"

# Joining all datasets by 'names' column
features_pc300 <- full_join(features_pc300_1, features_pc300_2, by = "names") %>%
  full_join(features_pc300_5, by = "names") %>%
  full_join(features_pc300_10, by = "names") %>%
  full_join(features_pc300_20, by = "names")

# normalize columns 1, 2, 5, 10, 20
cols_to_normalize <- c('1', '2', '5', '10', '20')
features_pc300[cols_to_normalize] <- scale(features_pc300[cols_to_normalize])

# Pivoting the data to long format
features_pc300_long <- features_pc300 %>%
  pivot_longer(cols = (2:6), names_to = "parameters", values_to = "value")

# Point plot
ggplot(features_pc300_long, aes(x = names, y = value, color = as.numeric(parameters))) + 
  geom_point() + 
  theme_minimal() + 
  labs(x = "Names", y = "Values", color = "Param") + 
  ggtitle("Comparative Visualization of Time Series Data") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
