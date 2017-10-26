a = [5.14,4.79,4.81,4.73,4.69];
a_av = mean(a);
a_std = std(a);

b = [0.59,0.60,0.59,0.58,0.59];
b_av = mean(b);
b_std = std(b);

load('ProcessedData.mat')


[pks,locs] = findpeaks(-yfitOpen)
zMinOpen = yfitOpen(locs)
fMinOpen = xfitOpen(locs)
diff(fMinOpen)
dfMinOpen = [mean(diff(fMinOpen)), std(diff(fMinOpen))]

[pks,locs] = findpeaks(-yfitClosed)
zMinClosed = yfitClosed(locs)
fMinClosed = xfitClosed(locs)
diff(fMinClosed)
dfMinClosed = [mean(diff(fMinClosed)), std(diff(fMinClosed))]

dFOpen = [pi/1.909 , 0.01/1.909 * pi/1.909]
dFClosed = [pi/1.902 , 0.01/1.902 * pi/1.902]