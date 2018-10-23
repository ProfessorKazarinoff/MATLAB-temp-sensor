%% Using MATLAB to read serial output from an Arduino in real time
% created by a student group in ENGR114 at Portland Community College

%% MATLAB Environment setup

clc;                        % Clears the command line                      
clear;                      % Erases all variables in the workspace
close all;                  % Closes all open plot windows
delete(instrfindall);       % Clears any existing serial ports

%% Open The Serial Port To Connect To The Arduino
% Check the serial port that the Arduino is connected to by:
% Going to the Control Panel --> Hardware and Sound --> Devices and Printers
% and right click: FT231X USB UART, select Properties and then look under
% Hardware Tab

% Change 'COM4' to whichever port the Arduino is connected to.
arduino = serial('COM4','BaudRate',9600);    % Creates a serial connection through COM4
fopen(arduino);                              % Opens the serial to transmission

%% Set-Up and Create The Animated Figure

figure(1)                % Assigns to the first plot window
h = animatedline;        % Creates an animated plot line based on moving data output
ax = gca;                % gca - get current axis. Allows axis to be modified
ax.YGrid = 'on';         % Adds a grid to the plot
ax.YLim = [0 200];       % This is the serial output range, so the y-axis range

Num_data = input('Enter the desired number of data points: ');  % User-defined value for total data points plotted
x = linspace(1,Num_data,Num_data);                              % x can be changed to alter the number of data points 
startTime = datetime('now');                                    % Saves the current time

%% Collect Serial Data From The Arduino

serial_data = zeros(500,1);                      % Initializes data variable matrix at 0 so for loop begins
for i = 1:length(x)
    serial_read = fscanf(arduino,'%f');          % Reads to serial output as text
    serial_data(i) = fscanf(arduino,'%f');       % Saves the serial output as text
    
    t = datetime('now') - startTime;             % Updates the time for current data point
    addpoints(h,datenum(t),serial_read)          % Adds the data point to the figure
    
    ax.XLim = datenum([t-seconds(15),t]);        % Updates the axes for new points
    datetick('x','keeplimits')                   % Updates tick marks
    drawnow                                      % Draws in the data point
end

%% Plots a Nice Graph

figure(2);                              % Assigns to the second plot window
t2 = linspace(1,15,500);                % Creates new variable for time that looks better for graphing
Z = plot(t2, serial_data);              % Plots the serial_data from above vs the new time variable
% Additions to the graph for reference and identification
xlabel('Time (Seconds)');               % x-axis label
ylabel('Temperature (Fahrenheit)');     % y-axis label
title('Temperature vs. Time');          % Inserts a title to the plot
legend('Temperature');                  % Adds a legend to the plot 
ylim([0 200]);                          % Defines the axis limits
grid;                                   % Turns on grid

%% Close The Arduino Serial Object
fclose(arduino);                        % Closes the serial channel
clear(arduino);
delete arduino;
disp('Serial Port is closed')

%% Plots a Nice Graph

figure;                                 % Inserts new figure
t2 = linspace(1,15,500);                % Creates new variable for time that looks better for graphing
Z = plot(t2, serial_data);              % Plots the serial_data from above vs the new time variable
                                        % Additions to the graph for reference and identification
xlabel('Time (Seconds)');               % x-axis label
ylabel('Temperature (Fahrenheit)');     % y-axis label
title('Temperature vs. Time');          % Graph title
legend('Temperature');                  % Legend of data series
ylim([0 200]);                          % Axis limit
grid;                                   % Grid is turned on
