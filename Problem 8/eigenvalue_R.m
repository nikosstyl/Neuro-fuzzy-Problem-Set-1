%The R matrix is the correlation matrix
R = [12.4 7.6;
    7.6 6.4];

%Compute the eigenvalues of R matrix
eigenvalues = eig(R)

% Find the maximum eigenvalue
lambda_max = max(eigenvalues);

%Find maximum learning rate
lr = 1/lambda_max

