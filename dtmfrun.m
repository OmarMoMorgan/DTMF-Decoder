function keys = dtmfrun(xx,L,fs)
 %DTMFRUN    keys = dtmfrun(xx,L,fs)
 %    returns the list of key names found in xx.
 %   keys = array of characters, i.e., the decoded key names
 %     xx = DTMF waveform
 %      L = filter length
 %     fs = sampling freq
 %

 center_freqs = .... %<============================FILL IN THE CODE HERE
 hh = dtmfdesign( center_freqs,L,fs );
 %   hh = L by 8 MATRIX of all the filters. Each column contains the
 %         impulse response of one BPF (bandpass filter)
 %
 [nstart,nstop] = dtmfcut(xx,fs);   %<--Find the tone bursts
 keys = [];
 for kk=1:length(nstart)
    x_seg = xx(nstart(kk):nstop(kk));    %<--Extract one DTMF tone
 ....   %<=========================================FILL IN THE CODE HERE
end