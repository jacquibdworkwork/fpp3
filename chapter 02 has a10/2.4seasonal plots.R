a10 %>% 
  gg_season(Cost, labels = 'both')+
  labs(y = '$M',
       title = 'Seasonal plot: Diabetus Drugs')

vic_elec %>% gg_season(Demand, period = 'day')+
  #consider that daylight savings time gives a day with 25 hrs and 23 hrs
  theme(legend.position = 'none')+
  labs(y = 'MWh',title = 'Elect demand: Vic')

vic_elec %>% gg_season(Demand, period = 'week')+
  theme(legend.position = 'none')+
  labs(y = 'MWh',title = 'Elect demand: Vic')
vic_elec %>% gg_season(Demand, period = 'year')+
  labs(y = 'MWh',title = 'Elect demand: Vic')
