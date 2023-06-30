library(Rcatch22)

## Create new dataframes of Rcatch22 features for simpleDecimation df400 params 1, 2, 5, 10 and 20
## ==

# Create new dataframe for Param 1
catch22_sd400_1 <- sd_400_1 %>%
  select('full_ts') %>%
  unlist()

# Create features dataframe for Parm 1
features_sd400_1 <- catch22_all(catch22_sd400_1, catch24 = TRUE)

# Create new dataframe for Param 2
catch22_sd400_2 <- sd_400_2 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 2
features_sd400_2 <- catch22_all(catch22_sd400_2, catch24 = TRUE)

# Create new dataframe for Param 5
catch22_sd400_5 <- sd_400_5 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 5
features_sd400_5 <- catch22_all(catch22_sd400_5, catch24 = TRUE)

# Create new dataframe for Param 10
catch22_sd400_10 <- sd_400_10 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 10
features_sd400_10 <- catch22_all(catch22_sd400_10, catch24 = TRUE)

# Create new dataframe for Param 20
catch22_sd400_20 <- sd_400_20 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 20
features_sd400_20 <- catch22_all(catch22_sd400_20, catch24 = TRUE)

## Create new dataframes of Rcatch22 features for percentageChange df400 params 1, 2, 5, 10 and 20
## ==

# Create new dataframe for Param 1
catch22_pc400_1 <- pc_400_1 %>%
  select('full_ts') %>%
  unlist()

# Create features dataframe for Parm 1
features_pc400_1 <- catch22_all(catch22_pc400_1, catch24 = TRUE)

# Create new dataframe for Param 2
catch22_pc400_2 <- pc_400_2 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 2
features_pc400_2 <- catch22_all(catch22_pc400_2, catch24 = TRUE)

# Create new dataframe for Param 5
catch22_pc400_5 <- pc_400_5 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 5
features_pc400_5 <- catch22_all(catch22_pc400_5, catch24 = TRUE)

# Create new dataframe for Param 10
catch22_pc400_10 <- pc_400_10 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 10
features_pc400_10 <- catch22_all(catch22_pc400_10, catch24 = TRUE)

# Create new dataframe for Param 20
catch22_pc400_20 <- pc_400_20 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 20
features_pc400_20 <- catch22_all(catch22_pc400_20, catch24 = TRUE)
