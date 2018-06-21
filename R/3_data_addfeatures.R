library(dplyr)

bureau <- read_fst(paste0(processing_config$processing_data_folder,"\\bureau.fst"))


# Set table to be merged by SK_ID_CURR ------------------------------------

avg_bureau <- bureau %>% 
  group_by(SK_ID_CURR) %>% 
  summarise_all(funs(mean), na.rm = TRUE)