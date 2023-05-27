function LoadFilesIntoStudy(targetFolder,fileSeparator,length_of_prefix,ALLEEG)

allSetFiles = dir([targetFolder filesep fileSeparator]); % filesep inserts / or \ depending on your OS.
 
% Start the loop.
for setIdx = 1:length(allSetFiles)
 
    % Obtain the file names for loading.
    loadName = allSetFiles(setIdx).name; % subj123_group2.set
    dataName = loadName(1:end-(length(fileSeparator)-1));        % subj123_group2
 
    % Load data. Note that 'loadmode', 'info' is to avoid loading .fdt file to save time and RAM.
    EEG = pop_loadset('filename', loadName, 'filepath', targetFolder, 'loadmode', 'info');
 
    % Enter EEG.subjuct.
    EEG.subject = dataName(1:length_of_prefix); % subj123
 
    % Enter EEG.group.
    EEG.group = dataName(length_of_prefix+1:end); % group2
 
    % Store the current EEG to ALLEEG.
    [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, 0);
end
eeglab redraw % This is to update EEGLAB GUI so that you can build STUDY from GUI menu.

end 