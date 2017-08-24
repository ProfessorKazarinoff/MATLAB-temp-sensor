%% Using MATLAB to read serial output from an Arduino in real time

%% Clear variables, Command line, Figures and Any Existing Serial Ports

clc;
clear;
close all;
delete(instrfindall);               % Clears any existing serial ports

%% Open The Serial Port To Connect To The Arduino
% Change 'COM4' to whichever port the arduino is connected to

arduino = serial('/dev/cu.usbserial-DN02SRFE','BaudRate',9600);
fopen(arduino);

%% Set-Up and Create The Animated Figure

figure
h = animatedline;
ax = gca;              % gca - get current axis. Allows axis to be modified.
ax.YGrid = 'on';       % Adds a grid on the plot.
ax.YLim = [0 200];     % This is the serial output range

x = linspace(1,500,500);           % x can be changed to change the number of data points 
startTime = datetime('now');       % Saves the current time

%% Collect Serial Data From The Arduino

serial_data = zeros(500,1);             % Initializes data variable matrix at 0
for i = 1:length(x)
    serial_read = fscanf(arduino,'%f');          % Reads to serial output
    serial_data(i) = fscanf(arduino,'%f');       % Saves the serial output
    
    t =  datetime('now') - startTime;            % Updates the time for current data point
    addpoints(h,datenum(t),serial_read)          % Adds the data point to the figure
    
    ax.XLim = datenum([t-seconds(15) t]);        % Updates the axes for new points
    datetick('x','keeplimits')                   % Updates tick marks
    drawnow                                      % Draws in the data point
end

%% Plots a Nice Graph

figure;                           % Inserts new figure
t2 = linspace(1,15,500);          % Creates new variable for time that looks better for graphing
Z = plot(t2, serial_data);        % Plots the serial_data from above vs the new time variable
% Additions to the graph for reference and identification
xlabel('Time (Seconds)');               % x-axis label
ylabel('Temperature (Fahrenheit)');     % y-axis label
title('Temperature vs. Time');          % Graph title
legend('Temperature');                  % Legend of data series
ylim([0 200]);                          % Axis limit
grid;                                   % Grid is turned on

%% Close the serial port
fclose(arduino);
delete(arduino)
clear arduino;
disp('Serial Port is closed')
