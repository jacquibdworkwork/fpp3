library(fpp3)
melsyd_economy <- ansett |>
  filter(Airports == "MEL-SYD", Class == "Economy") |>
  mutate(Passengers = Passengers/1000)
autoplot(melsyd_economy, Passengers) +
  labs(title = "Ansett airlines economy class",
       subtitle = "Melbourne-Sydney",
       y = "Passengers ('000)")
autoplot(a10, Cost)+
  labs(y = '$(millions)',
       title = 'Aus diabetus drugs')
#autoplot() to see the time series