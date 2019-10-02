img = imread("awb.jpg");

subplot(1,2,1)
imshow(img);

img = apply_correction(img);
subplot(1,2,2)
imshow(img);