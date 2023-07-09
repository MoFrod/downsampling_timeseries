# Jettison Code MVP
# May 2023

## LIBRARY IMPORTS
library(tidyverse)
library(imputeTS)
library(here)
library(patchwork) # Library to help develop composite plots.

## DATA LOADING

# Set base path used for all file loading.
BASE_PATH = "D:/Morgan/Documents/NCL MSc/final_project/mofrod_project/data/AnnotateChange"

# Load JSON files. These can be obtained from 
f100 <- jsonlite::fromJSON(here(BASE_PATH,"demo_100.json"))
f200 <- jsonlite::fromJSON(here(BASE_PATH,"demo_200.json"))
f300 <- jsonlite::fromJSON(here(BASE_PATH,"demo_300.json"))
f400 <- jsonlite::fromJSON(here(BASE_PATH,"demo_400.json"))
f500 <- jsonlite::fromJSON(here(BASE_PATH,"demo_500.json"))
f600 <- jsonlite::fromJSON(here(BASE_PATH,"demo_600.json"))
f700 <- jsonlite::fromJSON(here(BASE_PATH,"demo_700.json"))
f800 <- jsonlite::fromJSON(here(BASE_PATH,"demo_800.json"))

# Extract values, add an index column, and a column to identify each dataset.
df100 <- data.frame(val = f100$series$raw[[1]]) %>% mutate(id = row_number(), dataset = "100")
df200 <- data.frame(val = f200$series$raw[[1]]) %>% mutate(id = row_number(), dataset = "200")
df300 <- data.frame(val = f300$series$raw[[1]]) %>% mutate(id = row_number(), dataset = "300")
df400 <- data.frame(val = f400$series$raw[[1]]) %>% mutate(id = row_number(), dataset = "400")
df500 <- data.frame(val = f500$series$raw[[1]]) %>% mutate(id = row_number(), dataset = "500")
df600 <- data.frame(val = f600$series$raw[[1]]) %>% mutate(id = row_number(), dataset = "600")
df700 <- data.frame(val = f700$series$raw[[1]]) %>% mutate(id = row_number(), dataset = "700")
df800a <- data.frame(val = f800$series$raw[[1]]) %>% mutate(id = row_number(), dataset = "800A")
df800b <- data.frame(val = f800$series$raw[[2]]) %>% mutate(id = row_number(), dataset = "800B")

# Airgap sample data
airgap <- data.frame(val=as.matrix(tsAirgap)#, id=time(tsAirgap)
                     ) %>% mutate(id = row_number(), dataset = "airgap")

# Merge all data sets into a single dataframe.
merged <- rbind(df100, df200, df300, df400, df500, df600, df700, df800a, df800b, airgap)

# Simple visualisation of each dataset, one per facet.
tsp <- merged %>% ggplot(aes(x = id, y = val)) + geom_line() + geom_point() + facet_grid(dataset~., scales = "free")

tsp

# Create data frame to store results.
df <- tibble(
  param = numeric(),
  method = character(),
  dataset = character(),
  vol = character(),
  number_NAs = character(),
  number_na_gaps = character(),
  full_ts = character(),
  indexes_of_values_kept = character()
)


## Downsampling Functions
## =====

# Simple decimation a.k.a. "every n"
funSimpleDecimation <- function(df, i = 1) {
  df %>% slice(seq(1, nrow(df), by = i))
}

# Percentage change based on previous value (irrespective whether it was transmitted).
funPercentageChangeLastValue <- function(df, i = 1) {
  df %>% mutate(perc = 100 * (val - lag(val))/lag(val)) %>% filter(abs(perc) > i)
}

# Perecentage change based on last transmitted value.
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


## Experiment Configuration.
## =====

# List of datasets to use in testing.
list_of_dataset <- c("df100","df200","df300","df400","df500","df600","df700","df800a","df800b")

# Specify methods to use in experiment
list_of_methods <- c("simpleDecimation","percentageChange")


## Running a timed experiment.
## =====
start.time <- Sys.time()

# Iterate across all datasets.
for (dataset in list_of_dataset)
{
  # Load dataset
  datats <- get(dataset)
  
  # Iterate across all methods
  for (method in list_of_methods)
  {
    # TODO further work on parameterisation on models.
    for(i in 1:50)
    {
      if (method == "simpleDecimation") {
        a <- funSimpleDecimation(datats, i)
      } else if (method == "percentageChange") {
        a <- funPercentageChange(datats, i)
      }
      
      # Rejoin the original and downsampled datasets.
      gaps <- left_join(datats, a, by = "id")
      
      # Obtain measures from imputeTS
      res <- statsNA(gaps$val.y, print_only = FALSE)
      
      #print("about to print")
      #print(paste0(a$id, collapse = ","))
      
      df <- df %>% add_row(param = i,
                           #v = a,
                           method = method,
                           dataset = as.character(dataset),
                           vol = as.character(nrow(a)),
                           number_NAs = as.character(res$number_NAs[1]),
                           number_na_gaps = as.character(res$number_na_gaps[1]),
                           full_ts = as.character(paste(gaps$val.y, collapse = ",")),
                           indexes_of_values_kept = as.character(paste(a$id, collapse = ",")))
      
    }
  }
}
end.time <- Sys.time()

# Calculate duration of experimental run.
time.taken <- round(end.time - start.time,2)
time.taken

## Post-processing of experimental results.

# Pivot the results dataset into a 'longer' form with a row for each metric type, to make it easier to facet on different values.
metrics_of_interest <- c("vol","number_NAs","number_na_gaps")

# TODO Update to use metrics_of_interest in pivot.
df_longer <- df %>%
  pivot_longer(cols = c("vol","number_NAs","number_na_gaps")) %>%
  mutate(value = as.numeric(value))

## Simple visualisations of results.

# Simple graph for datasets and methods
resplot <- df_longer %>%
  ggplot(aes(x = param, y = value, colour = method)) + facet_grid(name~dataset) + geom_point() + theme(legend.position = "bottom")

# Plot original data and visualisation graph side-by-side using patchwork '+' operator.
tsp + resplot

