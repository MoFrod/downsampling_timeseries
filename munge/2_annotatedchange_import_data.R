# Create data frames from JSON files of Turing Change Annotated Change Dataset.
library(patchwork)
library(tidyverse)
library(here)
library(imputeTS)


# Set base path used for all file loading.
BASE_PATH = "~/Documents/MF MSc/downsampling_timeseries/data/AnnotateChange"

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

# Merge all data sets into a single dataframe.
merged <- rbind(df100, df200, df300, df400, df500, df600, df700, df800a, df800b)



