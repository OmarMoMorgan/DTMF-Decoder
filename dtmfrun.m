function keys = dtmfrun(xx,L,fs)
 %DTMFRUN    keys = dtmfrun(xx,L,fs)
 %    returns the list of key names found in xx.
 %   keys = array of characters, i.e., the decoded key names
 %     xx = DTMF waveform
 %      L = filter length
 %     fs = sampling freq
 %

 dtmfkeys =['1','2','3','A','4','5','6','B','7','8','9','C','*','0','#','D'];
 center_freqs = [697,770,852,941,1209,1336,1477,1633]; %<============================FILL IN THE CODE HERE
 hh = dtmfdesign( center_freqs,L,fs );
 %   hh = L by 8 MATRIX of all the filters. Each column contains the
 %         impulse response of one BPF (bandpass filter)
 %
 [nstart,nstop] = dtmfcut(xx,fs);   %<--Find the tone bursts
 keys = [];
 for kk=1:length(nstart)
    x_seg = xx(nstart(kk):nstop(kk));    %<--Extract one DTMF tone
    sc = dtmfscore(x_seg,hh);   %<=========================================FILL IN THE CODE HERE
    final = find(sc);
    (final(1)-1)*4
    final(2)-4
    keys(kk) = dtmfkeys((final(1)-1)*4 + (final(2)-4));
end