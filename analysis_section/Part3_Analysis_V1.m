close all; clc;

traceOpen = csvread('.\raw_data\scope_0.csv',3);
traceClosed = csvread('.\raw_data\scope_1.csv',3);
traceMatched = csvread('.\raw_data\scope_2.csv',3);

figure(1); hold on;
subplot(2,1,1)
plot(traceOpen(:,1), traceOpen(:,2)); hold on;
plot(traceClosed(:,1), traceClosed(:,2))
plot(traceMatched(:,1), traceMatched(:,2))

subplot(2,1,2)
plot(traceOpen(:,1), traceOpen(:,3)); hold on;
plot(traceClosed(:,1), traceClosed(:,3))
plot(traceMatched(:,1), traceMatched(:,3))

legend('Open','Closed','Matched')