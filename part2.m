function [r, p, y] = part2( target, link_length, min_roll, max_roll, min_pitch, max_pitch, min_yaw, max_yaw, obstacles )
%% Function that uses analytic gradients to do optimization for inverse kinematics in a snake robot

%%Outputs 
  % [r, p, y] = roll, pitch, yaw vectors of the N joint angles
  %            (N link coordinate frames)
%%Inputs:
    % target: [x, y, z, q0, q1, q2, q3]' position and orientation of the end
    %    effector
    % link_length : Nx1 vectors of the lengths of the links
    % min_xxx, max_xxx are the vectors of the 
    %    limits on the roll, pitch, yaw of each link.
    % limits for a joint could be something like [-pi, pi]
    % obstacles: A Mx4 matrix where each row is [ x y z radius ] of a sphere
    %    obstacle. M obstacles.

%roll,pitch,yaw is xyz
N=size(link_length,1);
%using ZYX rotations
target_modified=[target(1:3) quat2eul(target(4:7))];


r0 = min_roll + (max_roll-min_roll).*rand(N,1);
p0 = min_pitch + (max_pitch-min_pitch).*rand(N,1);
y0 = min_yaw + (max_yaw-min_yaw).*rand(N,1);
x0=[r0;p0;y0];
%x is [r;p;y]
options = optimoptions('fmincon','SpecifyObjectiveGradient',true);
x = fmincon(@(x)optimFuncWithGrad(x,target_modified,link_length),x0,[],[],[],[],[min_roll; min_pitch; min_yaw], ...
    [max_roll; max_pitch; max_yaw],@(x)checkObstacles(x,obstacles,link_length),options);


optimFuncWithGrad(x,target_modified,link_length) %print the objective function value

r= x(1:N,:);
p= x(1+N:2*N,:);
y= x(2*N+1:3*N,:);

drawPicture(x,obstacles,link_length,target);
end
