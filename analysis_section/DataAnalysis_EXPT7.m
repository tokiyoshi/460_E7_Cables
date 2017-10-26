%% PHYS460A: Experiment 7
% Waves and Pulses in Cables
% Ben MacLellan

clear all; clc; close all

%% Part 1
a = 1; %inner diameter
b = 2; %outer diameter

epsilon = 1;
mu = 1;

C = 2*pi/log(b/a) * epsilon;
L = 1/(2*pi) * log(b/a) * mu;

%% Part 2a:
% open termination
numOpen=sortrows(xlsread("Data.xlsx",1));
fOpen = numOpen(:,1);
vOpen = numOpen(:,2);
vOpen_e = numOpen(:,3);
iOpen = numOpen(:,4);
iOpen_e = numOpen(:,5);

zOpen = vOpen./iOpen;
zOpen_e = zOpen.*sqrt((vOpen_e./vOpen).^2 + (iOpen_e./iOpen).^2);

x = fOpen;
y = zOpen;
fitType = fittype('a*abs(tan(b*(x+c))) + d*x',...
    'dependent',{'y'},'independent',{'x'},...
    'coefficients',{'a','b','c','d'});

openFit = fit(x,y,fitType,'Exclude',zOpen>65,'Lower',[20,1,-2.5,0],'Upper',[100,3,-2.3,15])
xfitOpen = linspace(min(x),max(x),10000);
yfitOpen = feval(openFit,xfitOpen);

figure(1); hold on;
errorbar(fOpen,zOpen,zOpen_e,'.');
plot(xfitOpen,yfitOpen);
axis([min(fOpen),max(fOpen),min(zOpen),max(zOpen)])
xlabel('Frequency, MHz')
ylabel('Impedance')
title('Open')
savefig('OpenFit.fig')

[pks,locs] = findpeaks(-yfitOpen)
zMin = yfitOpen(locs)
fMin = xfitOpen(locs)
dfMin = [mean(diff(fMin)), std(diff(fMin))]
% (1:5).*(openFit.b) + (-openFit.c)



% closed termination
numClosed=sortrows(xlsread("Data.xlsx",2));

fClosed = numClosed(:,1);
vClosed = numClosed(:,2);
vClosed_e = numClosed(:,3);
iClosed = numClosed(:,4);
iClosed_e = numClosed(:,5);

zClosed = vClosed./iClosed;
zClosed_e = zClosed.*sqrt((vClosed_e./vClosed).^2 + (iClosed_e./iClosed).^2);

x = fClosed;
y = zClosed;
fitType = fittype('a*abs(tan(b*(x+c))) + d*x',...
    'dependent',{'y'},'independent',{'x'},...
    'coefficients',{'a','b','c','d'});

closedFit = fit(x,y,fitType,'Exclude',zClosed>65,'Lower',[20,1,-1.8,0],'Upper',[100,3,-1.6,15])
xfitClosed = linspace(min(x),max(x),10000);
yfitClosed = feval(closedFit,xfitClosed);

figure(2); hold on;
errorbar(fClosed,zClosed,zClosed_e,'.');
plot(xfitClosed,yfitClosed);
axis([min(fClosed),max(fClosed),min(zClosed),max(zClosed)])
xlabel('Frequency, MHz')
ylabel('Impedance')
title('Closed')
savefig('ClosedFit.fig')

save('ProcessedData.mat')

%% Part 3: