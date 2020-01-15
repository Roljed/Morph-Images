function [mesh] = calcMesh(pointList)
%   CALCMESH Calculates mesh from pointList
%   Input:  pointsList - an n-by-2 matrix that stores control points
%
%   Output: mesh � an m-by-3 matrix that stores the triangles of the mesh. 
%           Each row of the output mesh contains the 3 row numbers
%           of pointList that make up single triangle.

mesh = delaunay(pointList(: , 1),pointList(: , 2));

end
