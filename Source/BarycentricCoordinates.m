function [alpha,beta,gamma] = BarycentricCoordinates(P, A, B, C)
%   BARYCENTRICCOORDINATES Calculate the barycentric coordinates of a given
%   point in a triangle.
%
%   Input: P,A,B,C � a 1X2 matrix (x,y) containing a point in 2D
%
%   Output: alpha,beta,gamma � scalars representing the Barycentric coordinates of P in triangle A,B,C

P(3) = 1;

mat = zeros(3, 3);
mat([1 2]) = A(:);
mat([4 5]) = B(:);
mat([7 8]) = C(:);
mat([3 6 9]) = 1;

result = mat \ P(:);

alpha = result(1);
beta = result(2);
gamma = result(3);

end
