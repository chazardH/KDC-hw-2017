%use finite differences to come up with a derivative
function [f,g] = optimFuncWithGrad(x,target_modified,link_length)

f=norm(target_modified-forwardKin(x,link_length))^2;
epsilon=.0001;
N=size(link_length,1);
g=zeros(3*N,1);

for i=1:3*N
    a=zeros(3*N,1);
    a(i)=1;
    [finalstate1]= forwardKin(x-epsilon*a,link_length);
    f1 = norm(target_modified-finalstate1)^2;
    
    [finalstate2]= forwardKin(x+epsilon*a,link_length);
    f2 = norm(target_modified-finalstate2)^2;
    g(i)=(f2-f1)/(2*epsilon);
end

end

