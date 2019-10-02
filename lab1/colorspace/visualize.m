function visualize(input_image)

size_input = size(input_image, 3);
grayscale_titles = ["Lightness Method", "Average Method", "Luminosity Method", "Built-in function"];

if size_input == 4
    for index = 1:size(input_image, 3)
        subplot(1, size(input_image, 3), index);
        imshow(input_image(:,:,index));
        title(grayscale_titles(index));
    end
else
    subplot(1, size(input_image, 3)+1, 1);
    imshow(input_image);
    title("Converted Image");
    for index = 1:size(input_image, 3)
        subplot(1, size(input_image, 3)+1, index+1);
        imshow(input_image(:,:,index));
        title(sprintf("Component %d",index));
    end
    
end
end

