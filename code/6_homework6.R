# Homework 6: Functions Part 2
# Created by: Emily Markowitz
# Contact: Emily.Markowitz@noaa.gov
# Created: 2020-12-18
# Modified: 2021-02-08 

# First, load your libraries!

library(tidyverse)
library(here)
library(janitor)

# Answers to Questions: ------------------------

# NOTE: For this homework, also refer to the PDF version. 
# There are helpful graphics included in the PDF version!

# 1 Functions -------------------

# Though you can use funtions to automate processes like we did in the coursework, 
# I am going to take a slightly different take here and focus of using functions 
# for, well, mathimatical functions! 

## 1.1 The Pythagorean Theorem--------------

# $$a^{2} + b^{2} = c^{2}$$

# Where: 
#   
# - $a$ is the length of leg A
# 
# - $b$ is leg length of leg B
# 
# - $c$ is the length of leg C, otherwise known as the hypotenuse


# Solve for $c$ and include {roxygen2} skeletons!

# Let:
#   
# - $a$ = `c(5,3,10,4)` 
# 
# - $b$ = `c(3,5,10,20)`

#***ANSWER--------------




## 1.2 Newton's Universal Law of Gravitation ---------------

# $$F = G \frac{m_1 m_2}{d^2}$$

# Where: 
#   
# - $F$	=	force
# 
# - $G$	=	gravitational constant ($6.67430*10^{-11}$)
# 
# - $m_1$	=	mass of object 1
# 
# - $m_2$	=	mass of object 2
# 
# - $r$	=	distance between centers of the masses

### Solve for force ($F$) and include {roxygen2} skeletons:

# Let:
#  - the mass of object 1 (m_1) = 5, 
#  - the mass of object 2 (m_2) = 3, and 
#  - distance between the two masses (d) = 2. 


# > Hint! The Gravitational Constant Shouldn't change, unless you are testing this out on other planets. To save time, add the gravitational constant on earth to where you define the arguments in your function. 

#***ANSWER--------------



## 1.3 Area Swept (from our surveys!)---------------

# This is the area sampled for each observation when we survey. Here I'll write without variables to make it easier to read:

# $$Area Swept_{haul} (ha) = \frac{ Distance Fished_{haul} (km) * Net Width_{haul} (m) }{ 10 (\frac{m*km}{ha})}$$

### ***1.3.1 Write a function for this equation and solve for $Area Swept (km^2)$. ---------

# Let:
# 
#  - dist_fish = Distance Fished (2.77 km)
#  
#  - net_width = Net Width (16.8 m)

# Solve for Area and include {roxygen2} skeletons. 

#***ANSWER--------------



### ***1.3.2 Now we will apply this function to some real data! -----------
# Here I've combined 
# two datasets, *haul* and *catch* for Eastern Bering Sea data 
# (people familiar with the survey data on Oracle will know what this means). 

EBS<-read_csv(file = here("data", "haul_catch.csv"))
EBS<-janitor::clean_names(EBS)
EBS_summary <- EBS %>% 
  dplyr::filter(year == 2017) %>%
  dplyr::select(hauljoin, distance_fished, net_width) %>%
  # Now notice that this equation is calculated by haul. 
  # Right now the data includes species data so each haul number is 
  # listed multiple times in the haul column. We'll need to find the 
  # unqiue rows of the data so there is one row per haul. 
  dplyr::distinct(hauljoin, distance_fished, net_width)

head(EBS_summary)
str(EBS_summary)

# Let: 
#   
# - dist_fish = EBS_summary$distance_fished
# 
# - net_width = EBS_summary$net_width

# Add a new column called area_swept to our EBS_summary data frame. 


#***ANSWER--------------




## 1.4 Catch Per Unit Effort (CPUE) ----------------------

# CPUE is calculated by dividing the catch weight of each fishing trip by the area swept (from the last equation!). This gives CPUE in units of kilograms per hectar. 

# $$CPUE_{haul} (kg/ha)= \frac{Fish Weight_{haul}(kg)}{ (Distance Fished_{haul}(km)*Net Width_{haul}(m)) / 10 (\frac{m*km}{ha})}  = \frac{Fish Weight_{haul}(kg)}{ Area Swept_{haul} (ha)}$$

# Write a function for the above CPUE equation and solve for $CPUE$ using the below data and using your function for area swept from the last question. 

# EBS<-read_csv(file = here("data", "haul_catch.csv"))
# EBS<-janitor::clean_names(EBS)
EBS_summary <- EBS %>% 
  dplyr::select(year, hauljoin, distance_fished, net_width, weight) %>%
  dplyr::group_by(year, hauljoin, # the real things we are summarizing by
                  distance_fished, net_width) %>% # we want to keep these columns and they don't change by stratum and haul
  dplyr::summarise(sum_weight = sum(weight, na.rm = TRUE))

head(EBS_summary)

# Let:
# - catch = catch from the survey (catch = EBS_summary$number_fish), 
# - time = time in hours from the survey (EBS_summary$duration), 
# - trips = number of trips taken during survey (EBS_summary$haul). 

# Solve for CPUE (CPUE) and include {roxygen2} skeleton. 

#***ANSWER--------------


