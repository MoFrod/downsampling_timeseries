library(Rcatch22)

# Wrapper for applying catch22
wrapperCatch22New <- function(d) {
  catch22_all(d %>% str_split(",") %>% unlist() %>% as.numeric(), catch24 = TRUE) %>%
    mutate(asdf = names) %>% select(-names) %>%
    pivot_wider(names_from = asdf, values_from = values) %>% as_tibble()
}



# Wrapper for interpolation
wrapperInterpolateNew <- function(d) {
  
  na_interpolation(d %>% str_split(",") %>% unlist() %>% as.numeric(), option = "linear") %>% paste(collapse = ",")
}


# Generate NA Distribution plot.
generateNAPlotNew <- function(d, paramMethod,paramDataset,paramParam) {
  ggplot_na_distribution(d %>% str_split(",") %>% unlist() %>% as.numeric()) +
    labs(title = paste0("Distribution of Missing Values: ",paramMethod,", ",paramDataset,", ",paramParam))
}



enriched_df <- df %>% 
  rowwise() %>%
  mutate(interpTSLinear = wrapperInterpolateNew(full_ts),
         wrapperCatch22New(interpTSLinear),
         plot = list(generateNAPlotNew(full_ts, method,dataset,param)))



