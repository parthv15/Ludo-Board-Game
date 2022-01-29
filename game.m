% this is the game driver, where both functions are called and run. 

% clears the workshop and command window 
clc; clear;

% intialises situation for user and computer to a boolean value of false. 
situationUser = false;
situationComp = false;

% initialises position for user token to 1 (calls to [2,2] on the board)  
position_1 = 1;

% initialises position for computer token to 1 (calls to [6,6] on the board)
compPosition_1 = 1;


% a while loop is run until either computer or user token wins the game. 
while situationUser ~= true && situationComp ~= true
    
    % a command that supports all position values from 1 to 270
    if position_1 <= 27 && compPosition_1 <= 27
        
        % asks the user to roll 
        askUser = input("Type 'r' to roll dice: ", 's');
        
        % checks whether the string is value, if so then it rolls the dice
        if strcmp(askUser, 'r')
            rng shuffle;
            
            % setting the value of the number rolled from dice to this variable
            r = randi([1,6]);
            
            % prints the value rolled
            fprintf("user rolled %d.\n", r); 
        end 
        
        % calculates new position for user token (position_2) depending on the value of r
        position_2 = position_1 + r;
        
        % computer rolls the dice 
        rng shuffle;
        
        % sets value rolled to this variable 
        rComp = randi([1,6]); 
        
        % prints the value rolled for comptuer 
        fprintf("Computer rolled %d.\n", rComp);
        
        % calculates new position for comp token (compPosition_2) depending
        % on the value of rComp 
        compPosition_2 = compPosition_1 + rComp;
        
        
        % restriction User & computer tokens 
        
        % checks the restriction for position_1 = 21 and r = 6
        if position_1 == 21 && (r == 6)
            position_2 = 27;  % position_2 = 21 + 6 = 27. 
            
            % prints the winning message 
            fprintf("You Won!\n");
            
            % while loop stops 
            situationUser = true;
        end
        
        % checks the restriction for position_1 = 21 and r <=5
        if position_1 == 21 && (r <= 5)
            % new position is calculated 
            position_2 = position_1 + r;
        end
        
        
        % the same process is applied to computer token 
        if compPosition_1 == 21 && (rComp == 6)
            compPosition_2 = compPosition_1 + 6; % new comp positino = 27
            
            % prints the winning message 
            fprintf("Computer Wins!\n");
            
            % while loop stops 
            situationComp = true;
        end
        
        % checks for compPosition = 21 and rComp <= 5 
        if compPosition_1 == 21 && (rComp <= 5)
            
            % calcualtes the new computer token position 
            compPosition_2 = compPosition_1 + rComp;
        end
        
        % repeated process but position_2 = 22 and r = 5 
        if position_1 == 22 && (r == 5)
            
            % new position calculated 
            position_2 = position_1 + 5;
            
            % prints a winning message 
            fprintf("You Won!\n");
            
            % while loop stops 
            situationUser = true;
        end
        
        % restriction for position_1 = 22 and r <= 4 
        if position_1 == 22 && (r <= 4)
            % new position calculated for user token 
            position_2 = position_1 + r;
        end
        
        % repeats the same process for computer token 
        if compPosition_1 == 22 && (rComp == 5)
            compPosition_2 = compPosition_1 + 5;
            fprintf("Computer Wins!\n");
            situationComp = true;
        end
        
        % repeats the same process for computer token 
        if compPosition_1 == 22 && (rComp <= 4)
            compPosition_2 = compPosition_1 + rComp;
        end
        
        % repeats the same process but position_1 = 23 and r = 4 
        if position_1 == 23 && (r == 4)
            
            % new position calcualted (27) 
            position_2 = position_1 + 4;
            
            % prints winning message 
            fprintf("You Won!\n");
            situationUser = true;
        end
        
        % position = 23 and r <=3 
        if position_1 == 23 && (r <= 3)
            % position calculated 
            position_2 = position_1 + r;
        end
        
        % repeats the same process but computer position = 23 and r =4 
        if compPosition_1 == 23 && (rComp == 4)
            compPosition_2 = compPosition_1 + 4;
            fprintf("Computer Wins!\n");
            situationComp = true;
        end
        
        % composition = 21 and rcomp <= 3
        if compPosition_1 == 21 && (rComp <= 3)
            
            % new position is calcualted 
            compPosition_2 = compPosition_1 + rComp;
        end
        
        % restriction for tokens when they are 4 boxes away from centre 
        
        % if token is 4 boxes away and it rolls r >= 4 then the token can't go up
        if position_1 == 24 && (r >= 4)
            
            % new position remains at 24 
            position_2 = 24;
            
            % prints a message 
            fprintf("Can't go up, wait for your turn\n");
        end
        
        % if token is 4 boxes away and it rolls r <= 3 
        if position_1 == 24 && (r <= 3)
            
            % calculate new position 
            position_2 = position_1 + r;
        end
        
        % repeated process for computer token = 24 
        if compPosition_1 == 24 && (rComp >= 4)
            compPosition_2 = 24;
            fprintf("Computer can't go up, Waiting..\n");
        end
        
        % repeated process for computer token = 24
        if compPosition_1 == 24 && rComp == 3
            compPosition_2 = compPosition_1 + rComp;
            fprintf("Computer Wins!");    
        else if compPosition_1 == 2 && rComp <= 2 
                compPosition_2 = compPosition_1+rComp; 
            end 
        end
        
        % if token is 3 boxes away and it rolls r >= 3
        if position_1 == 25 && (r >= 3) 
            % the new position remains at 25 
            position_2 = 25;
            
            % prints a message 
            fprintf("Can't go up, wait for your turn\n");
        end
        
        % if token is 3 boxes away and it rolls r <= 2 
        if position_1 == 25 && (r <= 2)
            
            % calculates new position of token 
            position_2 = position_1 + r;
        end
        
        % repeated process for computer token which is 3 boxes away and rComp >= 3
        if compPosition_1 == 25 && (rComp >= 3)
            
            % calcuates new position computer token 
            compPosition_2 = compPosition_1;
            
            % prints a message 
            fprintf("Computer Can't go up, waiting..\n");
        end
        
        % repeated process for comptuer token which is 3 boxes away and rComp <=2 
        if compPosition_1 == 25 && rComp <= 2
            
            % calculates new position 
            compPosition_2 = compPosition_1 + rComp;
        end
        
        % if user token is 1 box away and it rolls r>= 2
        if position_1 == 26 && (r >=2)
            
            %token position remains at 26
            position_2 = position_1;
            
            % prints a message 
            fprintf("Can't go up, wait for your turn\n");
        end
        
        % if token is 1 box away and it rolls 1 
        if position_1 == 26 && r == 1
            
            % token goes up, new position 
            position_2 = position_1 + r;
        end
        
        % repeated process for comp token which is 1 box away and rComp >=2
        if compPosition_1 == 26 && (rComp >= 2) 
            
            % comp token remains at 26 
            compPosition_2 = compPosition_1;
            
            % prints a message 
            fprintf("Can't go up, waiting..\n");
        end
        
        % if comp token is 1 box away and it rolls 1 
        if compPosition_1 == 26 && rComp == 1
            % token goes up, new comp position 
            compPosition_2 = compPosition_1 + rComp;
            fprintf("comp wins!"); 
            situationUser = true; 
        end
        
%         if position of token is 27 (centre) 
        if position_2 == 27
            
            % prints a winning message 
            fprintf("You Won!\n");
            
            % while loop stops  
            situationUser = true;
        end
        
        % if position of computer token is 27  
        if compPosition_2 == 27
            
            % prints a winning message 
            fprintf("Computer Wins!");
            
            % while loop stops
            situationComp = true;
        end
        
        % end restriction
        
        % calls the movement function with all 4 parameters 
        movement(position_1, position_2, compPosition_1, compPosition_2);
        
        % position is now set to position_2 for user token 
        position_1 = position_2;
        
        % position is now set to compPosition_2 for comp token 
        compPosition_1 = compPosition_2;
        
    else
        % while loop stops
        situationUser = true;
        
        % while loop stops
        situationComp = true;
    end
    
end
