library(Rcatch22)

## Create new dataframes of Rcatch22 features for simpleDecimation df600 params 1, 2, 5, 10 and 20
## ==

# Create new dataframe for Param 1
catch22_sd600_1 <- sd_600_1 %>%
  select('full_ts') %>%
  unlist()

# Create features dataframe for Parm 1
features_sd600_1 <- catch22_all(catch22_sd600_1, catch24 = TRUE)

# Create new dataframe for Param 2
catch22_sd600_2 <- sd_600_2 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 2
features_sd600_2 <- catch22_all(catch22_sd600_2, catch24 = TRUE)

# Create new dataframe for Param 5
catch22_sd600_5 <- sd_600_5 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 5
features_sd600_5 <- catch22_all(catch22_sd600_5, catch24 = TRUE)

# Create new dataframe for Param 10
catch22_sd600_10 <- sd_600_10 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 10
features_sd600_10 <- catch22_all(catch22_sd600_10, catch24 = TRUE)

# Create new dataframe for Param 20
catch22_sd600_20 <- sd_600_20 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 20
features_sd600_20 <- catch22_all(catch22_sd600_20, catch24 = TRUE)

## Create new dataframes of Rcatch22 features for percentageChange df600 params 1, 2, 5, 10 and 20
## ==

# Create new dataframe for Param 1
catch22_pc600_1 <- pc_600_1 %>%
  select('full_ts') %>%
  unlist()

# Create features dataframe for Parm 1
features_pc600_1 <- catch22_all(catch22_pc600_1, catch24 = TRUE)

# Create new dataframe for Param 2
catch22_pc600_2 <- pc_600_2 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 2
features_pc600_2 <- catch22_all(catch22_pc600_2, catch24 = TRUE)

# Create new dataframe for Param 5
catch22_pc600_5 <- pc_600_5 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 5
features_pc600_5 <- catch22_all(catch22_pc600_5, catch24 = TRUE)

# Create new dataframe for Param 10
catch22_pc600_10 <- pc_600_10 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 10
features_pc600_10 <- catch22_all(catch22_pc600_10, catch24 = TRUE)

# Create new dataframe for Param 20
catch22_pc600_20 <- pc_600_20 %>%
  select('full_ts') %>%
  na.omit() %>%
  unlist()

# Create features dataframe for Param 20
features_pc600_20 <- catch22_all(catch22_pc600_20, catch24 = TRUE)
