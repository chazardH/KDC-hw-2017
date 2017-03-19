function drawPicture(x,obstacles,link_length,target)
[~,linkpoints]= forwardKinWLinks(x,link_length);

figure
hold on
[w,y,z] = sphere;

for i=1:size(obstacles,1)
    r=obstacles(i,4);
    surf(w*r+obstacles(i,1), y*r+obstacles(i,2), z*r+obstacles(i,3));
end
linkpoints=[0 0 0;linkpoints];

for i=1:size(link_length,1)
    line([linkpoints(i,1) linkpoints(i+1,1)],[linkpoints(i,2) ...
        linkpoints(i+1,2)],[linkpoints(i,3) linkpoints(i+1,3)]);
end
for i=1:size(linkpoints,1)
    plot3(linkpoints(i,1),linkpoints(i,2),linkpoints(i,3),'ro');
end
%plot the target
plot3(target(1),target(2),target(3),'bx');

axis equal;%also try tight
 
end