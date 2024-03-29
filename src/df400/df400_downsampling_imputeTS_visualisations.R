# Expand the ts values into rows
expand_ts <- df %>% separate_rows(full_ts) # %>% select(param, dataset, full_ts) %>%

## Filter expand_ts for df400 by method and param
## ==

# Param 1: Simple Decimation, df400
sd_400_1 <- expand_ts %>% filter(method == "simpleDecimation",
                          dataset == "df400",
                          param == "1") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 1: Simple Decimation, df400 with imputeTS
sd400_1_plot <- ggplot_na_distribution(sd_400_1 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF400, Parameter 1")


# Param 2: Simple Decimation, df400
sd_400_2 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df400",
                            param == "2") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 2: Simple Decimation, df400 with imputeTS
sd400_2_plot <- ggplot_na_distribution(sd_400_2 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF400, Parameter 2")

# Param 5: Simple Decimation, df400
sd_400_5 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df400",
                            param == "5") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 5: Simple Decimation, df400 with imputeTS
sd400_5_plot <- ggplot_na_distribution(sd_400_5 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF400, Parameter 5")

# Param 10: Simple Decimation, df400
sd_400_10 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df400",
                            param == "10") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 10: Simple Decimation, df400 with imputeTS
sd400_10_plot <- ggplot_na_distribution(sd_400_10 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF400, Parameter 10")

# Param 20: Simple Decimation, df400
sd_400_20 <- expand_ts %>% filter(method == "simpleDecimation",
                                  dataset == "df400",
                                  param == "20") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 20: Simple Decimation, df400 with imputeTS
sd400_20_plot <- ggplot_na_distribution(sd_400_20 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF400, Parameter 20")

## ==

# Param 1: Percentage Change, df400
pc_400_1 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df400",
                                 param == "1") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 1: Percentage Change, df400 with imputeTS
pc400_1_plot <- ggplot_na_distribution(pc_400_1 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF400, Parameter 1")


# Param 2: Percentage Change, df400
pc_400_2 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df400",
                                 param == "2") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 2: Percentage Change, df400 with imputeTS
pc400_2_plot <- ggplot_na_distribution(pc_400_2 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF400, Parameter 2")

# Param 5: Percentage Change, df400
pc_400_5 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df400",
                                 param == "5") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 5: Percentage Change, df400 with imputeTS
pc400_5_plot <- ggplot_na_distribution(pc_400_5 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF400, Parameter 5")

# Param 10: Percentage Change, df400
pc_400_10 <- expand_ts %>% filter(method == "percentageChange",
                                  dataset == "df400",
                                  param == "10") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 10: Percentage Change, df400 with imputeTS
pc400_10_plot <- ggplot_na_distribution(pc_400_10 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF400, Parameter 10")

# Param 20: Percentage Change, df400
pc_400_20 <- expand_ts %>% filter(method == "percentageChange",
                                  dataset == "df400",
                                  param == "20") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 20: Percentage Change, df400 with imputeTS
pc400_20_plot <- ggplot_na_distribution(pc_400_20 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF400, Parameter 20")

## Combine all the plots into a neat visualisation
#==

sd400_1_plot + pc400_1_plot + sd400_2_plot + pc400_2_plot + sd400_5_plot + pc400_5_plot + sd400_10_plot + pc400_10_plot + sd400_20_plot + pc400_20_plot + plot_layout(ncol = 2)
