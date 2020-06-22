function [DCM_dot] = DCM_rate(DCM,w)
%DCM_rate : This function returns Direction Cosine matrix rates for
%integration. If output is BN_dot, then w in B frame.
%   Inputs: DCM and w (angular velocity vector)
%   Output: DCM_dot
%   
%   Performs operation C_dot = -w_tilde*C
%   Matrix property: Vector XxY = [X_tilde]Y
%   [X_tilde] is skew-symmetric
%   [X_tilde]X = XxX = 0
%   [X_tilde]' = -[X_tilde]

% Using cross-product operator (w x y = w_tilda * y)
w_tilde = [0 -w(3) w(2); w(3) 0 -w(1); -w(2) w(1) 0];
DCM_dot = -w_tilde*DCM;

end

