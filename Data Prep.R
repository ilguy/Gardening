# Load the tidyverse
library(tidyverse)
library(readxl)
library(lubridate)

# Import data
data <- read_excel("GardeningData.xlsx", skip = 1, 
                   col_names = c("Date", "Garden", "PlantType",
                                "SubType","NumRows","DaysToGerm",
                                "MinDaysToHarvest","MaxDaysToHarvest"),
                   col_types = c("date", "text", "text",
                                 "text", "numeric","numeric",
                                 "numeric", "numeric"))

data$DateOfGerm <- data$Date + days(data$DaysToGerm)
data$EarliestHarvest <- data$Date + days(data$MinDaysToHarvest)
data$LatestHarvest <- data$Date + days(data$MaxDaysToHarvest)
