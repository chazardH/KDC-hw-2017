function [c,ceq] = checkObstacles(x,obstacles,link_length)
%x contains [r;p;y] 
%obstacles is [ x y z radius ]
[~,linkpoints]= forwardKinWLinks(x,link_length);

for n=1:size(obstacles,1)
    prevPoint=[0 0 0];
    for j=1:size(linkpoints,1)
       %distance from point to line
       currentPoint=linkpoints(j,:);
       dist = norm(cross(currentPoint-prevPoint,prevPoint-obstacles(n,1:3)))/norm(currentPoint-prevPoint); 
       prevPoint=currentPoint; 
       c((n-1)*size(linkpoints,1)+j)= obstacles(n,4)-dist;
    end
end
ceq = [];
end
