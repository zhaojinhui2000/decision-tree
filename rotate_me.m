function A = rotate_me(A)
% initial check
[n,m] = size(A);
if n ~= m
    error('Must be a square matrix!');
elseif n == 1 || n == 0 % recursion end condition
    return;
end

% rotation
C = [A(1,1:end) A(2:end,end)' A(end, end-1:-1:1) A(end-1:-1:2,1)'];
C = [C C(1)];
C(1) = [];

A(1,1:end) = C(1:n);
A(2:end,end) = C(n+1:2*n-1)';
A(end,end-1:-1:1) = C(2*n:3*n-2);
A(end-1:-1:2,1) = C(3*n-1:4*n-4)';

%recursion
A(2:end-1,2:end-1) = rotate_me(A(2:end-1,2:end-1));
