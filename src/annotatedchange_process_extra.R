# Update expand_ts so the full_ts column has numeric values
expand_ts <- expand_ts %>% mutate(full_ts = as.numeric(full_ts))



# Percentage change based on previous value (irrespective whether it was transmitted).
generateNAPlot <- function(paramMethod,paramDataset,paramParam) {
  tmpdata <- expand_ts %>% filter(method == paramMethod,
                                  dataset == paramDataset,
                                  param == paramParam)
  
  
  
  ggplot_na_distribution(tmpdata %>% select(full_ts)) +
    labs(title = paste0("Distribution of Missing Values: ",paramMethod,", ",paramDataset,", ",paramParam))
}



# Wrapper around catch22 to make it easier to pull values back out
wrapperCatch22 <- function(paramMethod,paramDataset,paramParam) {
  
  
  
  tmpdata <- df %>% filter(method == paramMethod,
                           dataset == paramDataset,
                           param == paramParam) %>% pull(full_ts) %>% str_split(",") %>% unlist() %>% as.numeric()
  
  
  
  catch22_all(tmpdata, catch24 = TRUE) %>%
    mutate(asdf = names) %>% select(-names) %>%
    pivot_wider(names_from = asdf, values_from = values)
}



wrapperCatch22New <- function(df, paramMethod,paramDataset,paramParam) {
  df$interpTSLinear
}



wrapperInterpolate <- function(paramMethod,paramDataset,paramParam,interpMethod) {
  
  
  
  tmpdata <- df %>% filter(method == paramMethod,
                           dataset == paramDataset,
                           param == paramParam) %>% pull(full_ts) %>% str_split(",") %>% unlist() %>% as.numeric()
  
  
  
  na_interpolation(tmpdata, option = interpMethod) %>% paste(collapse = ",")
}



# Group the dataframe by param, method and dataset, and 'nest' the remaining values into a 'data' nested dataframe.
df_nested <- df %>%
  mutate(interpTSLinear = wrapperInterpolate(method,dataset,param,"linear")) %>%
  group_by(param,method,dataset) %>%
  nest()



df_nested



# Mutate the dataframe to add a 'plot' column containing the ggplot object
enriched_df <- df_nested %>% head(5) %>%
  mutate(plot = map2(data, param, ~generateNAPlot(method, dataset, param)),
         c22Linear = map2(data, param, ~wrapperCatch22New(.x, method, dataset, param))) %>%
  unnest(data)



enriched_df$c22Linear



# Run catch22 or NA plot for a particular config.
wrapperCatch22("simpleDecimation","df100","2")
wrapperInterpolate("simpleDecimation","df100","2","linear") %>% paste(collapse = ",")
generateNAPlot("simpleDecimation","df100","2")



asdfasdf <- df %>% filter(method == "simpleDecimation",
                          dataset == "df100", param == "2") %>% pull(full_ts) %>% str_split(",") %>% unlist() %>% as.numeric()



catch22_all(asdfasdf, catch24 = TRUE)



catch22_all(na_interpolation(sd_100_5$full_ts, option = "linear"))