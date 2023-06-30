library(dplyr)

## Simple Decimation df400
#==

# Renaming 'values' column in each dataframe
names(features_sd400_1)[names(features_sd400_1) == "values"] <- "1"
names(features_sd400_2)[names(features_sd400_2) == "values"] <- "2"
names(features_sd400_5)[names(features_sd400_5) == "values"] <- "5"
names(features_sd400_10)[names(features_sd400_10) == "values"] <- "10"
names(features_sd400_20)[names(features_sd400_20) == "values"] <- "20"

# Joining all datasets by 'names' column
features_sd400 <- full_join(features_sd400_1, features_sd400_2, by = "names") %>%
  full_join(features_sd400_5, by = "names") %>%
  full_join(features_sd400_10, by = "names") %>%
  full_join(features_sd400_20, by = "names")

# normalize columns 1, 2, 5, 10, 20
cols_to_normalize <- c('1', '2', '5', '10', '20')
features_sd400[cols_to_normalize] <- scale(features_sd400[cols_to_normalize])

# Pivoting the data to long format
features_sd400_long <- features_sd400 %>%
  pivot_longer(cols = (2:6), names_to = "parameters", values_to = "value")

# Point plot
ggplot(features_sd400_long, aes(x = names, y = value, color = as.numeric(parameters))) + 
  geom_point() + 
  theme_minimal() + 
  labs(x = "Names", y = "Values", color = "Param") + 
  ggtitle("Comparative Visualization of Time Series Data") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))

## Percentage Change df400
#==

# Renaming 'values' column in each dataframe
names(features_pc400_1)[names(features_pc400_1) == "values"] <- "1"
names(features_pc400_2)[names(features_pc400_2) == "values"] <- "2"
names(features_pc400_5)[names(features_pc400_5) == "values"] <- "5"
names(features_pc400_10)[names(features_pc400_10) == "values"] <- "10"
names(features_pc400_20)[names(features_pc400_20) == "values"] <- "20"

# Joining all datasets by 'names' column
features_pc400 <- full_join(features_pc400_1, features_pc400_2, by = "names") %>%
  full_join(features_pc400_5, by = "names") %>%
  full_join(features_pc400_10, by = "names") %>%
  full_join(features_pc400_20, by = "names")

# normalize columns 1, 2, 5, 10, 20
cols_to_normalize <- c('1', '2', '5', '10', '20')
features_pc400[cols_to_normalize] <- scale(features_pc400[cols_to_normalize])

# Pivoting the data to long format
features_pc400_long <- features_pc400 %>%
  pivot_longer(cols = (2:6), names_to = "parameters", values_to = "value")

# Point plot
ggplot(features_pc400_long, aes(x = names, y = value, color = as.numeric(parameters))) + 
  geom_point() + 
  theme_minimal() + 
  labs(x = "Names", y = "Values", color = "Param") + 
  ggtitle("Comparative Visualization of Time Series Data") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
