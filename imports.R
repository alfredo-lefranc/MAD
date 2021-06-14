library(readr)
library(stringr)
library(tidyr)
library(dplyr)
library(ggplot2)
library(ggthemes)

source("metadata.R"  , encoding = 'UTF-8')
source("utils.R"     , encoding = 'UTF-8')
source("00-load.R"   , encoding = 'UTF-8')
source("01-prepare.R", encoding = 'UTF-8')
source("02-clean.R",   encoding = 'UTF-8')

glimpse(imports_data)

# Manipulación de los datos

# transformación log de variables muy dispersas
log_imp <- mutate_at(imports_data,
                     c("curb_weight", "engine_size", "horsepower", "price"),
                     log)

names(log_imp)[14] <- "ln_curb_weight"
names(log_imp)[17] <- "ln_engine_size"
names(log_imp)[22] <- "ln_horsepower"
names(log_imp)[26] <- "ln_price"

translog <- dplyr::select(log_imp,c("ln_curb_weight",
                                    "ln_engine_size",
                                    "ln_horsepower",
                                    "ln_price"))

log_colnames <- colnames(translog)


# separar variables numéricas y categóricas
imp_num <- log_imp %>% 
  dplyr::select_if(is.numeric)

imp_colnames_num <- colnames(imp_num)

imp_fac <- log_imp %>% 
  dplyr::select_if(is.factor)

imp_colnames_fac <- colnames(imp_fac)

# filtro de valores aberrantes
curb <- imports_data %>% filter(curb_weight<50000)

# variable binaria de la medida de riesgo
symbols <- within(log_imp,
                  safe <- ifelse(symboling == "0" | symboling=="1" | 
                                   symboling=="2" | symboling=="3",
                                 "safe", "risky"))

