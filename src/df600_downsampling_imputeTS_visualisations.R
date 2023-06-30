# Expand the ts values into rows
expand_ts <- df %>% separate_rows(full_ts) # %>% select(param, dataset, full_ts) %>%

## Filter expand_ts for df600 by method and param
## ==

# Param 1: Simple Decimation, df600
sd_600_1 <- expand_ts %>% filter(method == "simpleDecimation",
                          dataset == "df600",
                          param == "1") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 1: Simple Decimation, df600 with imputeTS
sd600_1_plot <- ggplot_na_distribution(sd_600_1 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF600, Parameter 1")


# Param 2: Simple Decimation, df600
sd_600_2 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df600",
                            param == "2") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 2: Simple Decimation, df600 with imputeTS
sd600_2_plot <- ggplot_na_distribution(sd_600_2 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF600, Parameter 2")

# Param 5: Simple Decimation, df600
sd_600_5 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df600",
                            param == "5") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 5: Simple Decimation, df600 with imputeTS
sd600_5_plot <- ggplot_na_distribution(sd_600_5 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF600, Parameter 5")

# Param 10: Simple Decimation, df600
sd_600_10 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df600",
                            param == "10") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 10: Simple Decimation, df600 with imputeTS
sd600_10_plot <- ggplot_na_distribution(sd_600_10 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF600, Parameter 10")

# Param 20: Simple Decimation, df600
sd_600_20 <- expand_ts %>% filter(method == "simpleDecimation",
                                  dataset == "df600",
                                  param == "20") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 20: Simple Decimation, df600 with imputeTS
sd600_20_plot <- ggplot_na_distribution(sd_600_20 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF600, Parameter 20")

## ==

# Param 1: Percentage Change, df600
pc_600_1 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df600",
                                 param == "1") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 1: Percentage Change, df600 with imputeTS
pc600_1_plot <- ggplot_na_distribution(pc_600_1 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF600, Parameter 1")


# Param 2: Percentage Change, df600
pc_600_2 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df600",
                                 param == "2") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 2: Percentage Change, df600 with imputeTS
pc600_2_plot <- ggplot_na_distribution(pc_600_2 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF600, Parameter 2")

# Param 5: Percentage Change, df600
pc_600_5 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df600",
                                 param == "5") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 5: Percentage Change, df600 with imputeTS
pc600_5_plot <- ggplot_na_distribution(pc_600_5 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF600, Parameter 5")

# Param 10: Percentage Change, df600
pc_600_10 <- expand_ts %>% filter(method == "percentageChange",
                                  dataset == "df600",
                                  param == "10") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 10: Percentage Change, df600 with imputeTS
pc600_10_plot <- ggplot_na_distribution(pc_600_10 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF600, Parameter 10")

# Param 20: Percentage Change, df600
pc_600_20 <- expand_ts %>% filter(method == "percentageChange",
                                  dataset == "df600",
                                  param == "20") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 20: Percentage Change, df600 with imputeTS
pc600_20_plot <- ggplot_na_distribution(pc_600_20 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF600, Parameter 20")

## Combine all the plots into a neat visualisation
#==

sd600_1_plot + pc600_1_plot + sd600_2_plot + pc600_2_plot + sd600_5_plot + pc600_5_plot + sd600_10_plot + pc600_10_plot + sd600_20_plot + pc600_20_plot + plot_layout(ncol = 2)
