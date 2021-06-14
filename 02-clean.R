colnames(imports_data) <- imports_clean_colnames(colnames_imports)

problematic_rows <- problems(imports_data)$row

imports_data[problematic_rows,] <- imports_data %>% 
  slice(problematic_rows) %>% 
  unite(col="all", -seq(1:13), sep = "/", remove=TRUE) %>% 
  extract(all, into=c("curb_weight", "engine_type", "resto"), 
          regex="([0-9]*)([a-z]*)/(.*)/NA", remove=TRUE) %>% 
  separate(resto, into=names(imports_data)[16:26], sep="/", remove=TRUE) %>%
  readr::type_convert() %>%
  mutate(across(c("wheel_base",
                  "price",
                  "peak_rpm",
                  "horsepower",
                  "engine_size",
                  "curb_weight"),
                as.character))

imports_data$wheel_base[imports_data$wheel_base == "ninetyfivedot7"] <- "95.7"
imports_data$make[imports_data$make == "mercedes-bens"] <- "mercedes-benz"

imports_data <- imports_data %>% 
  mutate_at(c(2,6,19,20,22,23,26), list(imports_clean_data))


imports_data <- readr::type_convert(imports_data)

imports_data  <- imports_data %>% 
  mutate_at(c(1,3:9,15,16,18),list(as.factor))
