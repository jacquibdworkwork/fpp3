# lag ####
library(fpp3)
recent_production <- aus_production %>% 
  filter(year(Quarter)>=2000)
recent_production %>% 
  gg_lag(Beer, geom = 'point')+
  labs(x = 'lag beer, k')

#plot shows that strong positive linear correlation reflects strong seasonality in data
#negative correlation are the dips
#peaks in quarter 4 (lag 4 and 8) dips in quarter 2 (lag 2 and 6)