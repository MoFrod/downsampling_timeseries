# Expand the ts values into rows
expand_ts <- df %>% separate_rows(full_ts) # %>% select(param, dataset, full_ts) %>%

## Filter expand_ts for df700 by method and param
## ==

# Param 1: Simple Decimation, df700
sd_700_1 <- expand_ts %>% filter(method == "simpleDecimation",
                          dataset == "df700",
                          param == "1") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 1: Simple Decimation, df700 with imputeTS
sd700_1_plot <- ggplot_na_distribution(sd_700_1 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF700, Parameter 1")


# Param 2: Simple Decimation, df700
sd_700_2 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df700",
                            param == "2") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 2: Simple Decimation, df700 with imputeTS
sd700_2_plot <- ggplot_na_distribution(sd_700_2 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF700, Parameter 2")

# Param 5: Simple Decimation, df700
sd_700_5 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df700",
                            param == "5") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 5: Simple Decimation, df700 with imputeTS
sd700_5_plot <- ggplot_na_distribution(sd_700_5 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF700, Parameter 5")

# Param 10: Simple Decimation, df700
sd_700_10 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "df700",
                            param == "10") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 10: Simple Decimation, df700 with imputeTS
sd700_10_plot <- ggplot_na_distribution(sd_700_10 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF700, Parameter 10")

# Param 20: Simple Decimation, df700
sd_700_20 <- expand_ts %>% filter(method == "simpleDecimation",
                                  dataset == "df700",
                                  param == "20") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 20: Simple Decimation, df700 with imputeTS
sd700_20_plot <- ggplot_na_distribution(sd_700_20 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DF700, Parameter 20")

## ==

# Param 1: Percentage Change, df700
pc_700_1 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df700",
                                 param == "1") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 1: Percentage Change, df700 with imputeTS
pc700_1_plot <- ggplot_na_distribution(pc_700_1 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF700, Parameter 1")


# Param 2: Percentage Change, df700
pc_700_2 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df700",
                                 param == "2") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 2: Percentage Change, df700 with imputeTS
pc700_2_plot <- ggplot_na_distribution(pc_700_2 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF700, Parameter 2")

# Param 5: Percentage Change, df700
pc_700_5 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "df700",
                                 param == "5") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 5: Percentage Change, df700 with imputeTS
pc700_5_plot <- ggplot_na_distribution(pc_700_5 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF700, Parameter 5")

# Param 10: Percentage Change, df700
pc_700_10 <- expand_ts %>% filter(method == "percentageChange",
                                  dataset == "df700",
                                  param == "10") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 10: Percentage Change, df700 with imputeTS
pc700_10_plot <- ggplot_na_distribution(pc_700_10 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF700, Parameter 10")

# Param 20: Percentage Change, df700
pc_700_20 <- expand_ts %>% filter(method == "percentageChange",
                                  dataset == "df700",
                                  param == "20") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 20: Percentage Change, df700 with imputeTS
pc700_20_plot <- ggplot_na_distribution(pc_700_20 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DF700, Parameter 20")

## Combine all the plots into a neat visualisation
#==

sd700_1_plot + pc700_1_plot + sd700_2_plot + pc700_2_plot + sd700_5_plot + pc700_5_plot + sd700_10_plot + pc700_10_plot + sd700_20_plot + pc700_20_plot + plot_layout(ncol = 2)
