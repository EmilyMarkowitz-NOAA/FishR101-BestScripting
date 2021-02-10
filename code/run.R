#' ---
#' title: FishR101 - Jan-Feb 2021
#' purpose: run all of the scripts and R markdown scripts
#' author: emily.markowitz AT noaa.gov
#' start date: 2020-10
#' ---


######START#######

# Always start with a clean state by removing everything in your environment!

######***Libraries#########
library(here)


#######***LOAD PROJECT LIBRARIES AND FUNCTIONS#############
#Functions specific to this section
# source("./scripts/functions.R")

#######***LOAD PROJECT Data#############
#Data specific to this section
# source(paste0(dir.scripts, "/dataDownload.r"))
# source("./scripts/data.R")

######MAKE OUTPUTS########
echoTF<-FALSE
title0<-"Homework"
rmarkdown::render(here("code","homework-solutions.Rmd"), 
                  output_dir = here("code"), 
                  output_file = "6_homework5.pdf")

echoTF<-TRUE
title0<-"Homework Answers"
rmarkdown::render(here("code","homework-solutions.Rmd"), 
                  output_dir = here("code"), 
                  output_file = "6_homework5-solutions.pdf")
