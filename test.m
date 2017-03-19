
target= [4 2 1 eul2quat([0 0 1.5708])];
link_length=[1;1;2;3;1;1;1;2;1];
min_roll=[0,0,0,0,0,0,0,0,0]';
max_roll=[pi/2,pi/2,pi/2,pi/2,pi,pi/2,pi/2,pi,pi/2]';
min_pitch=[0,0,0,0,0,0,0,0,0]';
max_pitch=[pi/2,pi/2,pi/2,pi,pi,pi,pi/2,pi/2,pi/2]';
min_yaw=[0,0,0,0,0,0,0,0,0]';
max_yaw=[pi/2,pi/2,pi,pi/2,pi,pi/2,pi/2,pi/2,pi/2]';

obstacles=[1 1 1 .5; 2 3 4 1;0 2 3 2;-4 -3 -6 2.5;-4 -3 4 2.5];

tic
%change this to be part1, part2, or cmaes to run the corresponding function
[r, p, y] = part1( target, link_length, min_roll, max_roll, min_pitch, ...
    max_pitch, min_yaw, max_yaw, obstacles )

toc
