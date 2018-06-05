# -- Read in yaml config -------------------------------------
library(yaml)
library(data.table)
library(fst)

processing_config <- yaml.load_file("processing_config.yaml")

# -- Read in competition data --------------------------------

source_file_csvs <- 
  c(
    "application_test"
    ,"application_train"
    ,"bureau"
    ,"bureau_balance"
    ,"credit_card_balance"
    ,"installments_payments"
    ,"POS_CASH_balance"
    ,"previous_application"
    ,"sample_submission"
  )

for(x in source_file_csvs){
  assign(
    x
    ,fread(paste0(processing_config$source_data_folder,"\\",x,".csv"),data.table=FALSE)
  )
}

# -- Store in optimised file format --------------------------------

for(x in source_file_csvs){
  write_fst(get(x),paste0(processing_config$processing_data_folder,"\\",x,".fst"))
}

# -- Clean up ------------------------------------------------------

for(x in source_file_csvs){
  rm(list=paste0(x))
}


