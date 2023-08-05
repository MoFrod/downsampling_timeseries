library(dplyr)

## Simple Decimation df800a
#==

# Renaming 'values' column in each dataframe
names(features_sd800a_1)[names(features_sd800a_1) == "values"] <- "1"
names(features_sd800a_2)[names(features_sd800a_2) == "values"] <- "2"
names(features_sd800a_5)[names(features_sd800a_5) == "values"] <- "5"
names(features_sd800a_10)[names(features_sd800a_10) == "values"] <- "10"
names(features_sd800a_20)[names(features_sd800a_20) == "values"] <- "20"

# Joining all datasets by 'names' column
features_sd800a <- full_join(features_sd800a_1, features_sd800a_2, by = "names") %>%
  full_join(features_sd800a_5, by = "names") %>%
  full_join(features_sd800a_10, by = "names") %>%
  full_join(features_sd800a_20, by = "names")

# normalize columns 1, 2, 5, 10, 20
cols_to_normalize <- c('1', '2', '5', '10', '20')
features_sd800a[cols_to_normalize] <- scale(features_sd800a[cols_to_normalize])

# Pivoting the data to long format
features_sd800a_long <- features_sd800a %>%
  pivot_longer(cols = (2:6), names_to = "parameters", values_to = "value")

# Point plot
Rcatch22_plot_sd800a <- ggplot(features_sd800a_long, aes(y = names, x = value, color = as.numeric(parameters))) + 
  geom_point() + 
  theme_minimal() + 
  labs(y = "Names", x = "Values", color = "Param") + 
  ggtitle("Comparative Visualization of Simple Decimation for DF800a") +
  theme(axis.title.y = element_blank(), axis.title.x = element_blank())

## Percentage Change df800a
#==

# Renaming 'values' column in each dataframe
names(features_pc800a_1)[names(features_pc800a_1) == "values"] <- "1"
names(features_pc800a_2)[names(features_pc800a_2) == "values"] <- "2"
names(features_pc800a_5)[names(features_pc800a_5) == "values"] <- "5"
names(features_pc800a_10)[names(features_pc800a_10) == "values"] <- "10"
names(features_pc800a_20)[names(features_pc800a_20) == "values"] <- "20"

# Joining all datasets by 'names' column
features_pc800a <- full_join(features_pc800a_1, features_pc800a_2, by = "names") %>%
  full_join(features_pc800a_5, by = "names") %>%
  full_join(features_pc800a_10, by = "names") %>%
  full_join(features_pc800a_20, by = "names")

# normalize columns 1, 2, 5, 10, 20
cols_to_normalize <- c('1', '2', '5', '10', '20')
features_pc800a[cols_to_normalize] <- scale(features_sd800a[cols_to_normalize])

# Pivoting the data to long format
features_pc800a_long <- features_pc800a %>%
  pivot_longer(cols = (2:6), names_to = "parameters", values_to = "value")

# Point plot
Rcatch22_plot_pc800a <- ggplot(features_pc800a_long, aes(y = names, x = value, color = as.numeric(parameters))) + 
  geom_point() + 
  theme_minimal() + 
  labs(y = "Names", x = "Values", color = "Param") + 
  ggtitle("Comparative Visualization of Percentage Change for DF800a") +
  theme(axis.title.y = element_blank(), axis.title.x = element_blank())

## Combine plots
#==


grid.arrange(patchworkGrob(Rcatch22_plot_sd800a + Rcatch22_plot_pc800a), left = "Names", bottom = "Values")

