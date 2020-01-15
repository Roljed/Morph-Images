function [P1,P2,P3,rowNum] = findTriangle(P, pointList, mesh, row)
%   FINDTRIANGLE Searches for the triangle in which P is located in the triangular mesh defined by
%   mesh and pointList
%
%   Input:  P � a 1X2 matrix (x,y) containing a point in 2D
%           pointsList - n-by-2 matrix that stores control points
%           mesh � an m-by-3 matrix that stores the triangles of the mesh.
%           Each row of the mesh contains the 3 row numbers of a pointList that make up a
%           single triangle.
%
%   Output: P1,P2,P3 � 1X2 matrix (x,y) containing a point in 2D
%           rowNum � the row number in input array mesh, where the triangle points reside.

x = size(mesh, 1);
P1 = pointList (mesh(row, 1) , :);
P2 = pointList (mesh(row, 2) , :);
P3 = pointList (mesh(row, 3) , :);
rowNum = row;

for i=1 : x
    A = pointList(mesh(i, 1), :);
    B = pointList(mesh(i, 2), :);
    C = pointList(mesh(i, 3), :);
    Ptri = [A; B; C];

    % Checking validation of the triangle
    if P(1) <= max(Ptri(:, 1)) && P(1) >= min(Ptri(:, 1)) && P(2) <= max(Ptri(:, 2)) && P(2) >= min(Ptri(:, 2))
        
        %Checking if P is in the current triangle
        TorF = pointInTriangle(P, A, B, C);
        if TorF
            P1 = A;
            P2 = B;
            P3 = C;
            rowNum = i;
            break;
        end
    end
end
end
