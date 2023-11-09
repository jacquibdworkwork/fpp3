library(fpp3)
y <- tsibble(
  Year = 2015:2019,
  Observation = c(123, 39, 78, 52, 110),
  index = Year # this sets the time series
)
y # a tsibble()

z <- tibble(
  Month = c( '2019 Jan', '2019 Feb','2019 Mar','2019 Apr','2019 May'),
  Observation = c(50, 23, 34, 30, 25)
  )

z %>% mutate(Month = yearmonth(Month)) %>% 
  as_tsibble(index = Month)

head(PBS)
PBS %>% 
  filter(ATC2 == "A10") %>% 
  select(Month, Concession , Type, Cost) %>% 
  summarise(TotalC = sum(Cost)) %>% 
  mutate(Cost = TotalC/1e6)->a10
head(a10)

prison <- readr::read_csv("https://OTexts.com/fpp3/extrafiles/prison_population.csv")

prison <- prison |>
  mutate(Quarter = yearquarter(Date)) |>
  select(-Date) |>
  as_tsibble(key = c(State, Gender, Legal, Indigenous),
  #for this to be valid requires unique index for each combo of keys or error
             index = Quarter)
prison

#Seasonal period is number of observations before the seasonal pattern repeats
  #most cases automatically detected using the time index variable
# quarterly, monthly, and weekly data only one seasonal period - number of obs 
  #w/in each year
#Most seasonal models only support integer seasonal periods.
#data observed more than once per week, then there is often more than one seasonal period
#daily obs might have wkly(period = 7) or annual (period = 365.25) seasonal patterns
#more complicated and unusual seasonal patterns use period() function
  #in lubridate package
