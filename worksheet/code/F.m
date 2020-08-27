function [ val ] = F( z )
%Evaluates the source term of the PDE. 
%INPUTS:
%   z : n x 2 matrix where each row contains a coordinate pair.
%OUTPUTS:
%   val : The source term evaluated at each of the input co-ordinate pairs.

% Calculate the source ensuring that element-wise multiplication is
% used
val = -4*pi*sin(2*pi*z(:,1)).*(cos(2*pi*(z(:,2)-0.5).^2).*pi.*(1+(2*z(:,2)-1).^2)+sin(2*pi*(z(:,2)-0.5).^2));

end %function