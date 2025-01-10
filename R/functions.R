# Download tube data
source("R/config.R")
library(dplyr)
library(sf)

# Convert British National Grid coordinates
OSGB_convert <- function(
    df
) {
  # Convert to an sf object, specifying the EPSG code for OSGB36 (EPSG:27700)
  osgb_coords <- st_as_sf(df, coords = c("Easting", "Northing"), crs = 27700)
  
  # Transform to WGS84 (EPSG:4326 for latitude and longitude)
  wgs_coords <- st_transform(osgb_coords, crs = 4326)
  
  # Store the results
  lat_and_long <- st_coordinates(wgs_coords)
  df$LONG <- lat_and_long[,"X"]
  df$LAT <- lat_and_long[,"Y"]
  return(df)
}

# Download diffuser tube data from http://62.65.40.208/
get_dtube_data <- function(
    redownload = FALSE
) {
  
  data_path <- "data/diffusion-tubes.csv"

  # If the diffusion tube data doesn't exist, then download the data
  if (!file.exists(data_path)|redownload) {
    print("Downloading data...")
    
    diffusion_url_prefix <- "http://62.65.40.208/cgi-bin/birmingham/apub.exportDiffTube.cgi/graph.txt?outtype=txt&from="
    download_path <- paste0("C:/Users/",usr_name,"/Downloads/graph.txt")
    
    column_names <- c("Year", "Tube_ID", "Address", "Easting", 
                      "Northing", "Area_Type", "Recorded_Value")
    
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
    
    # Convert coordinates to long and lat
    diffusion_data <- OSGB_convert(diffusion_data)
    
    # Save output
    write.csv(diffusion_data, data_path, row.names = FALSE)
    print("Done.")
  } else{
    diffusion_data <- read.csv(data_path)
  }
  
  return(diffusion_data)
}




