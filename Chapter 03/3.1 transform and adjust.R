library(fpp3)
# Adjusting historical data can lead to simpler ts. 
#Calendar adjustments
  #variation in seasonal data may be due to simple calendar effects. Simplify by removing variation bf doing analysis. ie. Number of trading days in calendar month - avg sales/trading day and not just total sales in month
#Population adjustments
  #adjust with per-capita data - when dat affected by pop changes.

global_economy %>% 
  filter(Country == "Australia") %>% 
  autoplot(GDP/Population)+
  labs(title = "GDP per capita", y = 'us$')
#Inflation adjustments
  #adjust value of money before modelling. state all dollar values in value of a particular year. Use a price index - see the CPI see example below
print_retail <- aus_retail |>
  filter(Industry == "Newspaper and book retailing") |>
  group_by(Industry) |>
  index_by(Year = year(Month)) |>
  summarise(Turnover = sum(Turnover))
aus_economy <- global_economy |>
  filter(Code == "AUS")

print_retail |>
  left_join(aus_economy, by = "Year") |>
  mutate(Adjusted_turnover = Turnover / CPI * 100) |>
  pivot_longer(c(Turnover, Adjusted_turnover),
               values_to = "Turnover") |>
  mutate(name = factor(name,
                       levels=c("Turnover","Adjusted_turnover"))) |>
  ggplot(aes(x = Year, y = Turnover)) +
  geom_line() +
  facet_grid(name ~ ., scales = "free_y") +
  labs(title = "Turnover: Australian print media industry",
       y = "$AU")
#Mathematical transformations
  # variation that increases or decreaes with the level of the series, then transform wtih math. log, power, box-cox
lambda <- aus_production |>
  features(Gas, features = guerrero) |>
  pull(lambda_guerrero)
aus_production |>
  autoplot(box_cox(Gas, lambda)) +
  labs(y = "",
       title = latex2exp::TeX(paste0(
         "Transformed gas production with $\\lambda$ = ",
         round(lambda,2))))
