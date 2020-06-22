function [C] = setDCM(first, second, third, theta1, theta2, theta3, unit)
%setDCM Returns the Direction Cosine Matrix for a set of Euler Angle
%rotations.
%   
%   Input Arguments: first, second, third, theta1, theta2, theta3, unit
%   first, second, third: are the order of Euler Angle rotations
%   theta1, theta2, theta3: are the angles rotated in order
%   unit = 'deg' for degrees (default), 'rad' for radians
%
%   Output: [C] which is the DCM rotation of the set
%   NOTE: Returns Identity DCM if given invalid arguments

% Initializing DCM matrix
C = eye(3,3);

% Check if all necessary arguments were provided
if nargin <6
    disp("Not enough arguments!")
    disp("Returning Identity DCM")
else
    if (first ~= second) && (second ~= third) && (1<=first && first<=3)...
            && (1<=second && second<=3) && (1<=third && third<=3)

        % Taking unit as degrees if not found or not provided as radians
        if nargin~=7 || ~strcmp(unit,'rad')
            unit = 'deg';
        end

        % Calculating DCM for set
        C = singleDCM(theta3, third, unit)*...
            singleDCM(theta2, second, unit)*...
            singleDCM(theta1, first, unit);

    else
        % If the set is not valid
        disp("Invalid set")
        disp("Returning Identity DCM")
    end
end

end

