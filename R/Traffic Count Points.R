library("BSol.mapR")
library(dplyr)
library(stringr)

# load point data
points_data <- load_data(
  "../data/TrafficPoints.csv") %>%
  select("count_point_id",  "LAT", "LONG")

# load count data
count_data <- load_data(
  "../data/average_annual_daily_counts.csv"
) %>%
  select("count_point_id", "year")

# join count data to point data
points_data <- points_data %>%
  left_join(count_data, by = "count_point_id")

# create df with 1 row for each location including min and max years
points_data <- points_data %>%
  group_by(count_point_id, LAT, LONG) %>%
  summarise(
    first_year = min(year, na.rm = TRUE),
    last_year = max(year, na.rm = TRUE)
  )

# create a new column where TRUE if min before 2020 and max after 2020
points_data <- points_data %>%
  mutate(
    Useful = case_when(
      first_year < 2020 & last_year > 2020 ~ TRUE,
      TRUE ~ FALSE
    )
  )

# plot base map
map <- plot_empty_map(
  map_type = "Ward",
  area_name = "Birmingham"
)

# filter for just useful points
useful_points <- points_data %>%
  filter(Useful == TRUE)


# plot map with useful points
useful_points_map <- add_points(
  map,
  useful_points,
  size = 0.06
)

save_map(useful_points_map, "../output/useful_points_map.PNG")
save_map(useful_points_map, "../output/useful_points_map.html")


# plot map with all points grouped by useful
points_map <- add_points(
  map,
  points_data,
  size = 0.06,
  color = "Useful",
  palette = "BuPu"
)

save_map(points_map, "../output/grouped_points_map.PNG")
save_map(points_map, "../output/grouped_points_map.html")

