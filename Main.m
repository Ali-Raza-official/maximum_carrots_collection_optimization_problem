% Coder 	: Ali Raza
% Institute : Air University, Islamabad
%% Setting up the file
clc             % clearing screen
clear all       % clearing variables
%% Taking data of the problem from user
rows = input("Enter the length of row of the grid : ");        % taking rows input
columns = input("Enter the length of column of the grid : ");     % taking columns input

number_of_cells = rows*columns;                         % finding number of cells

for i= 1:rows                   % loop for taking number of carrots in each cell
    for j= 1:columns
        carrots_in_cell(i,j) = input(['Enter the number of carrots in cell ', num2str(i),'x', num2str(j), ' : ']);
    end
end

clc                             % clearing the screen
disp("The grid is : ");         % displaying the grid
disp(flip(carrots_in_cell,1));
%% Calling the function
[optimized_path, max_carrots_in_cell] = find_optimized_path(rows, columns, carrots_in_cell);
%% Displaying the results
result = "The best path is: ";
for i=size(optimized_path,1):-1:1   % concatenating the results
    result = result + "Grid ("+ num2str(optimized_path(i,1))+","+num2str(optimized_path(i,2))+"), ";
end
result = result + "Grid ("+ num2str(optimized_path(1,3))+","+num2str(optimized_path(1,4))+")";
disp(result);   % displaying the result
disp("The maximum number of carrots collecte is: "+num2str(max_carrots_in_cell(rows,columns)));
