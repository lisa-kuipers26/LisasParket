library(dslabs)
library(tidyverse)

#filter op alleen nederland tussen bepaalde jaren
gapminder_netherlands <- gapminder %>% select("country","year","population","gdp","infant_mortality","life_expectancy","fertility") %>%
  filter(year %in% (2002:2011),
         country=="Netherlands")

#opslaan als raw data en data die uit package gebruikt kan worden
write_csv(gapminder_netherlands, "data-raw/gapminder_netherlands.csv")
save(gapminder_netherlands, file = "data/gapminder_netherlands.rda")
