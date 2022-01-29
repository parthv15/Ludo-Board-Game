% this function is used to animate the movement of user token and computer
% token while going from initial position to new position 
% the function takes 4 parameters, 2 for user token position and 2 for
% computer token position. 

% a function with 4 parameters
function [] = movement(userNum1,userNum2,compNum3, compNum4)
% userNum1 = position_1 
% userNum2 = position_2 
% compNum3 = compPosition_1 
% compNum4 = compPosition_2 

% this calculates the distance between position_2 and position_1  
userFinal_num = userNum2-userNum1;

% this calculates the distnace between compPosition_2 and compPosition_1 
compFinal = compNum4 - compNum3; 

% looping from 1 to distance for user token 
for i=1:userFinal_num
    
    % calling the function to a variable, where position_1 is changed and compPosition_1
    % remains constant 
    testboard1 = testboard(i+userNum1, compNum3); 
    
    % displaying the board 
     imshow(testboard1);
     % pausing at every movement for 0.1 seconds 
    pause(0.1);   
end 

% looping from 1 to distance for computer token 
  for j = 1:compFinal 
      
        % calling the function the same variable, but compPosition_1 is
        % changing and position_1 remains constant as it was in the first
        % loop. 
        testboard1 = testboard(i + userNum1,j+compNum3); 
        
        % displays both tokens on the same board 
         imshow(testboard1);
         
         % pauses for 0.1 at every movement
         pause(0.1);        
  end 
    
  % pauses for 1 second after both turns have ended 
    pause(1);
end 
 
















 
