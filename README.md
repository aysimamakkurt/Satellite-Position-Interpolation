# Satellite-Position-Interpolation

This project contains two MATLAB functions that work together to read satellite position data from an SP3 file and interpolate the positions for a specific time interval.

## Functions

1. `read_sp3file(filename)`: This function reads satellite position data from an SP3 file. The function takes the filename as an input and returns a matrix containing the position and clock data for each satellite at each time step.

2. `new(ts, prn, filename)`: This function uses the data read by `read_sp3file` to interpolate the positions of a specific satellite (given by `prn`) for a specific time interval (given by `ts`). The function returns a matrix containing the interpolated x, y, and z coordinates of the satellite.

## Usage

First, use the `read_sp3file` function to read the data from the SP3 file:

```matlab
[sat] = read_sp3file('igs20491.sp3');

Then, use the new function to interpolate the positions for a specific satellite and time interval:

coordinates = new(300, 5, 'igs20491.sp3');

In this example, the positions of satellite 5 are interpolated for a time interval of 300 seconds.

Plotting
The new function also generates plots of the interpolated coordinates. These plots can be used to visualize the movement of the satellite over time.

