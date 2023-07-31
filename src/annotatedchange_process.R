# Update expand_ts so the full_ts column has numeric values
expand_ts <- expand_ts %>% mutate(full_ts = as.numeric(full_ts))



# Percentage change based on previous value (irrespective whether it was transmitted).
generateNAPlot <- function(paramMethod,paramDataset,paramVol) {
  tmpdata <- expand_ts %>% filter(method == paramMethod,
                                  dataset == paramDataset,
                                  vol == paramVol)
  
  
  
  ggplot_na_distribution(tmpdata %>% select(full_ts)) +
    labs(title = paste0("Distribution of Missing Values: ",paramMethod,", ",paramDataset,", ",paramVol))
}



# Wrapper around catch22 to make it easier to pull values back out
wrapperCatch22 <- function(paramMethod,paramDataset,paramVol) {
  
  
  
  tmpdata <- df %>% filter(method == "simpleDecimation",
                           dataset == "df100",
                           vol == "100") %>% pull(full_ts) %>% str_split(",") %>% unlist() %>% as.numeric()
  
  
  
  catch22_all(tmpdata, catch24 = TRUE) %>%
    mutate(asdf = names) %>% select(-names) %>%
    pivot_wider(names_from = asdf, values_from = values)
}



# Group the dataframe by param, method and dataset, and 'nest' the remaining values into a 'data' nested dataframe.
df_nested <- df %>%
  group_by(vol,method,dataset) %>%
  nest()

# Mutate the dataframe to add a 'plot' column containing the ggplot object
enriched_df <- df_nested %>% head(10) %>%
  mutate(plot = map2(data, vol, ~generateNAPlot(method, dataset, vol)),
         c22 = map2(data, vol, ~wrapperCatch22(method, dataset, vol))) %>%
  unnest(data) %>% unnest(c22)



# Run catch22 or NA plot for a particular config.
wrapperCatch22("simpleDecimation","df100","100")
generateNAPlot("simpleDecimation","df100","100")