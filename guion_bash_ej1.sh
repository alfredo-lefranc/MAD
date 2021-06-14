#!/bin/bash

#Exploro el archivo imports-85.names
cat imports-85.names

#Obtengo los nombres de las columnas con una expresión regular
egrep "\s[0-9]+\.\s[a-z]+" imports-85.names

#Usando pipes, filtro el output de la línea anterior para que sólo tome los nombres de las columnas y los mande al archivo nombres.txt
egrep "\s[0-9]+\.\s[a-z]+" imports-85.names | cut -d':' -f1 | cut -d'.' -f2 | cut -d' ' -f2 > nombres.txt

# ponerle comillas al inicio y al final de cada variable y paréntesis en lugar de coma al final
sed -i -e '{s/^/"/}' -e '{s/$/",/}' -e '{s/price",/price")/g}' nombres.txt


#Genero el inicio del archivo metadata por aparte.
echo -e "#Imports\n\n#Nombres de las columnas\ncolnames_imports <- c(" > top.txt

# unir partes creando el archivo metadata.R
cat top.txt nombres.txt > metadata.R

