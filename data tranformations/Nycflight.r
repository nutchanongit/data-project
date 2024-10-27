library(tidyverse)
library(nycflights13)
library(dplyr)
View(flights)
flights


#calculate deley total delay each carrier
arr_deley <-
  flights %>%
  select(arr_delay,carrier) %>%
  filter(!is.na(arr_delay),arr_delay > 0) %>%
  group_by(carrier) %>%
  summarise(total_arr_delay= sum(arr_delay)) %>%
  arrange(desc(total_arr_delay))

dep_delay <- flights %>%
  select(dep_delay, carrier) %>%  # Select dep_delay instead of arr_delay
  filter(!is.na(dep_delay), dep_delay > 0) %>% # Filter for non-missing and positive dep_delays
  group_by(carrier) %>%
  summarise(total_dep_delay = sum(dep_delay)) %>% # Calculate total departure delay
  arrange(desc(total_dep_delay))

arr_deley %>%
  full_join(dep_delay , by = "carrier" ) %>%
  mutate(total_deley = total_dep_delay + total_arr_delay ) %>%
  arrange(desc(total_deley))

# count carrier
total_carrier <-
  flights %>%
  select(carrier) %>%
  distinct(carrier)%>%
  summarise(amount = n())

help(summarise)

## 3. Airtime average for each carrier
flights %>%
  select(air_time, carrier) %>%
  drop_na() %>%
  group_by(carrier) %>%
  summarise(average_airtime = mean(air_time))

##4. How many flights arrive late and arrive early in May 2013?
flights %>%
  select(arr_delay,carrier,flight,year,month) %>%
  filter(year == 2013 , month == 3) %>%
  mutate(late_or_early = ifelse(arr_delay > 0, "late", ifelse(arr_delay < 0,"early","ontime"))) %>%
  drop_na() %>%
  group_by(late_or_early) %>%
  summarise(flight_count= n())
