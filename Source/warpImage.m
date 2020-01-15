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
imWarped = zeros(size(imSource)); 
rowNum = 1;

for i = 1 : size(imWarped, 1)
    for j = 1 : size(imWarped, 2)
        
        [P1, P2, P3, rowNum] = findTriangle([i j], pointsDest, mesh, rowNum);
        [alpha, beta, gamma] = BarycentricCoordinates([i j], P1, P2, P3);
        delta = [alpha; beta; gamma];
        
        P1 = pointSource(mesh(rowNum, 1) , :);
        P2 = pointSource(mesh(rowNum, 2) , :);
        P3 = pointSource(mesh(rowNum, 3) , :);
        pts = [P1, 1, P2, 1, P3, 1];
        pts = reshape(pts, 3, 3);
      
		p = pts * delta; 
		x = round(p(1, 1));
		y  = round(p(2, 1));
       
       if (x >= 1 && y > 1 && x <= size(imWarped, 2) && y <= size(imWarped, 1))
			imWarped(i, j) = imSource(y, x);
       end
    end
end
end
