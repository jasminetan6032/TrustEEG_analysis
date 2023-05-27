%sorting out Participant 20
problem_triggers{1} = '74';
problem_triggers{1} = '71';
problem_triggers{2} = '72';
problem_triggers{3} = '73';
problem_triggers{4} = '74';
problem_triggers{5} = '111';
problem_triggers{6} = '112';
for idx = 1:length(problem_triggers)
    prob_trig = problem_triggers{idx};
    for event = 1:length(EEG.event)
        if strcmp(EEG.event(event).type,prob_trig)
            EEG.event(event).edftype = str2num(prob_trig);
        end
    end
end

triggers = [1,2,3,4,51,52,61,62,63,64,71,72,73,74,8,91,92,10,111,112];
for i = 1:length(triggers)
    trigger = triggers(i);
    number_of_triggers(i)= sum(x(:) == trigger);
end

trialmatrix_file = 'C:\Github\Trust_experiment\experiments\TrustEEG\participants\p20_031022-105731\answers.csv';

    behaviour_data = readtable(trialmatrix_file);
    trialmatrix = table2struct(behaviour_data);

    Participant20_missingdata = [520,521,522,523];

    for events = 1:length(trialmatrix)

        trialmatrix(events).missingdata = 0;

        for missing = 1:length(Participant20_missingdata)
            if events == Participant20_missingdata(missing)
                trialmatrix(events).missingdata = 1;
            end
        end
    end

