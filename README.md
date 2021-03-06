# MAD

Este repositorio contiene el examen parcial de la materia Minería y Análisis de Datos, de la maestría de Ciencia de Datos del ITAM, impartida por Juan Mármol en el otoño de 2020.

Instrucciones:

Ejercicio 1

El propósito de este ejercicio es escribir guiones para la carga, preparación y limpieza de datos del data set imports.csv en una manera reproducible. Para ello debes:

1) Crear un guión en bash que obtenga del archivo imports-85.names los nombres de las columnas del conjunto de datos; y que genere un guión que se llame metadata.R con la asignación del vector de nombres de columnas. (Generación automática del guión metadata.R)

2) Crear los siguiente guiones en R:

	utils.R: Funciones generales a utilizarse en el proceso de preparación y limpieza 
      00-load.R: Cargue el archivo
   01-prepare.R: Preparar los datos (i.e. asignar nombres a las columnas) 
     02-clean.R: Limpiar el archivo de posibles errores de carga

Ejercicio 2

El propósito de este ejercicio es realizar un análisis exploratorio sobre los datos. Este análisis debe hacerse teniendo en cuenta que el objetivo final es predecir el precio de un vehículo a partir de las covariables con las que contamos (la predicción no es requerida en el examen).

Para facilitar la observación de las combinaciones de las covariables se deberá generar un dashboard en shiny.

La presentación tanto de los datos antes y después del proceso de limpieza, así como los hallazgos del análisis exploratorio deben ser predentados en un archivo html generado a partir de un archivo Rmd.
