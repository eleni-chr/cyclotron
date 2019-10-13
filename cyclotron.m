function [E,N] = cyclotron(V)

% Input argument must be a scalar. The input argument is the voltage applied
% to a cyclotron (see attached figure), which is a device that accelerates
% subatomic particles (positively charged isotopes of hydrogen, called
% “deuterons”) which spiral outward in a clockwise direction. The cyclotron
% rapidly alternates the sign of the voltage difference V in units of volts
% between two “D”-shaped vacuum chambers (blue outlines in the figure),
% which are placed within a strong uniform magnetic field (not shown but
% perpendicular to the screen). The deuteron is accelerated only as it is
% leaving one “D” and entering the other. While the deuteron is inside a
% given “D”, it moves at a constant speed, and the magnetic field causes it
% to move on a semicircle. Each deuteron moves as follows (check the numbers
% in the figure): (1) It originates from a source (red dot) located at a
% distance ??0 to the left of the center of the cyclotron, is accelerated
% vertically into the upper “D” and then moves on a semi-circle of radius r1.
% (2) It leaves the upper “D” and is accelerated vertically downward into
% the lower “D” where it moves with a larger radius r2. (3) It leaves the
% lower “D” and is accelerated vertically into the upper “D”, etc, moving
% with ever increasing radii until (N) it is accelerated for the final
% time as it leaves the upper “D” and enters the lower “D”, follows a
% semicircle, and emerges from the cyclotron at the left. The deuteron
% escapes through a window at the left that is placed so the particle cannot
% leave until it is more than 0.500 meters to the left of the center of the
% cyclotron. The gap between the “D”s is exaggerated in the figure, has no
% effect, and can be assumed to be of zero width. The function returns the
% energy E of the deuteron when it escapes in units of million electron
% volts (MeV), and the number N of times the deuteron enters the “D”s.
% Notice that the centres of the semicircles ? the center of the cyclotron.

% Example run:
% >> [E, N] = cyclotron(4.8e5)
% E =
%    16.32
% N =
%    34

m=3.344e-27; %deuteron mass (in units of kg).
q=1.603e-19; %deuteron charge (in units of coulomb).
B=1.600; %magnetic field strength (in units of tesla).
r1=sqrt((m*V)/(q*(B^2))); %radius (in units of meters).
x=-r1/2;
orbits=0;
while x>-0.5
    r2=sqrt(r1^2+((2*m*V)/(q*(B^2))));
    x=x+(2*r1); 
    r1=r2;
    orbits=orbits+1;
    
    r2=sqrt(r1^2+((2*m*V)/(q*(B^2))));
    x=x-(2*r1); 
    r1=r2;
    orbits=orbits+1;
end
N=orbits; %number of times the deuteron enters the “D”s.
E=(V*N)*1e-6; %energy (in units of million electron volts - MeV).
end