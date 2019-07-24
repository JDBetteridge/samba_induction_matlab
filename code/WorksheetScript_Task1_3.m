%% Task 0 - Preliminaries
% Good practice to delete all variables and clear all figures before we
% start.
clear;
close all;

%% Task 1 - Constructing M
% Write function FDM(N)
% Define N, construct linspaces x and y

N = input('Number of interior points to use (N): ');
x = linspace(0,1,N+2);  x = x(2:end-1); %shave off boundary points
y = x;
[X, Y] = meshgrid(x,y); %create meshgrid of points
M = FDM(N); %create finite difference matrix

%% Task 2 - Source and analytic functions
% Write the following functions:
% Source function F(z)
% Analytic solution function

%% Task 3 - Solving the system
% Evaluate the source and analytic solution on all (x,y) pairs
source = F([X(:),Y(:)]);
uExact = Analytic([X(:),Y(:)]);

% Solve the system AU = F using the backslash operator
uApprox = -M\source;

% Plot the approximate solution on a surface plot
figure()
surf(x,y,reshape(uApprox,N,N))

% Print the error
err = norm(uApprox - uExact);
fprintf('The error is %.7f \n',err)