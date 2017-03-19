function [finalstate,linkpoints]= forwardKinWLinks(x,link_length)
%linkpoints is Nx3 and contains the points at each step in the kinematic
%chain
%output is [x y z z-rot y-rot x-rot]
%using z,y,x rotations
%roll,pitch,yaw is xyz

%x is [r;p;y] stacked on top of one another 3Nx1
N=size(link_length,1);
linkpoints=zeros(N,3);
startpos=[0,0,0,1]'; %homo coords 
tmatrix=eye(4); %homogeneous transformation matrix

for i=1:N
    rotm=eul2rotm([x(i+2*N) x(i+N) x(i)]);
    tform = rotm2tform(rotm);
    tform(1:3,4)=rotm*[link_length(i);0;0];
    tmatrix=tform*tmatrix;
    pos=tmatrix*startpos;
    linkpoints(i,:)=pos(1:3)';
end

finalOrientation=rotm2eul(tmatrix(1:3,1:3));
finalstate=[linkpoints(N,:) finalOrientation];
end