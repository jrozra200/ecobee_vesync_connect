library(httr)
library(jsonlite)

bcreds <- read.csv("ecobee.config")

refresh <- paste0("https://api.ecobee.com/token?grant_type=refresh_token&code=",
                  creds$refresh_token[1], "&client_id=", creds$client_id[1])

ref <- POST(refresh)

at <- gsub("(^.*access_token\": \")(\\w+)(\".*$)", "\\2", as.character(ref))
rt <- gsub("(^.*refresh_token\": \")(\\w+)(\".*$)", "\\2", as.character(ref))

creds <- data.frame(access_token = at,
                    refresh_token = rt,
                    client_id = creds$client_id[1])

write.csv(creds, "ecobee.config", row.names = FALSE)

therm <- paste0("curl -s -H 'Content-Type: text/json' -H 'Authorization: Bearer ",
                creds$access_token[1] , "' 'https://api.ecobee.com/1/thermostat?",
                "format=json&body=\\{\"selection\":\\{\"selectionType\":\"regi",
                "stered\",\"selectionMatch\":\"\",\"includeSensors\":true\\}",
                "\\}' > response.json")

system(therm)

response <- read_json("response.json")

info <- data.frame()
for(sensor in 1:3){
    name <- response$thermostatList[[1]]$remoteSensors[[sensor]]$name
    temp <- as.numeric(response$thermostatList[[1]]$remoteSensors[[sensor]]$capability[[1]]$value) / 10
    
    tmp <- data.frame(name = name,
                      temp = temp)
    tmp$time_utc <- response$thermostatList[[1]]$utcTime
    tmp$time_local <- response$thermostatList[[1]]$thermostatTime
    
    info <- rbind(info, tmp)
}

info$name <- tolower(gsub("'s Room", "", info$name))
info <- info[info$name != "my ecobee", ]

info$action <- ifelse(info$temp < 70, "on", 
                      ifelse(info$temp > 74 ~ "off", 
                             "no action"))

if(dim(info[info$action != "no action", ])[1] > 0 ){
    for(python in 1:dim(info[info$action != "no action", ])[1]){
        py_cmd <- paste0("python3 vesync.py ", info$name[python], " ", 
                         info$action[python])
        
        system(py_cmd)
    }
}

