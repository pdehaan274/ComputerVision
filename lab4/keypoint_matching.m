function [matches] = keypoint_matching(image1,image2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    img1 = single(imread(image1));
    img2 = single(imread(image2));
    
    [f1,d1] = vl_sift(img1);
    [f2,d2] = vl_sift(img2);
    
    [matches, scores] = vl_ubcmatch(d1, d2);
    
    % Translate the matchping pixels into x,y-cooridinates
    matches_1 = [f1(1,matches(1,:));f1(2,matches(1,:))];
    matches_2 = [f2(1,matches(2,:));f2(2,matches(2,:))];
    
    matches = [matches_1;matches_2];
end

