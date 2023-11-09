# forecasting method depends on what data is available

# no data available or data on hand not relevant to forecast them
# QUALITATIVE FORECASTING must be used -- see chapter 6.

#QUANTITATIVE FORECASTING must satisfy 2 conditions
  # numerical information about the past is available
  # it is reasonable to assume that some aspects of the past 
  # patterns will continue into the future

# wide range of quantitative forecasting methods, developed in
# specific purposes. own properties, accuracies, and costs that must
# be considered when choosing a specific method
# time series data(collected in regular intervals), 
# cross-sectional data(single point in time)

# simplest time series forecasting methods only use info available 
# make no attempt to discover other factors affecting behavior
# extrapolate trend and seasonal patterns - ignores all other info
# marketing initiatives, competitor activity, 
# changing economic conditions, etc

# Decomposition methods are helpful study trend and seasonal patterns
# in time series (chapter 3)

# PREDICTOR VARIABLES and time series forecasting
# EXPLANATORY MODEL uses predictor variables and an error value to
# explain the result then these are formed into a time series ex:
# electricity demand
  # ED = f(current temp, economy strength, population, time of day
  #         day of week, error)
  # ED(sub t+1)= f(ED(sub t), ED(sub t-1), ED(sub t-2), ...,error)
# using the past to  predict the future - but doesn't use external
# variables that might effect the system
# another type of model combines the 2 above. 
  # ED(sub t+1)= f(ED (sub t), current temp, time of day, day of wk, error)
# known as dynamic regression models, panel data models, longitudinal models,
# transfer function models, liner system models(if f is linear)
# explanatory models useful b/c incorporates info about other variables
# not just historical values - there are reasons why to select time
# series model rather than explanatory or mixed model.
  # 1. system is not understood or difficult to measure relationships
  #  assume to govern  behavior
  #2. need to know or forecast future values of various predictors 
  # to forecast variable of interest - and it is too difficult
  #3. the main reason is to predict what will happen, but not know
  # why it happens
  # 4. ts model may be more accurate


