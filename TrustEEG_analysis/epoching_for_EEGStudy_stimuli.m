icar_renamed_filedir = 'C:\Users\jasminet\Desktop\TrustEEG\ICAr_Renamed';
epochedfiledir = 'C:\Users\jasminet\Desktop\TrustEEG\Epoched_stimuli';

load("participants.mat");

%epoching information
epoch_info{1,1} = '4';
epoch_info{1,2} = '_stimuli';

for part_i = 1:length(Participants)

    EEG_icar_renamed = pop_loadset('filename',['Participant' Participants{part_i} '_icar_renamed.set'],'filepath',icar_renamed_filedir);

    for trigger_i = 1:size(epoch_info,1)

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

fileSeparator = '*_br_p.set';
length_of_prefix = length(['Participant' Participants{part_i,3}]);

allSetFiles = dir([epochedfiledir filesep fileSeparator]); % filesep inserts / or \ depending on your OS.
 
% Start the loop.
for setIdx = 1:length(allSetFiles)
 
    % Obtain the file names for loading.
    loadName = allSetFiles(setIdx).name; % subj123_group2.set
    dataName = loadName(1:end-(length(fileSeparator)-1));        % subj123_group2
 
    % Load data. Note that 'loadmode', 'info' is to avoid loading .fdt file to save time and RAM.
    EEG = pop_loadset('filename', loadName, 'filepath', epochedfiledir, 'loadmode', 'info');
 
    % Enter EEG.subjuct.
    EEG.subject = dataName(1:length_of_prefix); % subj123
 
    % Enter EEG.group.
    EEG.group = dataName(length_of_prefix+1:end); % group2
 
    % Store the current EEG to ALLEEG.
    [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, 0);
end
eeglab redraw % This is to update EEGLAB GUI so that you can build STUDY from GUI menu.