# 678a6345

# Install
first install the R package "devtools" if not installed

* devtools::install_github('unimi-dse/678a6345')

!!!NOTE: if you install R first time you can see the error: cannot remove prior installation of package 'digest'; in di case you need install first the package "digest" and after you can install the package "aapltrend" [devtools::install_github('unimi-dse/678a6345')].

# Require
* library(aapltrend)

# Usage
* type in the console | data_acquisition(): you can see all storic Apple stocks trend; source of data Yahoo: Date, AAPL.Open, AAPL.High, AAPL.Low, AAPL.Close, AAPL.Volume, AAPL.Adjusted
* type in the console | last_days(df): you can see filtered Apple stocks trend of the last 90 days
* type in the console | create_graph(aaplt): you can see the graphic with the variation of Apple stocks in the last 90 days 

# Help
* ?data_acquisition
* ?create_graph
* ?last_days

