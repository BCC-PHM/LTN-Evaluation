# Download tube data
source("R/config.R")
library(dplyr)
library(sf)


get_dtube_data <- function(
    redownload = FALSE
) {
  
  data_path <- "data/diffusion-tubes.csv"

  # If the diffusion tube data doesn't exist, then download the data
  if (!file.exists(data_path)|redownload) {
    print("Downloading data...")
    
    diffusion_url_prefix <- "http://62.65.40.208/cgi-bin/birmingham/apub.exportDiffTube.cgi/graph.txt?outtype=txt&from="
    download_path <- paste0("C:/Users/",usr_name,"/Downloads/graph.txt")
    
    column_names <- c("Year", "Tube_ID", "Address", "num1", 
                      "num2", "Area_Type", "Recorded_Value")
    
    # Download all the files
    data_list <- list()
    for (year_i in 2011:2023) {
      url_i <- paste0(
        diffusion_url_prefix,
        year_i
      )
      
      data_i <- read.csv(
        url_i,
        sep = ";",
        header = FALSE)
      data.table::setnames(data_i, column_names)
      data_list[[year_i]] <- data_i
    }
    
    # Combine and save
    diffusion_data <- data.table::rbindlist(data_list) %>%
      arrange(Tube_ID)
    write.csv(diffusion_data, data_path, row.names = FALSE)
    print("Done.")
  } else{
    diffusion_data <- read.csv(data_path)
  }
  
  return(diffusion_data)
}




