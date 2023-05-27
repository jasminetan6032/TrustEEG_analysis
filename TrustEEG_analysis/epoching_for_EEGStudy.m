epochedfiledir = 'C:\Users\jasminet\Desktop\TrustEEG\Epoched';
icarfiledir = 'C:\Users\jasminet\Desktop\TrustEEG\ICAr';
icar_renamed_filedir = 'C:\Users\jasminet\Desktop\TrustEEG\ICAr_Renamed';

load("participants.mat");
load("epoch_info.mat")
for part_i = 1:length(Participants)

    EEG = pop_loadset('filename',['Participant' Participants{part_i} '_icar.set'],'filepath',icarfiledir);
    %rename triggers
    triggers = unique({EEG.event.type});
    triggers = transpose(triggers);
    corrections = {'111' '112' '71' '72' '73','74',...
        '1' '10' '2' '3' '4' '51' '52' '61' '62' '63' '64' '8' '91' '92'};
    corrections = transpose(corrections);
    fixed_triggers = [triggers,corrections];


    for trigger_i= 1:length(fixed_triggers)
        for i = 1:length(EEG.event)
            if (strcmp(EEG.event(i).type, fixed_triggers{trigger_i,1}))
                EEG.event(i).type = fixed_triggers{trigger_i,2};
            end
        end
    end
    EEG_icar_renamed = pop_saveset(EEG, 'filename',['Participant' Participants{part_i} '_icar_renamed.set'],'filepath',icar_renamed_filedir);

    for trigger_i = 1:length(epoch_info)

        EEG_epochs = pop_epoch( EEG_icar_renamed, epoch_info(trigger_i,1), [-1  1], 'newname', 'BDF file pruned with ICA epochs', 'epochinfo', 'yes');
        EEG_epochs = pop_saveset(EEG_epochs, 'filename',['Participant' Participants{part_i,3} epoch_info{trigger_i,2} '.set'],'filepath',epochedfiledir);
        EEG_epochs = pop_rmbase( EEG_epochs, [-100 0] ,[]);
        EEG_epochs = pop_saveset(EEG_epochs, 'filename',['Participant' Participants{part_i,3} epoch_info{trigger_i,2} '_br.set'],'filepath',epochedfiledir);
        EEG_epochs = pop_eegthresh(EEG_epochs,1,[1:64],-100,100,0,1,0,1);
        EEG_epochs = pop_saveset(EEG_epochs, 'filename',['Participant' Participants{part_i,3} epoch_info{trigger_i,2} '_br_p.set'],'filepath',epochedfiledir);
        EEG_epochs = [];
        EEG_icar = [];

    end
end

