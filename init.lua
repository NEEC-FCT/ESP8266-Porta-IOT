--init.lua
pin0=0
gpio.mode(pin0, gpio.OUTPUT)

wifi.setmode(wifi.STATION)


station_cfg={}
station_cfg.ssid="NEEC"
station_cfg.pwd="PASSWORD"
wifi.sta.config(station_cfg)
 tmr.alarm(1, 1000, 1, function()
 gpio.write(pin0, gpio.LOW)
 
 if wifi.sta.getip()== nil then
    print("IP unavaiable, Waiting...")
    gpio.write(pin0, gpio.HIGH)
     wifi.eventmon.register(wifi.eventmon.STA_DISCONNECTED, function(T) 
        print("\n\tSTA - DISCONNECTED".."\n\tSSID: "..T.SSID.."\n\tBSSID: "..
         T.BSSID.."\n\treason: "..T.reason.."\n")
       end)
 else
    tmr.stop(1)
    print("MAC address: " .. wifi.ap.getmac())
    print("IP :"..wifi.sta.getip())
    
    dofile ("json.lua")
    
 end
 end)
 
