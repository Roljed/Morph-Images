function   createMorphSequence(imSource,imTarget,pointsSource,pointsTarget,numFrames,fileName)
%   CREATEMORPHSEQUENCE This is the main function that will create a movie.
%   Input:  imSource,imTarget � 2D matrices of the same size.
%           These are grayscale images with values the range [0..255]
%           pointsSource,pointsTarget - n-by-2 matrices that store control points
%           numFrames � number of frames in the output movie. numFrames >=2
%           filename � a string. Name of file to output movie (example "myMovie.avi")
%
%   Output: movie � a matlab created movie

meshForMorph = calcMesh(pointsSource); 
format = 'Motion JPEG AVI';
v = VideoWriter(fileName, format);
v.Quality = 95;
open(v); 
for t  = 0: 1 / (numFrames - 1) : 1
    fprintf('%.f%%\n', t * 100);
    pointsT = calcIntermediateMesh(pointsSource, pointsTarget, t);
    imST = warpImage(imSource, pointsSource, pointsT, meshForMorph);
    imTT = warpImage(imTarget, pointsTarget, pointsT, meshForMorph);
    frameT = crossDissolve(imST, imTT, t);
    writeVideo(v, frameT);
end

close(v);
end
