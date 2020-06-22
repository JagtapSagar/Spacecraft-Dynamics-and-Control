function [e, phi, long_phi] = dcm2prv(C, unit)
%dcm2prv This function returns Principal Rotation Vector parameters for any
%given Direction Cosine Matrix
%
%   Input Argument: C, unit
%   C: A Direction Cosine Matrix
%   unit: Specifies unit of angle, 'deg; or 'rad' (radians by default)
%
%   Outputs: e, phi, long_phi
%   e: Unit Principal Rotation Vector
%   phi: Short angle of rotation about e
%   long_phi: Long angle of rotation about e
%
%   Dependency: None

if nargin~=2 || ~strcmp(unit,'deg')
    phi = acos(0.5*(C(1,1)+C(2,2)+C(3,3)-1));
    long_phi = phi-2*pi;
    e = 1/(2*sin(phi))*[C(2,3)-C(3,2);C(3,1)-C(1,3);C(1,2)-C(2,1)];
else
    phi = acosd(0.5*(C(1,1)+C(2,2)+C(3,3)-1));
    long_phi = phi-360;
    e = 1/(2*sind(phi))*[C(2,3)-C(3,2);C(3,1)-C(1,3);C(1,2)-C(2,1)];
end

if abs(phi)==180 || abs(phi)==0 || abs(phi)==360 || ...
        abs(phi)==pi || abs(phi)==pi/2
    disp("Encountered Singularity.")
    disp("Returned vector may not be usable.")

end

