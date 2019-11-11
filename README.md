# What is this?

I wanted to do something very simple: if the temperature in my kids' rooms got 
too cold, turn on a smart outlet that powers a space heater. 

It turns out that ecobee and alexa do not have this capability built in - this 
makes sense. The thermostat does this natively with my central heater. My issue 
is that my house is old and has vastly different temperatures from upstairs to 
downstairs. 

To solve this, I am getting my temperature from the ecobee API, checking to see 
if it is too hot/cold, then taking appropriate action with my VeSync outlets.

# My Equipment

I have an [Ecobee 3 lite](https://www.ecobee.com/ecobee3-lite/) with two 
[Smart Sensors](https://www.ecobee.com/en-us/smart-sensor/). I am also using 
[Etekcity Voltson Smart WiFi Outlets](http://www.vesync.com/esw01usa). 

That's the "smart" bit. To heat the rooms, I am just using your run-of-the-mill 
space heaters I got at Home Depot or something... 

# Getting Started

To start, you need to 
[create an app and authenticate with Ecobee](https://github.com/jrozra200/ecobee_vesync_connect/blob/master/initiating_ecobee_login.md).

VeSync is a bit easier to authenticate. Download the [app](https://itunes.apple.com/us/app/vesync/id1289575311?mt=8) 
and create a login. You'll use that login for the 
[script](https://github.com/jrozra200/ecobee_vesync_connect/blob/master/vesync.py).

## R Requirements

You'll just need a few packages installed to run the R bit:

1. lubridate
2. httr
3. jsonlite

You can run this line of code: 

```
install.packages(c("lubridate", "httr", "jsonlite"))
```

## Python Requirements

There are 4 packages called, but 2 should be installed with your system already. 

1. datetime
2. sys

The other 2, you'll need to install:

1. pandas
2. pyvesync

You can do that with this code:

```
pip3 install pandas
pip3 install pyvesync
```
