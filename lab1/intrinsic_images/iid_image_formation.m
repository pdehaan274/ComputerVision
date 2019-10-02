albedo_dir = 'ball_albedo.png';
shading_dir = 'ball_shading.png';
original_dir = 'ball.png';

im_albedo = imread(albedo_dir);
im_shading = imread(shading_dir);
im_original = imread(original_dir)

% Images ar transormed to double
im_albedo = im2double(im_albedo);
im_shading = im2double(im_shading);

% An element-wise product between the albedo and shading is applied
im_recon = im_albedo.*im_shading;

% Subplots of the original image, albedo, shading and reconstruction image
% are plotted
subplot(1,4,1);
imshow(im_original);
title('Original Image');

subplot(1,4,2);
imshow(im_albedo);
title('Albedo');

subplot(1,4,3);
imshow(im_shading);
title('Shading');

subplot(1,4,4);
imshow(im_recon);
title('Reconstructed Image');
