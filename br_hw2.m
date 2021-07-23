clear;
close all;

h1 = 5.0; % height of Tx
h2 = 1.5; % height of Rx

lambda = physconst('LightSpeed')/5e9;


d = logspace(0,4,1000); % 10^0 to 10^4 with 1000 logarithmically spaced points in between
e0_et_2  = (lambda ./(4 .*pi.*d)).^2 ; %(e0/et)^2
r1 = sqrt(d.^2 + (h1 - h2).^2); % distance travelled by LOS ray
r2 = sqrt(d.^2 + (h1 + h2).^2); % distance travelled by reflected ray

pathloss  = e0_et_2 .* (cos(2.*pi.*(r2-r1)./lambda)-cos(0)).^2;
pathloss = 10*log10(pathloss);
semilogx(d, pathloss)
% loglog(d,pathloss)
title('Path loss vs distance plot for 2-path model');
xlabel('Distance from Tx (m)');
ylabel('Attenuation (dB)');
grid on

% ideal receiver just sums up received signal
% reflection coeff = -1, therefore second term is -ve in the path loss eq.

%% Notes
% The two-rays ground-reflection model is a multipath radio propagation model 
% which predicts the path losses between a Tx and a Rx
% when they are in line of sight (LOS).