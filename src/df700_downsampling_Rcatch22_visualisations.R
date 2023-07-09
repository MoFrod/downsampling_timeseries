library(dplyr)

## Simple Decimation df700
#==

# Renaming 'values' column in each dataframe
names(features_sd700_1)[names(features_sd700_1) == "values"] <- "1"
names(features_sd700_2)[names(features_sd700_2) == "values"] <- "2"
names(features_sd700_5)[names(features_sd700_5) == "values"] <- "5"
names(features_sd700_10)[names(features_sd700_10) == "values"] <- "10"
names(features_sd700_20)[names(features_sd700_20) == "values"] <- "20"

# Joining all datasets by 'names' column
features_sd700 <- full_join(features_sd700_1, features_sd700_2, by = "names") %>%
  full_join(features_sd700_5, by = "names") %>%
  full_join(features_sd700_10, by = "names") %>%
  full_join(features_sd700_20, by = "names")

# normalize columns 1, 2, 5, 10, 20
cols_to_normalize <- c('1', '2', '5', '10', '20')
features_sd700[cols_to_normalize] <- scale(features_sd700[cols_to_normalize])

# Pivoting the data to long format
features_sd700_long <- features_sd700 %>%
  pivot_longer(cols = (2:6), names_to = "parameters", values_to = "value")

# Point plot
Rcatch22_plot_sd700 <- ggplot(features_sd700_long, aes(y = names, x = value, color = as.numeric(parameters))) + 
  geom_point() + 
  theme_minimal() + 
  labs(y = "Names", x = "Values", color = "Param") + 
  ggtitle("Comparative Visualization of Simple Decimation for DF700") +
  theme(axis.title.y = element_blank(), axis.title.x = element_blank())

## Percentage Change df700
#==

# Renaming 'values' column in each dataframe
names(features_pc700_1)[names(features_pc700_1) == "values"] <- "1"
names(features_pc700_2)[names(features_pc700_2) == "values"] <- "2"
names(features_pc700_5)[names(features_pc700_5) == "values"] <- "5"
names(features_pc700_10)[names(features_pc700_10) == "values"] <- "10"
names(features_pc700_20)[names(features_pc700_20) == "values"] <- "20"

# Joining all datasets by 'names' column
features_pc700 <- full_join(features_pc700_1, features_pc700_2, by = "names") %>%
  full_join(features_pc700_5, by = "names") %>%
  full_join(features_pc700_10, by = "names") %>%
  full_join(features_pc700_20, by = "names")

# normalize columns 1, 2, 5, 10, 20
cols_to_normalize <- c('1', '2', '5', '10', '20')
features_pc700[cols_to_normalize] <- scale(features_sd700[cols_to_normalize])

# Pivoting the data to long format
features_pc700_long <- features_pc700 %>%
  pivot_longer(cols = (2:6), names_to = "parameters", values_to = "value")

# Point plot
Rcatch22_plot_pc700 <- ggplot(features_pc700_long, aes(y = names, x = value, color = as.numeric(parameters))) + 
  geom_point() + 
  theme_minimal() + 
  labs(y = "Names", x = "Values", color = "Param") + 
  ggtitle("Comparative Visualization of Percentage Change for DF700") +
  theme(axis.title.y = element_blank(), axis.title.x = element_blank())

## Combine plots
#==


grid.arrange(patchworkGrob(Rcatch22_plot_sd700 + Rcatch22_plot_pc700), left = "Names", bottom = "Values")

