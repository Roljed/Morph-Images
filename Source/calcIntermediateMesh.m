function [newPointList] = calcIntermediateMesh(pointsSource,pointsTarget, t)
%   CALCINTERMEDIATEMESH Uses linear interpolation between corresponding points in the 2 lists.
%   Input:  pointsSource, pointsTarget - n-by-2 matrix that store control points
%           t - a value in [0 1]
%
%   Output: newPointList � an n-by-2 matrix that stores the new control points that
%           define the intermediate mesh.

newPointList = (pointsSource .* (1 - t) ) + (pointsTarget .* t);

end
