function M = FDM(N)
%The function FDM returns the Finite Difference Matrix for an N-by-N
%uniform mesh of the unit square.
%INPUTS:
%   N : Number of meshpoints in each direction. Square uniform mesh assumed
%OUTPUTS:
%   M : Finite difference matrix corresponding to the mesh as defined.

% Write the identity matrix of size N to a variable
I = eye(N);

% Write the one-dimensional finite-difference matrix
A = 2*I - diag(ones(N-1,1),1) - diag(ones(N-1,1),-1);

% Create the matrix M
M = (N+1)^2*(kron(A,I) + kron(I,A));
    
end %function