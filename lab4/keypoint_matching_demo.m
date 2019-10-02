image1 = imread('boat1.pgm');
image2 = imread('boat2.pgm');

matches = keypoint_matching('boat1.pgm', 'boat2.pgm')

n = 10;

figure;
imshow(cat(2,image1,image2))