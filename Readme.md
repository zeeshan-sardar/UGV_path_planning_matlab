# Path Planning on 3D Terrain using Matlab

## Introduction
The goal of this project is to find the optimal path for a ground robot on a Digital Elevation Model (DEM) with the ability to not move on an elevation of more than 30 degrees. The DEM was captured using flaying drones with mounted cameras. These captured images were processed to generate the 3D elevation model.  
First of all, the 3D model was loaded into matlab workspace using `loadawobj` function. This fucntion returns a struct including vertices, faces and normals to vertices. The vertex normals is the most important feature to find the elevation at every vertex of the terrain. To find the levation angle, an angle between vertex normal and horizontal plane normal is computed because this angle is same as the angle between terrain face and horizontal axis. After that, angle thersholding is done and binary occupancy grid map was geenrated to input to the path planning algorithm which is A* in this case. At the end, the optimal path is plotted on the occupancy grid. 

## Testing
The repository contains a main file named `main.m` which does everything from loading the model to finding the path and dispalying that on occupancy grid. There are many helper functions as well being called in this main file.  
Figure below shows the path computed by A* on occupancy gird.

[Path Planning](./figures/path_planning.png)

