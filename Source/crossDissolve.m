function [newIm] = crossDissolve(im1, im2, t)
%   CROSSDISSOLVE Output image is a weighted average of im1 and im2.
%   Input:  im1,im2 � 2D matrices of the same size.
%           These are grayscale images with values the range [0..255] in double format
%           t - a value in [0 1]
%
%   Output: newIm � 2D matrix of the same size as im1,im2. Format is uint8.

newIm = uint8(((im1 .* (1 - t) ) + (im2 .* t)));

end
