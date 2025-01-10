library(BSol.mapR)
source("R/config.R")
source("R/functions.R")
dtube_data <- get_dtube_data() %>%
  group_by(Tube_ID) %>%
  summarise(
    LONG = mean(LONG), 
    LAT = mean(LAT),
    first_year = min(Year),
    last_year = max(Year),
    Useful = case_when(
      first_year < 2020 & last_year > 2020 ~ TRUE,
      TRUE ~ FALSE
    )
  )

LSOA21_NM_code <- LSOA21
LSOA21_NM_code@data <- LSOA21_NM_code@data %>%
  mutate(
    LSOA_NM_code = stringr::str_split_i(LSOA21NM, " ", 2)
    )

map <- plot_empty_map(
  map_title = "Diffusion Tube Locations", 
  map_type = "MSOA21", 
  area_name = "Birmingham"
) 

map <- add_points(
  map,
  dtube_data,
  color = "Useful" 
)

save_map(map, "output/planning/diffusion-tubes.html")
save_map(map, "output/planning/diffusion-tubes.png")