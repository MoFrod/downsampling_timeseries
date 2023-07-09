# Expand the ts values into rows
expand_ts <- df %>% separate_rows(full_ts) # %>% select(param, dataset, full_ts) %>%

## Filter expand_ts for dfairgap by method and param
## ==

# Param 1: Simple Decimation, dfairgap
sd_airgap_1 <- expand_ts %>% filter(method == "simpleDecimation",
                          dataset == "dfairgap",
                          param == "1") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 1: Simple Decimation, dfairgap with imputeTS
sdairgap_1_plot <- ggplot_na_distribution(sd_airgap_1 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DFairgap, Parameter 1")


# Param 2: Simple Decimation, dfairgap
sd_airgap_2 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "dfairgap",
                            param == "2") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 2: Simple Decimation, dfairgap with imputeTS
sdairgap_2_plot <- ggplot_na_distribution(sd_airgap_2 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DFairgap, Parameter 2")

# Param 5: Simple Decimation, dfairgap
sd_airgap_5 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "dfairgap",
                            param == "5") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 5: Simple Decimation, dfairgap with imputeTS
sdairgap_5_plot <- ggplot_na_distribution(sd_airgap_5 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DFairgap, Parameter 5")

# Param 10: Simple Decimation, dfairgap
sd_airgap_10 <- expand_ts %>% filter(method == "simpleDecimation",
                            dataset == "dfairgap",
                            param == "10") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 10: Simple Decimation, dfairgap with imputeTS
sdairgap_10_plot <- ggplot_na_distribution(sd_airgap_10 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DFairgap, Parameter 10")

# Param 20: Simple Decimation, dfairgap
sd_airgap_20 <- expand_ts %>% filter(method == "simpleDecimation",
                                  dataset == "dfairgap",
                                  param == "20") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 20: Simple Decimation, dfairgap with imputeTS
sdairgap_20_plot <- ggplot_na_distribution(sd_airgap_20 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Simple Decimation, DFairgap, Parameter 20")

## ==

# Param 1: Percentage Change, dfairgap
pc_airgap_1 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "dfairgap",
                                 param == "1") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 1: Percentage Change, dfairgap with imputeTS
pcairgap_1_plot <- ggplot_na_distribution(pc_airgap_1 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DFairgap, Parameter 1")


# Param 2: Percentage Change, dfairgap
pc_airgap_2 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "dfairgap",
                                 param == "2") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 2: Percentage Change, dfairgap with imputeTS
pcairgap_2_plot <- ggplot_na_distribution(pc_airgap_2 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DFairgap, Parameter 2")

# Param 5: Percentage Change, dfairgap
pc_airgap_5 <- expand_ts %>% filter(method == "percentageChange",
                                 dataset == "dfairgap",
                                 param == "5") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 5: Percentage Change, dfairgap with imputeTS
pcairgap_5_plot <- ggplot_na_distribution(pc_airgap_5 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DFairgap, Parameter 5")

# Param 10: Percentage Change, dfairgap
pc_airgap_10 <- expand_ts %>% filter(method == "percentageChange",
                                  dataset == "dfairgap",
                                  param == "10") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 10: Percentage Change, dfairgap with imputeTS
pcairgap_10_plot <- ggplot_na_distribution(pc_airgap_10 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DFairgap, Parameter 10")

# Param 20: Percentage Change, dfairgap
pc_airgap_20 <- expand_ts %>% filter(method == "percentageChange",
                                  dataset == "dfairgap",
                                  param == "20") %>% 
  mutate(full_ts = as.numeric(full_ts))

# Visualise Param 20: Percentage Change, dfairgap with imputeTS
pcairgap_20_plot <- ggplot_na_distribution(pc_airgap_20 %>% select(full_ts)) +
  labs(title = "Distribution of Missing Values: Percentage Change, DFairgap, Parameter 20")

## Combine all the plots into a neat visualisation
#==

sdairgap_1_plot + pcairgap_1_plot + sdairgap_2_plot + pcairgap_2_plot + sdairgap_5_plot + pcairgap_5_plot + sdairgap_10_plot + pcairgap_10_plot + sdairgap_20_plot + pcairgap_20_plot + plot_layout(ncol = 2)
