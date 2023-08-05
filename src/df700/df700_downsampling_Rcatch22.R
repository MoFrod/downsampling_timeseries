library(Rcatch22)

## Create new dataframes of Rcatch22 features for simpleDecimation df700 params 1, 2, 5, 10 and 20
## ==

# Create new dataframe for Param 1
catch22_sd700_1 <- sd_700_1 %>%
  select('full_ts') %>%
  unlist()

# Create features dataframe for Parm 1
features_sd700_1 <- catch22_all(catch22_sd700_1, catch24 = TRUE)

# Create new dataframe for Param 2
catch22_sd700_2 <- sd_700_2 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 2
features_sd700_2 <- catch22_all(catch22_sd700_2, catch24 = TRUE)

# Create new dataframe for Param 5
catch22_sd700_5 <- sd_700_5 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 5
features_sd700_5 <- catch22_all(catch22_sd700_5, catch24 = TRUE)

# Create new dataframe for Param 10
catch22_sd700_10 <- sd_700_10 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 10
features_sd700_10 <- catch22_all(catch22_sd700_10, catch24 = TRUE)

# Create new dataframe for Param 20
catch22_sd700_20 <- sd_700_20 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 20
features_sd700_20 <- catch22_all(catch22_sd700_20, catch24 = TRUE)

## Create new dataframes of Rcatch22 features for percentageChange df700 params 1, 2, 5, 10 and 20
## ==

# Create new dataframe for Param 1
catch22_pc700_1 <- pc_700_1 %>%
  select('full_ts') %>%
  unlist()

# Create features dataframe for Parm 1
features_pc700_1 <- catch22_all(catch22_pc700_1, catch24 = TRUE)

# Create new dataframe for Param 2
catch22_pc700_2 <- pc_700_2 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 2
features_pc700_2 <- catch22_all(catch22_pc700_2, catch24 = TRUE)

# Create new dataframe for Param 5
catch22_pc700_5 <- pc_700_5 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 5
features_pc700_5 <- catch22_all(catch22_pc700_5, catch24 = TRUE)

# Create new dataframe for Param 10
catch22_pc700_10 <- pc_700_10 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 10
features_pc700_10 <- catch22_all(catch22_pc700_10, catch24 = TRUE)

# Create new dataframe for Param 20
catch22_pc700_20 <- pc_700_20 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 20
features_pc700_20 <- catch22_all(catch22_pc700_20, catch24 = TRUE)
