function [output_image] = rgb2normedrgb(input_image)
% converts an RGB image into normalized rgb

R  = input_image(:,:,1);
G  = input_image(:,:,2);
B  = input_image(:,:,3);

R_norm = R./(R+G+B);
G_norm = G./(R+G+B);
B_norm = B./(R+G+B);

output_image = input_image;
output_image(:,:,1) = R_norm;
output_image(:,:,2) = G_norm;
output_image(:,:,3) = B_norm;

end

