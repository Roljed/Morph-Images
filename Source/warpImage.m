function   [imWarped] = warpImage(imSource,pointSource,pointsDest,mesh)
%   WARPIMAGE Uses inverse mapping. Build a new image the size of imSource by assigning values to its pixels.
%   Input:  imSource � a 2D matrix of a grayscale image with values in the range [0..255]
%           pointsSource, pointsDest - n-by-2 matrices that store control points
%           mesh � an m-by-3 matrix that stores the triangles of the mesh.
%           Each row of the mesh contains the 3 row numbers of a pointList that make up a
%           single triangle.
%
%   Output: imWarped � a 2D matrix of a grayscale image with values in the range [0..255]
%           same size as imSource.
%           Output imWarp as double.


% Get image source size
image_size = size(imSource)
imWarped = zeros(size(imSource)); 
rowNum = 1;

for i = 1: image_size(1)
    for j = 1: image_size(2)
        % For each pixel determine which triangle it is in
        [P1, P2, P3, rowNum] = findTriangle([j, i], pointsDest, mesh, rowNum);

        % Calculate pixel's Barycentric coordinates 
        [alpha, beta, gamma] = BarycentricCoordinates([j, i], P1, P2, P3);
        delta = [alpha; beta; gamma];

        % Find source coordinates in image imSource    
        pointTriangle1 = pointSource(mesh(rowNum, 1),:);
        pointTriangle2 = pointSource(mesh(rowNum, 2),:); 
        pointTriangle3 = pointSource(mesh(rowNum, 3),:);
        points = [pointTriangle1, 1, pointTriangle2, 1, pointTriangle3, 1];
        points = reshape(points, 3, 3);
        points = points * delta; 
        x = round(points(2, 1));
        y = round(points(1, 1));

        % Get the grayscale value from imSource using these xy coordinates
        if (x >= 1 && y > 1 && x <= size(imWarped, 2) && y <= size(imWarped, 1))
            imWarped(i, j) = imSource(x, y);
        end
    end
end
end
