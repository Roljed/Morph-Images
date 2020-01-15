function   [TorF] = pointInTriangle(P, A, B, C)
%   POINTINTRIANGLE Calculate the differences between the points
%   Input:  P,A,B,C � a 1X2 matrix (x,y) containing a point in 2D
%           tri pointsList - n-by-2 matrix that stores control points
%           mesh � an m-by-3 matrix that stores the triangles of the mesh.
%           Each row of the mesh contains the 3 row numbers of a pointList that make up a
%           single triangle.
%
%   Output: TorF -True or false. Returns True if point P is in triangle defined by A,B,C

P12 = A - B;
P23 = B - C;
P31 = C - A;

% Returns True if point P is in triangle defined by A,B,C
TorF =  (sign(det([P31; P23])) * sign(det([C - P; P23])) >= 0) & ...  
        (sign(det([P12; P31])) * sign(det([A - P; P31])) >= 0) & ...
        (sign(det([P23; P12])) * sign(det([B - P; P12])) >= 0);

end
