%load and start correct eeglab version before running script
%for laptop or work computer(addpath('D:\Jasmine\EEG\eeglab_versions\eeglab_current\eeglab2021.1'))
%for home computer (addpath('D:\Jasmine\MRes Research Methods in
%Psychology\Conferences\EEGLAB Tigullio 2016\eeglab_sml_v3\eeglab_sml_v3'))
%remember to adjust for channel locations look up (line 26)

folders = {'C:\Users\jasminet\Desktop\TrustEEG'};

Participants = struct;

filtfiledir = 'C:\Users\jasminet\Desktop\TrustEEG\Filt';
%filt6Hzfiledir = 'E:\Jasmine\EEG\IST\ICA_6Hz\Filt';
icafiledir = 'C:\Users\jasminet\Desktop\TrustEEG\ICA';

for i = 1:length(folders)
    
    
    files = dir(fullfile(folders{i},'*.bdf'));
    files = {files.name};

    parfor ii = 9 %1:length(files)
        
        %EEG = pop_loadset('filename',files{ii},'filepath',folders{i});
        %cd(filedir);
        EEG = pop_biosig([folders{i} '\' files{ii}], 'ref',[65 66] ,'refoptions',{'keepref' 'off'} );
        
        EEG=pop_chanedit(EEG, 'lookup','C:\\Users\\jasminet\\Documents\\eeglab2021.1\\plugins\\dipfit\\standard_BEM\\elec\\standard_1005.elc');
        EEG = pop_eegfiltnew(EEG, [], 0.5, 3380, true, [], 0);%high-pass filter
        %EEG = pop_eegfiltnew(EEG, [], 6, 846, 0, [], 1);
        EEG = pop_eegfiltnew(EEG, [], 30, 226, 0, [], 1); %low-pass filter (30Hz for ERP analysis)
        %EEG = pop_eegfiltnew(EEG, 48, 52, 846, 1, [], 0); %notch filter
        EEG = pop_saveset( EEG, 'filename',[files{ii} '_filt.set'],'filepath',filtfiledir);
        
        EEG = [];
        
        cd(filtfiledir);
        
        EEG = pop_loadset('filename',[files{ii} '_filt.set'],'filepath',filtfiledir);
        %EEG = pop_select( EEG, 'channel',{'Fp1','AF7','AF3','F1','F3','F5','F7','FT7','FC5','FC3','FC1','C1','C3','C5','T7','TP7','CP5','CP3','CP1','P1','P3','P5','P7','P9','PO7','PO3','O1','Iz','Oz','POz','Pz','CPz','Fpz','Fp2','AF8','AF4','AFz','Fz','F2','F4','F6','F8','FT8','FC6','FC4','FC2','FCz','Cz','C2','C4','C6','T8','TP8','CP6','CP4','CP2','P2','P4','P6','P8','P10','PO8','PO4','O2'});
        
        EEG = pop_runica(EEG, 'extended',1,'interupt','on');
        
        EEG = pop_saveset(EEG, 'filename',[files{ii} '_ica.set'],'filepath',icafiledir);
        
        EEG = [];
        
        cd(icafiledir);
        
    end
end
