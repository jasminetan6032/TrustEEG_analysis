epochedfiledir = 'C:\Users\jasminet\Desktop\TrustEEG\Epoched_advisor';
icar_renamed_filedir = 'C:\Users\jasminet\Desktop\TrustEEG\ICAr_Renamed';

load("participants.mat");

%epoching information
epoch_info{1,1} = '61';
epoch_info{1,2} = '_advisor_accurate_feedback';
epoch_info{2,1} = '62';
epoch_info{2,2} = '_advisor_copycat_feedback';
epoch_info{3,1} = '63';
epoch_info{3,2} = '_advisor_accurate_nofeedback';
epoch_info{4,1} = '64';
epoch_info{4,2} = '_advisor_copycat_nofeedback';

for part_i = 1:length(Participants)

    EEG_icar_renamed = pop_loadset('filename',['Participant' Participants{part_i} '_icar_renamed.set'],'filepath',icar_renamed_filedir);

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

