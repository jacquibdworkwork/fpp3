library(fpp3)
# first step in classical decomposition is moving average method to estimate the trend-cycle.

global_economy %>% 
  filter(Country =='Australia') %>% 
  autoplot(Exports)+
  labs(y = "% GDP", title = "total Aus exports")
aus_export <- global_economy %>% 
  filter(Country=="Australia" %>% )