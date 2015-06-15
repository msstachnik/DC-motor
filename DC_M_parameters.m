% motor parameters
%% data
DC_M.Pn = 22e3;    %W nominal power
DC_M.In = 55.6;     %A nominal current
DC_M.Un = 440;      %V nominal voltage of suply
DC_M.dUp = 2;       %V voltage drop
DC_M.rmp = 1500;    %rmp
DC_M.J = 2.7;       %kg/m^2 inertia
DC_M.Rt = 0.465;    %Ohm Resistane
DC_M.Tt = 0.033;    %s electrical time constant
DC_M.I_iddle = 2;   %A no load current

%% calculations
% nomianal armature voltage:
DC_M.En = DC_M.Un - (DC_M.In * DC_M.Rt) - DC_M.dUp;
%nominal speed in rad/s :
DC_M.Omega_n = convangvel(DC_M.rmp,'rpm','rad/s');
% electrical constant multiply nominal magnetic field
DC_M.Ce_ni = DC_M.En / DC_M.Omega_n;

% Mechanical constant multiply nominal magnetic field
DC_M.Cm_ni = DC_M.Ce_ni;

% elecromechanical time constant
DC_M.Tm = DC_M.J * DC_M.Rt / (DC_M.Ce_ni * DC_M.Cm_ni);

% nominal torque
DC_M.Mn = DC_M.Pn / DC_M.Omega_n;

% inductance
DC_M.Lt = DC_M.Rt * DC_M.Tt;

% torque constant
DC_M.M_const = DC_M.Mn / DC_M.In;
