close all; clc;
% Main script
fprintf("Hi, welcome to morph images script.\n")

movie_name = 'Movie_1.avi';
image_source = imread('Source_1.tif');
image_target = imread('Target_1.tif');

initial_source = [1.00 1.00; 1.00 300.00; 300 1.00; 300.00 300.00];
initial_target = [1.00 1.00; 1.00 300.00; 300.00 1.00; 300.00 300.00];

fprintf("Remember to save:\n\tmovingPoints as points_source\n\tstaticPoints as points_target\n");
cpselect(image_source, image_target, initial_source, initial_target);
fprintf("\nPress enter or space to begin morphing sequence.\nIt may take couple of minutes.\n");
pause


createMorphSequence(image_source, image_target, points_source, points_target, 60, movie_name);
fprintf("\n*****\nFinished!\n");
