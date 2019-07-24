%% Task 4 - Error analysis
% Good practice to clear all our variables and figures before we start
clear;
close all;

% Create a range of values for N
NRange = 5:5:75;
hRange = 1./(NRange+1);

% Pre-allocate a vector to contain the errors
errVec = zeros(1,length(NRange));

% Loop over the values of N, completing task 4 for each
for ii = 1:length(NRange)
    
    % Extract the value of N, and calculate the meshgrid
    N = NRange(ii);
    x = linspace(0,1,N+2);  x = x(2:end-1);
    y = x;
    [X,Y] = meshgrid(x,y);
    
    % Use FDM to find the M matrix
    M = FDM(N);
    
    % Evaluate the source and analytic solution on all (x,y) pairs
    source = F([X(:),Y(:)]);
    uExact = Analytic([X(:),Y(:)]);
    
    % Solve the system AU = F using the backslash operator
    uApprox = -M\source;
    
    % Store the error
    errVec(ii) = norm(uApprox - uExact);
end

% Semilog plot of h vs. errVec
figure;
semilogy(hRange,errVec);
xlabel('$h$','interpreter','latex');
ylabel('Norm of error vector','interpreter','latex');

% Use polyfit to determine the rate of convergence.
% Err = C*h^alpha so ln(Err) = alpha*ln(h) + ln(C).
% Fit a degree 1 polynomial
pCoeffs = polyfit(log(hRange),log(errVec),1);
alpha = pCoeffs(1);
% Print out the predicted convergence rate
fprintf('Predicted convergence rate is %.5f \n',alpha);