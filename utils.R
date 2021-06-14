# Cargar la base
load <- function(){
  if(!file.exists('imports-85.rds')){
    
    imports_data <- read_csv("imports-85.csv", 
                      col_names = colnames_imports,
                      na = 'XXXXXXX')
    saveRDS(imports_data, "imports-85.rds")
    print('imports-85.rds se transformo y guardo\n')
  }
  else{
    warning('imports-85.rds ya existe\n')
    imports_data <- readRDS("imports-85.rds")
  }
  
  return(imports_data)
}

# Limpieza de las columnas y los datos
imports_clean_colnames <- function(x){
  str_replace_all(tolower(x),"[-]", "_")
}

imports_clean_data <- function(x){
  str_replace_all(tolower(x),"[?]", replacement = NA_character_)
}

# NA's
indices_con_NAs <- function(df, porcentaje=0.2) {
  n <- ifelse (porcentaje < 1, 
               as.integer(porcentaje  * ncol(df)),
               stop("Introucir el porcentaje de columnas con NAs.")
  )
  indices <- which( apply(df, 1, function(x) sum(is.na(x))) > n )
  if (!length(indices)) {
    warning("No hay observaciones con tantos NAs ")
  }
  indices
}
