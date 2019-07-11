% File containing the commands and functions for the tasks on the
% worksheet.

%% Task 1 - Constructing M

% Read in file
load('Data.mat')

% Write function FDM(N) - see end of filee


%% Task 2 - Testing construction

% Generate M
M = FDM(N);

% Extract lower and upper parts of M
upper = triu(M);
lower = tril(M);

% Sum the rows of M
MSumRow = sum(M,2);

% Reshape M_SUM_ROW onto an N x N matrix and plot using imagesc
figure()
imagesc(reshape(MSumRow,N,N))

%% Task 3 - Source and analytic functions

% Source function F(z) - see end of file

% Analytic solution function - see end of file

%% Task 4 - Solving the system

% Evaluate the source and analytic solution on all (x,y) pairs
source = F([X(:),Y(:)]);
uExact = Analytic([X(:),Y(:)]);

% Solve the system AU = F using the backslash operator
uApprox = -M\source;

% Plot the surface plot
figure()
surf(x(2:(end-1)),y(2:(end-1)),reshape(uApprox,N,N))

% Print the error
err = norm(uApprox - uExact);
sprintf('The error is %.7f',err)

%% Task 5 - Error analysis

% Create a range of values for N
NRange = [5,10,25,50,100];

% Pre-allocate a vector to contain the errors
errVec = zeros(5,1);

% Loop over the values of N, completing task 4 for each
for ii = 1:5
    
    % Extract the value of N, and calculate the meshgrid
    N = NRange(ii);
    x = linspace(0,1,N+2);
    y = linspace(0,1,N+2);
    [X,Y] = meshgrid(x(2:end-1),y(2:end-1));
    
    % Use FDM to find the M matrix
    M = FDM(N);
    
    % Evaluate the source and analytic solution on all (x,y) pairs
    source = F([X(:),Y(:)]);
    uExact = Analytic([X(:),Y(:)]);
    
    % Solve the system AU = F using the backslash operator
    uApprox = -M\source;
    
    % Plot the surface plot in a new figure
    figure()
    surf(x(2:(end-1)),y(2:(end-1)),reshape(uApprox,N,N))
    
    % Store and print the error
    errVec(ii) = norm(uApprox - uExact);
    sprintf('The error for N = %d is %.7f',N,errVec(ii))
    
    % Pause
    pause

end

% Semilog plot of h vs. errVec
semilogy(1./(NRange+1),errVec)

%% Functions

function M = FDM(N)

    % Write the identity matrix of size N to a variable
    I = eye(N);

    % Write the one-dimensional finite-difference matrix
    A = 2*I - diag(ones(N-1,1),1) - diag(ones(N-1,1),-1);
    
    % Create the matrix M
    M = (N+1)^2*(kron(A,I) + kron(I,A));
    
end

function [ val ] = F( z )
% F evaluates the source term of the PDE. It takes in, as input, an n x 2
% matrix where each row contains a coordinate pair. 

    % Calculate the source ensuring that element-wise multiplication is
    % used
    val = -4*pi*sin(2*pi*z(:,1)).*(cos(2*pi*(z(:,2)-0.5).^2).*pi.*(1+(2*z(:,2)-1).^2)+sin(2*pi*(z(:,2)-0.5).^2));

end

function [ val ] = Analytic( z )
% Analytic evaluates the analytic solution of the PDE. It takes in, as 
% input, an n x 2 matrix where each row contains a coordinate pair.

    val = sin(2*pi*z(:,1)).*cos(((z(:,2)-0.5).^2)*2*pi);

end