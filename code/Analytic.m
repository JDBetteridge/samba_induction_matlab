function [ val ] = Analytic( z )
%Evaluates the analytic solution of the PDE.
%INPUTS:
%   z : n x 2 matrix where each row contains a coordinate pair.
%OUTPUTS:
%   val : evaluation of the analytic solution at each of the input
%   co-ordinate pairs.

val = sin(2*pi*z(:,1)).*cos(((z(:,2)-0.5).^2)*2*pi);

end %function