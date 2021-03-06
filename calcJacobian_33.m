function J = calcJacobian_33(q, joint, robot)
% CALCJACOBIAN_GROUPNO Calculate the Jacobian of a particular joint of the 
%   robot in a given configuration. CHANGE GROUPNO TO YOUR GROUP NUMBER.
%
% INPUTS:
%   q     - 1 x 6 vector of joint inputs [q1,q2,q3,q4,q5,q6]
%   joint - scalar in [1,7] representing which joint we care about
%   robot - a struct of robot parameters
%
% OUTPUTS:
%   J - 6 x (joint-1) matrix representing the Jacobian
%


%%

J = [];

if nargin < 3
    return
elseif joint <= 1 || joint > 7
    return
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                  Your Code Starts Here             %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% LINEAR VELOCITY JACOBIAN

%get joint pos and transformation matrices
[jointpos, T0i] = calculateFK_sol(q,robot);

Jv = zeros(3,joint-1);

%get origin of required joints
On = jointpos(joint,:)';

%Jv = z x (on-oi)
for i = 1:joint-1
    Oi = jointpos(i,:)';
    Jv(:,i) = cross(T0i(1:3,3,i),(On-Oi));
end

%% ANGULAR VELOCITY JACOBIAN

Jw = zeros(3,joint-1);

for i = 1:joint-1    
    Jw(:,i) = T0i(1:3,3,i);


    


%% Jacobian matrix

J = [Jv;Jw];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                  Your Code Ends Here               %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end