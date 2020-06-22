function [C] = singleDCM(angle,rotation_index, unit)
%DCM : This function returns Direction Cosine matrix for a single Euler rotation
%   Input Arguments: angle,rotation_index, unit
%   angle: angle of rotation (in degrees or radians)
%   rotation_index = 1, 2 or 3 ==> rotation about 1st, 2nd or 3rd axis
%   unit = 'deg' for degrees (default), 'rad' for radians
%
%   Output: [C] which is the DCM rotation for the given angle
%   NOTE: Returns Identity DCM if given invalid arguments

% Initializing DCM matrix
C = eye(3,3);

% Taking unit as degrees if not found or not provided as radians
if nargin~=3 || ~strcmp(unit,'rad')
    unit = 'deg';
end

% Checking if rotation axis provided is valid
if 1<=rotation_index && rotation_index<=3
    if rotation_index == 1  %   Rotation about the first axis
        if strcmp(unit,'deg')
            C = [1 0 0; 0 cosd(angle) sind(angle); 0 -sind(angle) cosd(angle)];
        else
            C = [1 0 0; 0 cos(angle) sin(angle); 0 -sin(angle) cos(angle)];
        end
    elseif rotation_index == 2  %   Rotation about the second axis
        if strcmp(unit,'deg')
            C = [cosd(angle) 0 -sind(angle); 0 1 0; sind(angle) 0 cosd(angle)];
        else
            C = [cos(angle) 0 -sin(angle); 0 1 0; sin(angle) 0 cos(angle)];
        end
    elseif rotation_index == 3  %   Rotation about the third axis
        if strcmp(unit,'deg')
            C = [cosd(angle) sind(angle) 0; -sind(angle) cosd(angle) 0; 0 0 1];
        else
            C = [cos(angle) sin(angle) 0; -sin(angle) cos(angle) 0; 0 0 1];
        end
    end
else
    % Displaying error message
    disp("Invalid axis of rotation")
    disp("Returning Identity DCM")
end

end

