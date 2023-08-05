library(Rcatch22)

## Create new dataframes of Rcatch22 features for simpleDecimation df800a params 1, 2, 5, 10 and 20
## ==

# Create new dataframe for Param 1
catch22_sd800a_1 <- sd_800a_1 %>%
  select('full_ts') %>%
  unlist()

# Create features dataframe for Parm 1
features_sd800a_1 <- catch22_all(catch22_sd800a_1, catch24 = TRUE)

# Create new dataframe for Param 2
catch22_sd800a_2 <- sd_800a_2 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 2
features_sd800a_2 <- catch22_all(catch22_sd800a_2, catch24 = TRUE)

# Create new dataframe for Param 5
catch22_sd800a_5 <- sd_800a_5 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 5
features_sd800a_5 <- catch22_all(catch22_sd800a_5, catch24 = TRUE)

# Create new dataframe for Param 10
catch22_sd800a_10 <- sd_800a_10 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 10
features_sd800a_10 <- catch22_all(catch22_sd800a_10, catch24 = TRUE)

# Create new dataframe for Param 20
catch22_sd800a_20 <- sd_800a_20 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 20
features_sd800a_20 <- catch22_all(catch22_sd800a_20, catch24 = TRUE)

## Create new dataframes of Rcatch22 features for percentageChange df800a params 1, 2, 5, 10 and 20
## ==

# Create new dataframe for Param 1
catch22_pc800a_1 <- pc_800a_1 %>%
  select('full_ts') %>%
  unlist()

# Create features dataframe for Parm 1
features_pc800a_1 <- catch22_all(catch22_pc800a_1, catch24 = TRUE)

# Create new dataframe for Param 2
catch22_pc800a_2 <- pc_800a_2 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 2
features_pc800a_2 <- catch22_all(catch22_pc800a_2, catch24 = TRUE)

# Create new dataframe for Param 5
catch22_pc800a_5 <- pc_800a_5 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 5
features_pc800a_5 <- catch22_all(catch22_pc800a_5, catch24 = TRUE)

# Create new dataframe for Param 10
catch22_pc800a_10 <- pc_800a_10 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 10
features_pc800a_10 <- catch22_all(catch22_pc800a_10, catch24 = TRUE)

# Create new dataframe for Param 20
catch22_pc800a_20 <- pc_800a_20 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 20
features_pc800a_20 <- catch22_all(catch22_pc800a_20, catch24 = TRUE)
