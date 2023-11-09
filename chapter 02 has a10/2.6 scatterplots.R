vic_elec %>% 
  filter(year(Time)==2014) %>% 
  autoplot(Demand)+
  labs(y ="GW",
       title = "Half-hr elec demand: Vic")
vic_elec %>% 
  filter(year(Time)==2014) %>% 
  autoplot(Temperature)+
  labs(y ="GW",
       title = "Half-hr temps: melbourne")
vic_elec %>% 
  filter(year(Time)==2014) %>% 
  ggplot(aes(x = Temperature, y = Demand))+
  geom_point()+
  labs(x = 'temp C',
       y = 'elec demand gw')
# Correlatoin  - common to measure the strenght of the linear relationship
  #btw 2 variables 
  #sum of (x at a time minus the avg x )X (y at a time minus the avg y)
    # divided by the sqrt(x - xmean)squared X sqrt(y-ymean)squared
      #r is always between -1 and 1 
#!!! only measures strength of linear relationship - correlations
  #can be misleading if you don't look at the graph
#scatterplot matrices
vis <- tourism %>% 
  group_by(State) %>% 
  summarise(Trips = sum(Trips))
vis %>% 
  ggplot(aes(x = Quarter, y= Trips))+
  geom_line()+
  facet_grid(vars(State), scales = 'free_y')+
  labs(title = 'aus dom tour',
       y ='overnights 000')

vis %>% 
  pivot_wider(values_from = Trips, names_from = State) %>% 
  GGally::ggpairs(columns = 2:9)
