# Expand the ts values into rows
expand_ts <- df %>% separate_rows(full_ts) # %>% select(param, dataset, full_ts) %>%

## Filter expand_ts for df500 by method and param
## ==

# Param 1: Simple Decimation, df500
sd_500_1 <- expand_ts %>% filter(method == "simpleDecimation",
                          dataset == "df500",
                          param == "1") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 1: Simple Decimation, df500 with imputeTS
sd500_1_plot <- ggplot_na_distribution(sd_500_1 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF500, Parameter 1")


# Param 2: Simple Decimation, df500
sd_500_2 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df500",
                            param == "2") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 2: Simple Decimation, df500 with imputeTS
sd500_2_plot <- ggplot_na_distribution(sd_500_2 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF500, Parameter 2")

# Param 5: Simple Decimation, df500
sd_500_5 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df500",
                            param == "5") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 5: Simple Decimation, df500 with imputeTS
sd500_5_plot <- ggplot_na_distribution(sd_500_5 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF500, Parameter 5")

# Param 10: Simple Decimation, df500
sd_500_10 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df500",
                            param == "10") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 10: Simple Decimation, df500 with imputeTS
sd500_10_plot <- ggplot_na_distribution(sd_500_10 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF500, Parameter 10")

# Param 20: Simple Decimation, df500
sd_500_20 <- expand_ts %>% filter(method == "simpleDecimation",
                                  dataset == "df500",
                                  param == "20") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 20: Simple Decimation, df500 with imputeTS
sd500_20_plot <- ggplot_na_distribution(sd_500_20 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF500, Parameter 20")

## ==

# Param 1: Percentage Change, df500
pc_500_1 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df500",
                                 param == "1") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 1: Percentage Change, df500 with imputeTS
pc500_1_plot <- ggplot_na_distribution(pc_500_1 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF500, Parameter 1")


# Param 2: Percentage Change, df500
pc_500_2 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df500",
                                 param == "2") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 2: Percentage Change, df500 with imputeTS
pc500_2_plot <- ggplot_na_distribution(pc_500_2 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF500, Parameter 2")

# Param 5: Percentage Change, df500
pc_500_5 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df500",
                                 param == "5") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 5: Percentage Change, df500 with imputeTS
pc500_5_plot <- ggplot_na_distribution(pc_500_5 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF500, Parameter 5")

# Param 10: Percentage Change, df500
pc_500_10 <- expand_ts %>% filter(method == "percentageChange",
                                  dataset == "df500",
                                  param == "10") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 10: Percentage Change, df500 with imputeTS
pc500_10_plot <- ggplot_na_distribution(pc_500_10 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF500, Parameter 10")

# Param 20: Percentage Change, df500
pc_500_20 <- expand_ts %>% filter(method == "percentageChange",
                                  dataset == "df500",
                                  param == "20") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 20: Percentage Change, df500 with imputeTS
pc500_20_plot <- ggplot_na_distribution(pc_500_20 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF500, Parameter 20")

## Combine all the plots into a neat visualisation
#==

sd500_1_plot + pc500_1_plot + sd500_2_plot + pc500_2_plot + sd500_5_plot + pc500_5_plot + sd500_10_plot + pc500_10_plot + sd500_20_plot + pc500_20_plot + plot_layout(ncol = 2)
