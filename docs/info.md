## How it works

This project implements a simplified digital controller for a polyhouse automation system.

The design takes digital sensor status inputs from soil, temperature, and humidity conditions. Based on these inputs, it generates control outputs for pump, fan, mist, risk alert, healthy status, and manual mode indication.

Input mapping:
- ui[0] = Soil dry input
- ui[1] = Temperature high input
- ui[2] = Humidity abnormal input
- ui[3] = Manual mode input

Output mapping:
- uo[0] = Pump ON
- uo[1] = Fan ON
- uo[2] = Mist ON
- uo[3] = Risk Alert
- uo[4] = Healthy Status
- uo[5] = Manual Status

When soil is dry, the pump output becomes ON. When temperature is high, the fan output becomes ON. When humidity is abnormal, the mist output becomes ON. If any abnormal condition is detected, the risk alert output becomes ON. If all conditions are normal, the healthy status output becomes ON.

## How to test

Open the Wokwi project linked in this repository and change the input switches.

Test cases:

1. Soil dry = 1, Temperature high = 0, Humidity abnormal = 0  
   Expected output: Pump ON and Risk Alert ON.

2. Soil dry = 0, Temperature high = 1, Humidity abnormal = 0  
   Expected output: Fan ON and Risk Alert ON.

3. Soil dry = 0, Temperature high = 0, Humidity abnormal = 1  
   Expected output: Mist ON and Risk Alert ON.

4. Soil dry = 0, Temperature high = 0, Humidity abnormal = 0  
   Expected output: Healthy Status ON.

5. Manual mode = 1  
   Expected output: Manual Status ON.
