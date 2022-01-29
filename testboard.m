% this function creates the board for the game
% the funciton testboard(position_1, compPosition_1) takes two parameters
% which are called in another driver, these parameters correspond to the
% movement of the user token and computer token.



% creating the function with two parameters
function [board] = testboard(position_1, compPosition_1)

% initialising board array (empty array)
board = [];

% setting the game board size to 77 pixels
boardSize = 77;

% setting the rows and columns to 77, hence a 77x77 pixel gameboard.
% there will be a 1x1 pixel grid across the board, which makes the boxes 10x10 pixels.
rows = boardSize;
cols = boardSize;

% initialsing sum
sum = 0;


% a loop that creates the token, grid, and the gameboard
for i = 1:rows % looping it 77 times for the rows
    
    % initialsing another empty vector, will be used to insert all new
    % pixelvalues
    boardRow = [];
    
    % a nested loop but it is now looping 77 times for the columns
    for j = 1:cols
        
        % assinging the enter 77x77 gameboard to be white in colour.
        pixelVal = 1;
        
        % the following loop creates the grid in colour grey.
        for k = rows/7:rows/7:rows-1 % a loop that considers every 11th value with the upper bound equal to 76
            
            % colours every 11th row from row 11 to row 76 and the
            % entire respected coloumn
            if i == sum + k && j == sum + j % using sum + k to colour all the pixels that statisfy the argument
                
                % changing these pixelvalues to grey.
                pixelVal = 0.5;
                
                % colours every 11th coloum from column 11 to column 76 and
                % the entire respected row.
            else if j == sum + k && i == sum + i
                    
                    % changes the pixelVal to grey.
                    pixelVal = 0.5;
                end
            end
        end
        
        
        % these commands makes the 4 corners, which are 20x20 boxes, black.
        if [i,j] <= rows/7+10 % for all the rows that are less than or equal to 21.
            pixelVal = 0; % sets pixel value to 0 (black)
            
            % for all the rows and coloumns that are less than or equal to 56
        else if  [i,j] >= (6*rows)/7 - 10
                pixelVal = 0; % sets pixel value to 0 (black)
                
                % for all the rows that are less than 21 and 56<= cols <= 77
            else if i <= rows/7+10 && (j >= cols - 21 && j <= cols)
                    pixelVal = 0; % sets pixel value to 0 (black)
                    
                    % for all the rows that are >= 56 and coloumns that are <= 21
                else if i >= (6*rows)/7 - 10  && j <= cols/7+10
                        pixelVal = 0; % sets pixel value to 0 (black)
                        
                        % for 33 < rows <= 43 and 33 < cols <= 43. this colours
                        % the centre of the board black.
                    else if i > 3*rows/7 && i <=4*rows/7-1 && j > 3*cols/7 && j <= 4*cols/7-1
                            pixelVal = 0; % sets pixel value to 0 (black)
                        end
                    end
                end
            end
        end
        
        
        % setting the initial position of user token and computer token in
        % their respected corners. 
        
        % this command relates to a certain box where the token is placed initially. 
        % command for user token place at "row 2" and "column 2" 
        if (j <= cols/7+10  && j >= cols/7+1) && (i <= rows/7+10 && i >= rows/7+1)
            pixelVal = 0.3; % sets the pixel value to 0.3 ( a dark shade of grey) 
            
         % command for user token place at "row 6" and "column 6" 
        else if (j < 6*cols/7 && j >= 5*cols/7+1) && (i < 6*rows/7 && i >=5*rows/7+1)
                pixelVal = 0.8; % sets the pixel value to 0.3 ( a light shade of grey) 
            end
        end
        
        % concatenates all pixel values into the empty vector initialised before. 
        boardRow = [boardRow pixelVal]; 
    end
    
    % concatenates the boardRow vector, creating a 2D array. 
    board = [board; boardRow];
end

% user movement

% the new positin of the user token is set to this vector. 
% from initial token position to the centre of the board, there are 27
% boxes and takes a certain path. 
position_2 = [1:27]; 

% a loop going 27 times, sets position_1 (initial position) = a. 
for i = 1:27 
    if position_2(i) == position_1
        a = i; % therefore, a = [1:27] = position_1 
    end
end

% a switch for 27 cases, where a = [1:27] 
switch   (a)
    
    % when position_1 = 1 
    case 1
        
        % initialising position to row 2, coloum 2
        position = [2,2]; 
        
        % a loop going 100 times
        for a = 1:10
            for b = 1:10
                
                % since every block is 10X10, this takes the position
                % vector and applies the respected row and coloum to the
                % board array created earlier, and assigns those
                % pixelvalues to 0.3 
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.3; % changes that box colour to a dark shadde of grey. 
            end
        end
    
    % when position_1 = 2
    case 2
        
        % a new position 
        position = [3,2];
        for a = 1:10
            for b = 1:10
                
                % takes the position and repeats what was happening in case 1 
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1; 
            end
        end
        
    % when position_1 = 3
    case 3
        
        % a new position 
        position = [3,3]; 
        for a = 1:10
            for b = 1:10
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
      
    % when position_1 = 4
    case 4
        
        % a new position 
        position = [2,3];
        
        for a = 1:10
            for b = 1:10
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
        
    % when position_1 = 5
    case 5
        
        % a new position 
        position = [1,3];
        for a = 1:10
            for b = 1:10
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
        
    % when position_1 = 6
    case 6
        
        % a new position 
        position = [1,4];
        for a = 1:10
            for b = 1:10
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
    
    % when position_1 = 7
    case 7
        
        % a new posittion 
        position = [1,5];
        for a = 1:10
            for b = 1:10
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
    
    % when position_1 = 8     
    case 8
        
        % a new position 
        position = [2,5];
        for a = 1:10
            for b = 1:10
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
    
    % when position_1 = 9 
    case 9
        
        % a new position 
        position = [3,5];
        for a = 1:10
            for b = 1:10
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
    
     % when position_1 = 10
    case 10
        
        % a new position 
        position = [3,6];
        for a = 1:10
            for b = 1:10
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
        
      % when position_1 = 11    
    case 11
        
        % a new position 
        position = [3,7];
        for a = 1:10
            for b = 1:11
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
    
      % when position_1 = 12
    case 12
        
        % a new position 
        position = [4,7];
        for a = 1:10
            for b = 1:11
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
   
      % when position_1 = 13 
    case 13
        
        % a new position 
        position = [5,7];
        for a = 1:10
            for b = 1:11
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
    
      % when position_1 = 14
    case 14
        
        % a new position 
        position = [5,6];
        for a = 1:10
            for b = 1:10
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
        
     % when position_1 = 15
    case 15
        
        % a new position 
        position = [5,5];
        for a = 1:10
            for b = 1:10
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
       
     % when position_1 = 16     
    case 16
        
        % a new position 
        position = [6,5];
        for a = 1:10
            for b = 1:10
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
    
  % when position_1 = 17 
    case 17
        
        % a new position 
        position = [7,5];
        for a = 1:10
            for b = 1:10
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
    
      % when position_1 = 18
    case 18
        
        % a new position 
        position = [7,4];
        for a = 1:10
            for b = 1:10
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
    
      % when position_1 = 19
    case 19
        
        % a new position 
        position = [7,3];
        for a = 1:10
            for b = 1:10.
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
     
      % when position_1 = 20
    case 20
        
        % a new position 
        position = [6,3];
        for a = 1:10
            for b = 1:10
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
    
      % when position_1 = 21
    case 21
        
        % a new position 
        position = [5,3];
        for a = 1:10
            for b = 1:10
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
    
      % when position_1 = 22
    case 22
        
        % a new position 
        position = [5,2];
        for a = 1:10
            for b = 1:10
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
   
      % when position_1 = 23
    case 23
        
        % a new position 
        position = [5,1];
        for a = 1:10
            for b = 1:10
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
    
      % when position_1 = 24
    case 24
        
        % a new position 
        position = [4,1];
        for a = 1:10
            for b = 1:10
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
     
      % when position_1 = 25
    case 25
        
        % a new position 
        position = [4,2];
        for a = 1:10
            for b = 1:10
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
    
      % when position_1 = 26
    case 26
        
        % a new position 
        position = [4,3];
        for a = 1:10
            for b = 1:10
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
       
      % when position_1 = 27
    case 27
        
        % a new position 
        position = [4,4];
        for a = 1:10
            for b = 1:10
                board((position(1)-1)*11+a, (position(2)-1)*11+b) = 0.1;
            end
        end
        
end

% computer movement

% the new positin of the computer token is set to this vector. 
% from initial token position to the centre of the board, there are 27
% boxes and takes a certain path. 
compPosition_2 = [1:27]; 

% a loop going 27 times, sets position_1 (initial position) = b. 
for i = 1:27
    if compPosition_2(i) == compPosition_1
        b = i; % therefore, b = [1:27] = position_1 
    end
end

% a switch for 27 cases, where a = [1:27] 
switch (b)
    
    % when compPosition_1 = 1
    case 1
        
        % a new compPosition
        compPosition = [6,6];
        for k = 1:10
            for m = 1:10
                
                % since every block is 10X10, this takes the position
                % vector and applies the respected row and coloum to the
                % board array created earlier, and assigns those
                % pixelvalues to 0.8  
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
    
    % when compPosition_1 = 2
    case 2
        
        % a new compPosition
        compPosition = [5,6];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
 
    % when compPosition_1 = 3
    case 3
        
        % a new compPosition
        compPosition = [5,5];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end

    % when compPosition_1 = 4
    case 4
        
        % a new compPosition
        compPosition = [6,5];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end

    % when compPosition_1 = 5
    case 5
        
        % a new compPosition
        compPosition = [7,5];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
   
    % when compPosition_1 = 6
    case 6
        
        % a new compPosition
        compPosition = [7,4];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
   
    % when compPosition_1 = 7
    case 7
        
        % a new compPosition
        compPosition = [7,3];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
    
    % when compPosition_1 = 8
    case 8
        
        % a new compPosition
        compPosition = [6,3];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
        
    % when compPosition_1 = 9
    case 9
        
        % a new compPosition
        compPosition = [5,3];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
      
    % when compPosition_1 = 10
    case 10
        
        % a new compPosition
        compPosition = [5,2];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
   
    % when compPosition_1 = 11
    case 11
        
        % a new compPosition
        compPosition = [5,1];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
  
    % when compPosition_1 = 12
    case 12
        
        % a new compPosition
        compPosition = [4,1];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
        
    % when compPosition_1 = 13
    case 13
        
        % a new compPosition
        compPosition = [3,1];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
   
    % when compPosition_1 = 14
    case 14
        
        % a new compPosition
        compPosition = [3,2];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
    
    % when compPosition_1 = 15
    case 15
        
        % a new compPosition
        compPosition = [3,3];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
        
    % when compPosition_1 = 16
    case 16
        
        % a new compPosition
        compPosition = [2,3];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
        
    % when compPosition_1 = 17
    case 17
        
        % a new compPosition
        compPosition = [1,3];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
      
    % when compPosition_1 = 18
    case 18
        
        % a new compPosition
        compPosition = [1,4];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
      
    % when compPosition_1 = 19
    case 19
        
        % a new compPosition
        compPosition = [1,5];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
    
    % when compPosition_1 = 20
    case 20
        
        % a new compPosition
        compPosition = [2,5];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
        
    % when compPosition_1 = 21
    case 21
        
        % a new compPosition
        compPosition = [3,5];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
    
    % when compPosition_1 = 22
    case 22
        
        % a new compPosition
        compPosition = [3,6];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
    
    % when compPosition_1 = 23
    case 23
        
        % a new compPosition
        compPosition = [3,7];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
    
    % when compPosition_1 = 24
    case 24
        
        % a new compPosition
        compPosition = [4,7];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end

    % when compPosition_1 = 25
    case 25
        
        % a new compPosition
        compPosition = [4,6];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
     
    % when compPosition_1 = 26
    case 26
        
        % a new compPosition
        compPosition = [4,5];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
   
    % when compPosition_1 = 27
    case 27
        
        % a new compPosition
        compPosition = [4,4];
        for k = 1:10
            for m = 1:10
                board((compPosition(1)-1)*11+k, (compPosition(2)-1)*11+m) = 0.8;
            end
        end
end

end







