a10 %>% 
  gg_subseries(Cost)+
  labs(y = '$M',
       title = 'Aus Diabetus Drugs')
holidays <- tourism %>% 
  filter(Purpose =='Holiday') %>% 
  group_by(State) %>% 
  summarise(Trips = sum(Trips))
holidays
autoplot(holidays, Trips)+
  labs(y = 'Overnights(000)',
       title = 'Aus domestic holidays')
gg_season(holidays, Trips)+
  labs(y = "overnight trips 000",
       title = "Aus domestic holidays")
holidays %>% 
  gg_subseries(Trips)+
  labs(y = "overnight trips 000",
       title = 'Aus dom holidays')
