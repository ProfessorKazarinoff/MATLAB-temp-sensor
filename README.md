# MATLAB-temp-sensor
A student project for ENGR114 at Portland Community College. Uses MATLAB to read a temperature sensor connected to an Arudino over serial.

## Problem Statement
For our final lab our group was
tasked with setting up a temperature sensor
for the hydroponic fish tank-garden shown
to the right. This sensor will be used to
monitor the water supply for the garden.
Using Arduino and MATLAB the water
temperature will be recorded over a set
amount of time with the temperature
displayed at regular intervals. A plot of the
temperature as a function of time will also
be generated for a visual representation of
the temperature. This will be used to order
to monitor the temperature of the water in
the garden and subsequently the conditions
of said garden.

## Hardware Setup

![Alt-text](/doc/temp_sensor1.jpg "Alt-title")

Arduino is connected to the computer via a mini-USB (connector shown at right of
photo). The temperature sensor is connected to the Arduino through a breadboard that
incorporates a pull-up resistor to keep input voltage up. Connections as follows: red wire of
sensor is input, green is signal, black is ground, these are connected to three different rows on
the breadboard. The red, white and black jumpers connect the breadboard to the Arduino with
the following ports, 3.3V, Digital-7 and GND (respectively). The resistor is placed between the
signal wire and input for the Arduino.


## Future Work
This is a great starting point for future work with the hydroponic fish-garden. This
program could be used to get baseline values for the temperature and use those values for
further changes to the conditions. If the temperature is too low a program could be written to
turn on a heater until the water reaches a certain temperature. If the temperature is too high the
same program could be used to turn off said heater. Long term monitoring could be used to find
trends that correlated to any number of factors, plant cycle, fish health, plant health, etc. Inconjunction with software from other groups this garden could be almost fully automated and
controlled remotely via a wi-fi connection.
