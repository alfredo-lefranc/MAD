# Data Mining and Analysis (MAD in Spanish)

This repository contains the midterm exam for the course Data Mining and Analysis, part of the master's program in Data Science at ITAM, taught by Juan Mármol in the fall of 2020.

Instructions:

Exercise 1

The purpose of this exercise is to write scripts for loading, preparing, and cleaning the data from the dataset imports.csv in a reproducible manner. To do this, you must:

Create a bash script that obtains the column names from the imports-85.names file and generates a script called metadata.R with the assignment of the column names vector. (Automatic generation of the metadata.R script)

Create the following R scripts:

utils.R: General functions to be used in the data preparation and cleaning process

00-load.R: Load the file

01-prepare.R: Prepare the data (i.e., assign names to the columns)

02-clean.R: Clean the file of possible loading errors

Exercise 2

The purpose of this exercise is to perform an exploratory analysis of the data. This analysis should be done with the final goal of predicting the price of a vehicle based on the available covariates (the prediction is not required in the exam).

To facilitate the observation of the covariate combinations, a dashboard in Shiny must be generated.

The presentation of both the data before and after the cleaning process, as well as the findings of the exploratory analysis, should be presented in an HTML file generated from an Rmd file.
