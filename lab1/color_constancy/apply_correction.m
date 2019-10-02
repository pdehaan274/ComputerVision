function [output_image] = apply_correction(input_image)

output_image = input_image;
for index = 1:size(input_image, 3)
    channel = input_image(:,:,index);
    scale_fact = mean(channel(:));
    output_image(:,:,index)=input_image(:,:,index).*(128/scale_fact);
end

end