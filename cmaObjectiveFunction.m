function z=cmaObjectiveFunction(x,obstacles,link_length,target_modified)


z=norm(target_modified-forwardKin(x,link_length))^2;

[c,~] = checkObstacles(x,obstacles,link_length);
for i=1:length(c)
    if c(i)>0
        z=NaN;
    end
end

end

