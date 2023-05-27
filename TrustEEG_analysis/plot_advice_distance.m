for events = 1:length(trialmatrix)
    trialmatrix(events).advice_resp_distance_test = get_distance_half(trialmatrix(events).Advice, trialmatrix(events).Resp);
end 

for events = 1:length(trialmatrix)
    trialmatrix(events).advice_resp_distance_test = abs(trialmatrix(events).Advice - trialmatrix(events).Resp);
end 

mean_distance = mean(cell2mat({trialmatrix.advice_resp_distance}));
for events = 1:length(trialmatrix)
    if trialmatrix(events).advice_resp_distance < mean_distance
    trialmatrix(events).distance_cat= 0;
    else 
        trialmatrix(events).distance_cat= 1;
    end 
end 

%sum(cell2mat({trialmatrix.distance_cat}))

trialmatrix_clean = trialmatrix[trialmatrix.advice_noisy]

%find epochs that are high or low in advice - resp distance
advice_distance_group = cell2mat({trialmatrix.distance_cat});
low_distance = find(advice_distance_group == 0);
high_distance = find(advice_distance_group == 1);

hist(cell2mat({trialmatrix.advice_resp_distance}))

%concatenate these epochs and plot high vs low distance ERPs
