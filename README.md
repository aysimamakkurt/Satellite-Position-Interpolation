# Satellite-Position-Interpolation

This project contains two MATLAB functions that work together to read satellite position data from an SP3 file and interpolate the positions for a specific time interval.

## Functions

1. `read_sp3file(filename)`: This function reads satellite position data from an SP3 file. The function takes the filename as an input and returns a matrix containing the position and clock data for each satellite at each time step.

2. `new(ts, prn, filename)`: This function uses the data read by `read_sp3file` to interpolate the positions of a specific satellite (given by `prn`) for a specific time interval (given by `ts`). The function returns a matrix containing the interpolated x, y, and z coordinates of the satellite.

## Usage

First, use the `read_sp3file` function to read the data from the SP3 file:


[sat] = read_sp3file('igs20491.sp3');

Then, use the new function to interpolate the positions for a specific satellite and time interval:

coordinates = new(300, 5, 'igs20491.sp3');

In this example, the positions of satellite 5 are interpolated for a time interval of 300 seconds.
Defining constants and variables: Constants such as the speed of light (c) and Earth’s rotation rate (wE) are defined. Variables such as rn (the satellites of interest) and R (pseudorange measurements) are also defined.
Calculating satellite emission time: The time of signal reception (t_rcv_reception) is defined, and the time of signal emission by the satellite (t_sat_emission) is calculated by subtracting the signal travel time (delta_t) from the reception time.
Lagrange interpolation: The Lagrange interpolation method is used to estimate the satellite coordinates (ru_sat_x, ru_sat_y, ru_sat_z) at the time of signal emission.
Calculating the receiver-satellite range: The range between the receiver and the satellite (new_delta_t) is calculated using the estimated satellite coordinates and the known receiver coordinates.
Applying Earth’s rotation correction: The Earth’s rotation during the signal travel time is accounted for by rotating the estimated satellite coordinates.
Calculating the difference: The difference between the rotated and original estimated satellite coordinates is calculated and converted to micrometers (diff).
This code is useful for applications in satellite navigation and positioning, such as GPS. It allows the user to determine the precise location of a satellite at a specific time based on pseudorange measurements and precise satellite ephemeris data.

Please note that this is a high-level explanation. For a detailed understanding, knowledge of satellite navigation principles and MATLAB programming is required.

Plotting
The new function also generates plots of the interpolated coordinates. These plots can be used to visualize the movement of the satellite over time.

