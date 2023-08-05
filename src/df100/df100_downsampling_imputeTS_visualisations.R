# Expand the ts values into rows
expand_ts <- df %>% separate_rows(full_ts) # %>% select(param, dataset, full_ts) %>%

## Filter expand_ts for df100 by method and param
## ==

# Param 1: Simple Decimation, df100
sd_100_1 <- expand_ts %>% filter(method == "simpleDecimation",
                          dataset == "df100",
                          param == "1") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 1: Simple Decimation, df100 with imputeTS
sd100_1_plot <- ggplot_na_distribution(sd_100_1 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF100, Parameter 1")


# Param 2: Simple Decimation, df100
sd_100_2 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df100",
                            param == "2") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 2: Simple Decimation, df100 with imputeTS
sd100_2_plot <- ggplot_na_distribution(sd_100_2 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF100, Parameter 2")

# Param 5: Simple Decimation, df100
sd_100_5 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df100",
                            param == "5") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 5: Simple Decimation, df100 with imputeTS
sd100_5_plot <- ggplot_na_distribution(sd_100_5 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF100, Parameter 5")

# Param 10: Simple Decimation, df100
sd_100_10 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df100",
                            param == "10") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 10: Simple Decimation, df100 with imputeTS
sd100_10_plot <- ggplot_na_distribution(sd_100_10 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF100, Parameter 10")

# Param 20: Simple Decimation, df100
sd_100_20 <- expand_ts %>% filter(method == "simpleDecimation",
                                  dataset == "df100",
                                  param == "20") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 20: Simple Decimation, df100 with imputeTS
sd100_20_plot <- ggplot_na_distribution(sd_100_20 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF100, Parameter 20")

## ==

# Param 1: Percentage Change, df100
pc_100_1 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df100",
                                 param == "1") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 1: Percentage Change, df100 with imputeTS
pc100_1_plot <- ggplot_na_distribution(pc_100_1 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF100, Parameter 1")


# Param 2: Percentage Change, df100
pc_100_2 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df100",
                                 param == "2") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 2: Percentage Change, df100 with imputeTS
pc100_2_plot <- ggplot_na_distribution(pc_100_2 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF100, Parameter 2")

# Param 5: Percentage Change, df100
pc_100_5 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df100",
                                 param == "5") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 5: Percentage Change, df100 with imputeTS
pc100_5_plot <- ggplot_na_distribution(pc_100_5 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF100, Parameter 5")

# Param 10: Percentage Change, df100
pc_100_10 <- expand_ts %>% filter(method == "percentageChange",
                                  dataset == "df100",
                                  param == "10") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 10: Percentage Change, df100 with imputeTS
pc100_10_plot <- ggplot_na_distribution(pc_100_10 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF100, Parameter 10")

# Param 20: Percentage Change, df100
pc_100_20 <- expand_ts %>% filter(method == "percentageChange",
                                  dataset == "df100",
                                  param == "20") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 20: Percentage Change, df100 with imputeTS
pc100_20_plot <- ggplot_na_distribution(pc_100_20 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF100, Parameter 20")

## Combine all the plots into a neat visualisation
#==

sd100_1_plot + pc100_1_plot + sd100_2_plot + pc100_2_plot + sd100_5_plot + pc100_5_plot + sd100_10_plot + pc100_10_plot + sd100_20_plot + pc100_20_plot + plot_layout(ncol = 2)
