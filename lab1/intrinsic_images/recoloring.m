albedo_dir = 'ball_albedo.png';
shading_dir = 'ball_shading.png';
original_dir = 'ball.png';

im_albedo = imread(albedo_dir);
im_shading = imread(shading_dir);
im_original = imread(original_dir);

% The values in each channel of the ball are substituted to the new color.
im_albedo(:,:,1) = zeros(size(im_albedo(:,:,1)));
im_albedo_g = im_albedo(:,:,2);
im_albedo_g(im_albedo_g == 141) = 255;
im_albedo(:,:,2) = im_albedo_g;
im_albedo(:,:,3) = zeros(size(im_albedo(:,:,3)));

% Images ar transormed to double
im_albedo = im2double(im_albedo);
im_shading = im2double(im_shading);

% An element-wise product between the albedo and shading is applied
im_recon = im_albedo.*im_shading;

% Plots are visualised of the originial image and new color image
subplot(1,2,1);
imshow(im_original);
title('Original Image');

subplot(1,2,2);
imshow(im_recon);
title('New Image');
