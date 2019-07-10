
% load the model coefficients
load('coefficients.mat');

% -------------------------------------------------------

% The size of the coefficients 81*131*91, The first two dimensions represent 
% the latitude and the longitude, respectively, and the third dimension stores
% the model coefficients and the reference height at each grid point
% 
% For the third dimension:
% 
% 1-25   model coefficients of ZHD
% 25-30  model coefficients of ZHD lapse rate
% 31-55  model coeffiicents of ZWD
% 56-60  model coefficients of ZWD lapse rate
% 61-85  model coefficients of Tm
% 86-90  model coefficients of Tm lapse rate
% 91     height of grid point unit: km

% -------------------------------------------------------

% This is an example
lat  = 24.4333; % unit: degree
lon  = 103.5; % unit: degree
h    = 1.1809;  % unit: km
doy  = 1;       %
hod  = 12;% 

% Use the CTrop model
[zhd,zwd,tm] = CTrop(lat,lon,h,doy,hod,coefficients);

% Output the results
disp(['ZHD is ',num2str(zhd),' mm']);
disp(['ZWD is ',num2str(zwd),' mm']);
disp(['Tm is ',num2str(tm),' K']);
