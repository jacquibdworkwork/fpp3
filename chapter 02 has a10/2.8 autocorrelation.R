library(fpp3)
# autocorrelation is linear relationship btw lagged values of ts

recent_production %>% ACF(Beer, lag_max = 9)
recent_production %>% 
  ACF(Beer) %>% 
  autoplot()+labs(title = 'aus beer prod')
# lag 4 higher than other lags - suggests seasonal pattern peaks 4 periods apart and troughs 4 periods apart
# lag 2 is more negative than other lags - suggests troughs are 2 periods behind peaks
# dashed blue lines indicate whether the correlations are significantly different than zero

# TREND AND SEASONALITY IN ACF PLOTS
#when data have a trend, autocorrelations for SMALL LAGS tend to be LARGE and POSITIVE - b/c obs nearby in time are also nearby in value. the ACF of a trended time series tends to have positive values that slowly decrease as the lags increase.
#seasonal data autocorrelations will be larger for the seasonal lags(at multiples of the seasonal period) than for other lags.
#if trended and seasonal will see a combination of these effects.
PBS %>% 
  filter(ATC2 == "A10") %>% 
  select(Month, Concession , Type, Cost) %>% 
  summarise(TotalC = sum(Cost)) %>% 
  mutate(Cost = TotalC/1e6)->a10
a10 |>
  ACF(Cost, lag_max = 48) |>
  autoplot() +
  labs(title="Australian antidiabetic drug sales")
#the slow descrease in the ACF as the lags increase is due to the trend - the scalloped shape is due to seasonality