

eegh
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_loadset('filename','Participant1_icar.set','filepath','F:\\Seagate\\Jasmine\\EEG\\2022\\TrustEEG\\ICAr\\');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  'condition 61'  }, [-1  1], 'newname', 'BDF file pruned with ICA epochs', 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'savenew','F:\\Seagate\\Jasmine\\EEG\\2022\\TrustEEG\\Epoched\\Participant1_advisor_accurate_feedback.set','gui','off'); 
EEG = eeg_checkset( EEG );
EEG = pop_rmbase( EEG, [-100 0] ,[]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'savenew','F:\\Seagate\\Jasmine\\EEG\\2022\\TrustEEG\\Epoched\\Participant1_advisor_accurate_feedback_br.set','gui','off'); 
EEG = eeg_checkset( EEG );
pop_eegplot( EEG, 1, 1, 1);
EEG = pop_rejepoch( EEG, [28 33 35 136 147] ,0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 3,'savenew','F:\\Seagate\\Jasmine\\EEG\\2022\\TrustEEG\\Epoched\\Participant1_advisor_accurate_feedback_br_p.set','gui','off'); 
EEG = eeg_checkset( EEG );
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 4,'retrieve',1,'study',0); 
EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  'condition 62'  }, [-1  1], 'newname', 'BDF file pruned with ICA epochs', 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'savenew','F:\\Seagate\\Jasmine\\EEG\\2022\\TrustEEG\\Epoched\\Participant1_advisor_copycat_feedback.set','gui','off'); 
EEG = eeg_checkset( EEG );
EEG = pop_rmbase( EEG, [-100 0] ,[]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 5,'savenew','F:\\Seagate\\Jasmine\\EEG\\2022\\TrustEEG\\Epoched\\Participant1_advisor_copycat_feedback_br.set','gui','off'); 
EEG = eeg_checkset( EEG );
pop_eegplot( EEG, 1, 1, 1);
EEG = pop_rejepoch( EEG, [113 131 138] ,0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 6,'savenew','F:\\Seagate\\Jasmine\\EEG\\2022\\TrustEEG\\Epoched\\Participant1_advisor_copycat_feedback_br_p.set','gui','off'); 
EEG = eeg_checkset( EEG );
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 7,'retrieve',1,'study',0); 
[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
EEG = eeg_checkset( EEG );
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'retrieve',2,'study',0); 
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'retrieve',7,'study',0); 
[EEG ALLEEG CURRENTSET] = eeg_retrieve(ALLEEG,7);
EEG = pop_loadset('filename','Participant1_icar.set','filepath','F:\\Seagate\\Jasmine\\EEG\\2022\\TrustEEG\\ICAr\\');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  'condition 63'  }, [-1  1], 'newname', 'BDF file pruned with ICA epochs', 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 8,'savenew','F:\\Seagate\\Jasmine\\EEG\\2022\\TrustEEG\\Epoched\\Participant1_advisor_accurate_nofeedback.set','gui','off'); 
EEG = eeg_checkset( EEG );
EEG = pop_rmbase( EEG, [-100 0] ,[]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 9,'savenew','F:\\Seagate\\Jasmine\\EEG\\2022\\TrustEEG\\Epoched\\Participant1_advisor_accurate_nofeedback_br.set','gui','off'); 
EEG = eeg_checkset( EEG );
pop_eegplot( EEG, 1, 1, 1);
EEG = pop_rejepoch( EEG, 143,0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 10,'savenew','F:\\Seagate\\Jasmine\\EEG\\2022\\TrustEEG\\Epoched\\Participant1_advisor_accurate_nofeedback_br_p.set','gui','off'); 
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 11,'retrieve',8,'study',0); 
EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  'condition 64'  }, [-1  1], 'newname', 'BDF file pruned with ICA epochs', 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 8,'savenew','F:\\Seagate\\Jasmine\\EEG\\2022\\TrustEEG\\Epoched\\Participant1_advisor_copycat_nofeedback.set','gui','off'); 
EEG = eeg_checkset( EEG );
EEG = pop_rmbase( EEG, [-100 0] ,[]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 12,'savenew','F:\\Seagate\\Jasmine\\EEG\\2022\\TrustEEG\\Epoched\\Participant1_advisor_copycat_nofeedback_br.set','gui','off'); 
EEG = eeg_checkset( EEG );
pop_eegplot( EEG, 1, 1, 1);
EEG = pop_rejepoch( EEG, [39 43 64 98 102 113] ,0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 13,'savenew','F:\\Seagate\\Jasmine\\EEG\\2022\\TrustEEG\\Epoched\\Participant1_advisor_copycat_nofeedback_br_p.set','gui','off'); 
