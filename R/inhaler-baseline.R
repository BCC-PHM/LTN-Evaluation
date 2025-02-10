# Basic inhaler prescriptions baseline analysis

library(readxl)
library(dplyr)
library(ggplot2)
library(BSol.mapR)

LTN_LSOAs <- c("E01009186", "E01009184", "E01009187", "E01009186",
               "E01009188", "E01009177", "E01009178", "E1009189",
               "E01009176", "E01009175", "E01008981", "E01009179",
               "E01008932", "E01008933")


inhaler_data <- read_excel(
  "//svwvap1126.addm.ads.brm.pri/PHSensitive$/Intelligence/PHM/2025/LTN/Inhaler-prescriptions.xlsx",
  sheet = "Data"
  ) %>%
  mutate(
    LTN = PatientLSOA %in% LTN_LSOAs
  )

#############################################################
#          Plot number of yearly inhalers in LTN            #
#############################################################

inhaler_data %>%
  filter(
    LTN,
    FiscalYear != "2024/25"
  ) %>%
  tidyr::separate(FiscalYear, into = c("YearStart", NA), sep = "/") %>%
  mutate(YearStart = as.numeric(YearStart)) %>%
  group_by(YearStart, AgeGroup) %>%
  summarise(ItemCount = sum(ItemCount)) %>%
  ggplot(aes(x = YearStart,y = ItemCount, color = AgeGroup)) +
  geom_line() +
  geom_point() +
  theme_bw() +
  labs(
    y = "Yearly Number of Inhalers Prescribed"
  ) +
  ylim(
    0, 4000
  )

ggsave("output/figures/LTN-inhaler-baseline.png")

#############################################################
#                 Map total prescriptions                   #
#############################################################

inhaler_lsoa_count <- inhaler_data %>%
  rename(LSOA11 = PatientLSOA) %>%
  group_by(LSOA11) %>%
  summarise(
    avg_inhalers = sum(ItemCount)/6
    )

map <- plot_map(
  inhaler_lsoa_count,
  "avg_inhalers",
  map_type = "LSOA11",
  area_name = "Birmingham",
  fill_missing = NA,
  style = "cont",
  fill_title = "Average yearly number of inhalers prescribed",
  breaks = c(0, 500, 1000, 1500, 2000)
)
map

save_map(map, "output/figures/baseline-inhaler-map.png")