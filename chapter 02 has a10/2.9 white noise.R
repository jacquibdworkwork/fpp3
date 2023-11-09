# white noise time series

set.seed(700)
y <- tsibble(sample = 1:50, wn = rnorm(50), index = sample)
y %>% autoplot(wn)+labs(title = 'white noise', y = " ")

y %>% 
  ACF(wn) %>% 
  autoplot()+labs(title = 'white noise')
#white noise we expect each autocorrelation to be close to zero (inside the blue lines) - we expect 95% to be within abs(2/sqrtT where T is length of time series)