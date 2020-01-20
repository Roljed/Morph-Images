close all; clear; clc;
% Main script
fprintf("Hi, welcome to morph images script.\n")

movie_name = 'Movie_1.avi';
movie_len = 2;
image_size = 400;
image_source_temp = imread('source_1.jpg');
image_target_temp = imread('target_1.jpg');

image_source = rgb2gray(image_source_temp);
image_target = rgb2gray(image_target_temp);

points_source = [1 1; 1 image_size; image_size/2 1; 1 image_size/2; image_size/2 image_size; image_size 1; image_size image_size/2; image_size image_size];
points_target = [1 1; 1 image_size; image_size/2 1; 1 image_size/2; image_size/2 image_size; image_size 1; image_size image_size/2; image_size image_size];

fprintf("Remember to save:\n\tmovingPoints as points_source\n\tstaticPoints as points_target\n");
cpselect(image_source, image_target, points_source, points_target);
fprintf("\nPress enter or space to begin morphing sequence.\nIt may take couple of minutes.\n");
pause

createMorphSequence(image_source, image_target, points_source, points_target, 30 * movie_len, movie_name);
fprintf("\n*****\nFinished!\n");
