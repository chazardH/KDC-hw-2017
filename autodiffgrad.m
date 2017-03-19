% here use automatic differentiation to come up with analytic gradient

function [f,g] = autodiffGrad(rpy,target_modified,link_length)
[finalstate,linkpoints]= forwardKinWLinks(rpy,link_length);
f = norm(target_modified-finalstate)^2;
%df=2*(x-xm)*dx/dv+2*(y-ym)*dy/dv+2*(z-zm)*dz/dv+2*(roll-rollm)*droll/dv+
%2*(pitch-pitchm)*dpitch/dv+2*(yaw-yawm)*dyaw/dv
%where v is the roll pitch or yaw of current joint
N=size(link_length,1);
r= rpy(1:N);
p= rpy(1+N:2*N);
y= rpy(2*N+1:3*N);
g=zeros(3*N,1);

%for each rpy calculate dcomponent/dv
for i=1:N
    %rpy is xyz, you want zyx
    %calculate dxdv dydv dzdv
    syms x y z
    %calculate pre and post multiply homogeneous matrices
    for j=1:
    
    
    %calculate drolldv dpitchdv dyawdv
    
    %put in gradient element df=sum of elements
end


end

