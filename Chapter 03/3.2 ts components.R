#additive decomposition adds the seasonal component, the trend cycle, and the remainder component 
# multiplicative decomposition multiplies those terms
#additive most appropriate if magnitude of seasonal fluctuations or variation around the trend cycle does not vary with the level of the ts.
#multiplicative most appropriate when seasonal pattern or variation in trend proportional to level of ts - most common with economic ts.
#alternative to multiplicative decomp is first transform data until variation appears stable over time - then use additive decomp a log transform is the same as using multiplicative

#decomp example
us_retail_employment <- us_employment |>
  filter(year(Month) >= 1990, Title == "Retail Trade") |>
  select(-Series_ID)
autoplot(us_retail_employment, Employed) +
  labs(y = "Persons (thousands)",
       title = "Total employment in US retail")

#using the STL decomposition method
dcmp <- us_retail_employment |>
  model(stl = STL(Employed))
components(dcmp)

components(dcmp) |>
  as_tsibble() |>
  autoplot(Employed, colour="gray") +
  geom_line(aes(y=trend), colour = "#D55E00") +
  labs(
    y = "Persons (thousands)",
    title = "Total employment in US retail"
  )
# the trend line shows the overall movement ignoring any seasonality and random fluctuations.
#plot the components in a single figure
components(dcmp) %>% autoplot()
#note the bars on the left guage the scale - the remainder is the smallest scale
#removing the seasonal componet leaves teh seasonally adjusted data.

components(dcmp) |>
  as_tsibble() |>
  autoplot(Employed, colour = "gray") +
  geom_line(aes(y=season_adjust), colour = "#0072B2") +
  labs(y = "Persons (thousands)",
       title = "Total employment in US retail")
#if not concerned with seasonality, then the seasonally adjusted series can be useful. ie monthly unemployment data are usually seasonlly adjusted to highlight variation due to underlying state of the economy and not the seasonal variation.
#If purpose is to look for turinging points in series and interpret any changes in direction, then it is bettwe to use the trend cylce component rather than seasonally adjusted data