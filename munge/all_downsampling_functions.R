# Jettison Code MVP: Downsampling Functions

# Simple decimation a.k.a. "every n"
funSimpleDecimation <- function(df, i = 1) {
  df %>% slice(seq(1, nrow(df), by = i))
}

# Percentage change based on previous value (irrespective whether it was transmitted).
funPercentageChangeLastValue <- function(df, i = 1) {
  df %>% mutate(perc = 100 * (val - lag(val))/lag(val)) %>% filter(abs(perc) > i)
}

# Percentage change based on last transmitted value.
funPercentageChange <- function(df, i = 1)
{
  latestval = df[1,]['val']
  id_to_keep <- c(1)
  
  for (j in 2:nrow(df))
  {
    recentval <- df[j,]['val'] %>% pull()
    perc = 100* (recentval - latestval)/latestval
    if (abs(perc) > i) {
      id_to_keep <- append(id_to_keep,j)
      latestval <- df[j,]['val']
    } 
  }
  df[id_to_keep,]
}
