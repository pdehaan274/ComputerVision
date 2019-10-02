function [ height_map ] = construct_surface( p, q, path_type )
%CONSTRUCT_SURFACE construct the surface function represented as height_map
%   p : measures value of df / dx
%   q : measures value of df / dy
%   path_type: type of path to construct height_map, either 'column',
%   'row', or 'average'
%   height_map: the reconstructed surface


if nargin == 2
    path_type = 'column';
end

[h, w] = size(p);
height_map = zeros(h, w);

switch path_type
    case 'column'
        % =================================================================
        % YOUR CODE GOES HERE
        % top left corner of height_map is zero
        % for each pixel in the left column of height_map
        %   height_value = previous_height_value + corresponding_q_value
        for y1 = 2:h
            height_map(y1,1) = height_map(y1-1,1) + q(y1,1);
        end
                
        % for each row
        %   for each element of the row except for leftmost
        %       height_value = previous_height_value + corresponding_p_value                
        for y2 = 1:h
            for x = 2:w
                height_map(y2,x) = height_map(y2, x-1) + p(y2, x);
            end
        end
        
        
        % =================================================================
               
    case 'row'
        
        % =================================================================
        % YOUR CODE GOES HERE
        
        for x1 = 2:w
            height_map(1, x1) = height_map(1,x1-1) + p(1, x1);
        end
        
        for x2 = 1:w
            for y = 2:h
                height_map(y, x2) = height_map(y-1, x2) + q(y, x2);
            end
        end
        % =================================================================
          
    case 'average'
        
        % =================================================================
        % YOUR CODE GOES HERE

        map_row = construct_surface(p, q, 'row');
        map_col = construct_surface(p, q, 'column');
        height_map = (map_row + map_col)/2;
        
        % =================================================================
end


end

