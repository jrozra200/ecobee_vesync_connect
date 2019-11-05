# README

I wanted to do something very simple: if the temperature in my kids' rooms got 
too cold, turn on a smart outlet that powers a space heater. 

It turns out that ecobee and alexa do not have this capability built in - this 
makes sense. The thermostat does this natively with my central heater. My issue 
is that my house is old and has vastly different temperatures from upstairs to 
downstairs. 

To solve this, I am getting my temperature from the ecobee API, checking to see 
if it is too hot/cold, then taking appropriate action with my VeSync outlets.