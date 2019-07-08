
function [zhd,zwd,tm] = CTrop_grid(h,doy,hod,a)

% This function is used to calcualte tropospheric parameters at a grid
% point

C1 = cos(doy*2*pi/365.25);
S1 = sin(doy*2*pi/365.25);
C2 = cos(doy*4*pi/365.25);
S2 = sin(doy*4*pi/365.25);
c1 = cos(hod*2*pi/24);
s1 = sin(hod*2*pi/24);
c2 = cos(hod*4*pi/24);
s2 = sin(hod*4*pi/24);

% Get the ZHD, ZWD, and Tm at the reference level and their lapse rates

zhd0 = a(1)     + a(2)*C1     + a(3)*S1     + a(4)*C2     + a(5)*S2     + ...
       a(6)*c1  + a(7)*c1*C1  + a(8)*c1*S1  + a(9)*c1*C2  + a(10)*c1*S2 + ...
       a(11)*s1 + a(12)*s1*C1 + a(13)*s1*S1 + a(14)*s1*C2 + a(15)*s1*S2 + ...
       a(16)*c2 + a(17)*c2*C1 + a(18)*c2*S1 + a(19)*c2*C2 + a(20)*c2*S2 + ...
       a(21)*s2 + a(22)*s2*C1 + a(23)*s2*S1 + a(24)*s2*C2 + a(25)*s2*S2;
   
zhdh = a(26)    + a(27)*C1    + a(28)*S1    + a(29)*C2    + a(30)*S2;
   
zwd0 = a(31)    + a(32)*C1    + a(33)*S1    + a(34)*C2    + a(35)*S2    + ...
       a(36)*c1 + a(37)*c1*C1 + a(38)*c1*S1 + a(39)*c1*C2 + a(40)*c1*S2 + ...
       a(41)*s1 + a(42)*s1*C1 + a(43)*s1*S1 + a(44)*s1*C2 + a(45)*s1*S2 + ...
       a(46)*c2 + a(47)*c2*C1 + a(48)*c2*S1 + a(49)*c2*C2 + a(50)*c2*S2 + ...
       a(51)*s2 + a(52)*s2*C1 + a(53)*s2*S1 + a(54)*s2*C2 + a(55)*s2*S2;
   
zwdh = a(56)    + a(57)*C1    + a(58)*S1    + a(59)*C2    + a(60)*S2;

tm0  = a(61)    + a(62)*C1    + a(63)*S1    + a(64)*C2    + a(65)*S2    + ...
       a(66)*c1 + a(67)*c1*C1 + a(68)*c1*S1 + a(69)*c1*C2 + a(70)*c1*S2 + ...
       a(71)*s1 + a(72)*s1*C1 + a(73)*s1*S1 + a(74)*s1*C2 + a(75)*s1*S2 + ...
       a(76)*c2 + a(77)*c2*C1 + a(78)*c2*S1 + a(79)*c2*C2 + a(80)*c2*S2 + ...
       a(81)*s2 + a(82)*s2*C1 + a(83)*s2*S1 + a(84)*s2*C2 + a(85)*s2*S2;
   
tmh  = a(86)    + a(87)*C1    + a(88)*S1    + a(89)*C2    + a(90)*S2;

h0   = a(91)/1000;

% Height correction

zhd = zhd0*exp((h0-h)/zhdh)*1000;
zwd = zwd0*exp((h0-h)/zwdh)*1000;
tm  = tm0 - tmh*(h - h0);
