function [ p, q, SE ] = check_integrability( normals )
%CHECK_INTEGRABILITY check the surface gradient is acceptable
%   normals: normal image
%   p : df / dx
%   q : df / dy
%   SE : Squared Errors of the 2 second derivatives

% initalization
[h,w,~] = size(normals);
p = zeros(h,w);
q = zeros(h,w);
SE = zeros(h,w);

% ========================================================================
% YOUR CODE GOES HERE
% Compute p and q, where
% p measures value of df / dx
% q measures value of df / dy

p = normals(:, :, 1)./normals(:,:,3);
q = normals(:, :, 2)./normals(:,:,3);
% 
% for y = 1:h
%     for x = 1:w
%         p(y,x) = normals(y,x,1)/normals(y,x,3);
%         q(y,x) = normals(y,x,2)/normals(y,x,3);
%     end
% end

% ========================================================================

p(isnan(p)) = 0;
q(isnan(q)) = 0;


% ========================================================================
% YOUR CODE GOES HERE
% approximate second derivate by neighbor difference
% and compute the Squared Errors SE of the 2 second derivatives SE

p2 = zeros(h,w);
q2 = zeros(h,w);
% 
% p2 = normals(:, :, 2)./p;
% q2 = normals(:, :, 1)./q;

q2 = gradient(q')' ./ normals(:,:,1);
p2 = gradient(p) ./ normals(:,:,2);

p2(isnan(p2)) = 0;
q2(isnan(q2)) = 0;

SE = ((p2-q2).^2);

SE(isnan(SE)) = 0;
% ========================================================================

end

