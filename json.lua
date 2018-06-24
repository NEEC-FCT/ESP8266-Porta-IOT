pin1=1
pin2=2
gpio.mode(pin1, gpio.OUTPUT)
gpio.mode(pin2, gpio.INPUT)
  gpio.write(pin1, gpio.LOW)

tmr.alarm(1, 5000, 1, function()

print("testing")

    http.get("URL", nil, function(code, data)
        if (code < 0) then
          print("HTTP request failed")
        else
          local t = sjson.decode(data)
          if (t.porta == 1) then
            gpio.write(pin1, gpio.HIGH)
            tmr.delay(4000000)  
             gpio.write(pin1, gpio.LOW)
          end
    
          
      end
      end)
      
end)

  
