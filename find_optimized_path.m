function [optimized_path, max_carrots_in_cell] = find_optimized_path(rows, columns, carrots_in_cell)
%% Maximum carrots and all steps calculating
path_row = 1;               % variable for paths rows
for i= 1:rows               % loop for row wise traversing
    for j= 1:columns        % loop for column wise traversing
        if(i==1)&&(j==1)    % if it is 1st cell
            max_carrots_in_cell(i,j) = carrots_in_cell(i,j);
        elseif(i == 1)      % if it is 1st row
            max_carrots_in_cell(i,j) = carrots_in_cell(i,j) + max_carrots_in_cell(i,j-1);
            paths(path_row,:) = [i, j-1, i, j];
            path_row = path_row + 1;
        elseif(j == 1)      % if it is 1st column
            max_carrots_in_cell(i,j) = carrots_in_cell(i,j) + max_carrots_in_cell(i-1,j);
            paths(path_row,:) = [i-1, j, i, j];
            path_row = path_row + 1;
        else                % if it is any other cell
            if (max_carrots_in_cell(i,j-1)>max_carrots_in_cell(i-1,j))  % if left cell has maximum carrots
                max_carrots_in_cell(i,j) = carrots_in_cell(i,j) + max_carrots_in_cell(i,j-1);
                paths(path_row,:) = [i, j-1, i, j];
                path_row = path_row + 1;
            else            % if below cell has maximum carrots
                max_carrots_in_cell(i,j) = carrots_in_cell(i,j) + max_carrots_in_cell(i-1,j);
                paths(path_row,:) = [i-1, j, i, j];
                path_row = path_row + 1;
            end
        end
    end                 % end of columns loop
end                     % end of rows loop

%% Finding Optimized Path
% Tracking from end cell to start cell in search fo optized path
steps = size(paths,1);  % calculating total number of steps across all the grid
optimized_path(1,:) = [0, 0, rows, columns];    % initializing optimized path
optimized_path_row = 1;                         % variable for optimized row indexing
found = false;          % boolean if optimized path is detected
while(found ~= true)    % loop until optimized path is found
    for i= 1:steps      % loop for traversing all the steps
        if(optimized_path(optimized_path_row,3:4)==paths(i,3:4))  % if a end cell found
            optimized_path(optimized_path_row,1:2) = paths(i,1:2);
            optimized_path_row = optimized_path_row + 1;
            if (optimized_path_row ~=0)             % checking if it is not the 1st step
                if (optimized_path(optimized_path_row-1,1:2)== [1 1]) % if start cell is detected
                found = true;                       % making the found boolean true
                break;                              % break if optimized path is found
                end
            end
            optimized_path(optimized_path_row,:) = [0, 0, paths(i,1:2)]; % if start cell is not found
        end
    end
end         % end of optimized path finding loop
end         % end of function