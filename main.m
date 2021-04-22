% set the start and goal points
start = [200 300];
goal = [600 600];

%% Load the model
% load the saved variables of texture.obj or load a new 3D-model.
load_new_model = false;
if load_new_model
    modelname='data/texture.obj';
    S=loadawobj(modelname);
    if isfield(S,'mtllib') 
        mtl=loadawmtl('data/half_sliced.mtl');
    end
    drawaw(S,mtl)
    view(-24,36);
    light
    snapnow;
    pause(1)
else
    load('data/texture.mat')
end

%% Compute Terrain Angles
% set the reference vector (normal to horizontal plane) to compute the 
% angle between vertex normals and this reference vector
ref_vec = [0;1;0];
ref_vec = repmat(ref_vec,1,length(S.vn));
angles = rad2deg(acos(dot(ref_vec,S.vn)));

%% Create Binary Occupancy Grid
% set the threshold angle
p = angles>30;
% map angles array to 2D matrix
half_len = floor(sqrt(length(p)));
p_2d = reshape(p(1:half_len^2),half_len,[]);
% binary occupancy grid object
map = binaryOccupancyMap(p_2d);

%% Path Planning (A*)
% Create path planner object
planner = plannerAStarGrid(map);
% find the optimal path
plan(planner,start,goal);

%% Plot the path
ax = show(planner);
title('Path Planning using A*');
ylabel('y-Axis (meters)','FontSize',12)
xlabel('x-Axis (meters)','FontSize',12)

