# Apply catch22 to DF100
catch22_df100 <- catch22_all(df100$val, catch24 = TRUE)

# Apply catch22 to DF200
catch22_df200 <- catch22_all(df200$val, catch24 = TRUE)

# Apply catch22 to DF300
catch22_df300 <- catch22_all(df300$val, catch24 = TRUE)

# Apply catch22 to DF400
catch22_df400 <- catch22_all(df400$val, catch24 = TRUE)

# Apply catch22 to DF500
catch22_df500 <- catch22_all(df500$val, catch24 = TRUE)

# Apply catch22 to DF600
catch22_df600 <- catch22_all(df600$val, catch24 = TRUE)

# Apply catch22 to DF700
catch22_df700 <- catch22_all(df700$val, catch24 = TRUE)

# Apply catch22 to DF800a
catch22_df800a <- catch22_all(df800a$val, catch24 = TRUE)

# Apply catch22 to DF800b
catch22_df800b <- catch22_all(df800b$val, catch24 = TRUE)

# Create a list of datasets
df_list <- list("df100" = catch22_df100, "df200" = catch22_df200, "df300" = catch22_df300, "df400" = catch22_df400, 
                "df500" = catch22_df500, "df600" =catch22_df600, "df700" =catch22_df700, "df800a" = catch22_df800a, "df800b" = catch22_df800b)

# Create new dataset of catch22 values from original datasets
catch22_original <- df_list[[1]]
names(catch22_original)[names(catch22_original) == "values"] <- "df100"

# Loop through the rest of the list, joining each time
for(i in 2:length(df_list)){
  names(df_list[[i]])[names(df_list[[i]]) == "values"] <- names(df_list)[i]
  catch22_original <- left_join(catch22_original, df_list[[i]], by = "names")
}


