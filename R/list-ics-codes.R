# Get ICS codes
library(readxl)
library(dplyr)

codes <- read_excel(
  "data/ICS-codes.xlsx",
  sheet = "Data"
  )

for (code_i in codes$`BNF Code`) {
  cat(
    "'", code_i,"'", ", ", sep = ""
  )
}