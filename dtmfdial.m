function  xx = dtmfdial(keyNames,fs)
dtmf.keys =['1','2','3','A';'4','5','6','B';'7','8','9','C';'*','0','#','D'];

%tmp_cmp = reshape(dtmf.keys)

dtmf.colTones = ones(4,1)*[1209,1336,1477,1633];
dtmf.rowTones = [697;770;852;941]*ones(1,4);

silence_duration=0.05;
tone_duration = 0.2;
xx=[];

tt=0:fs*tone_duration;

for i=1:length(keyNames)
    %for j=1:length(dtmf.keys)
        if(find (keyNames(i)==dtmf.keys))
            [ii,jj]=find(keyNames(i)==dtmf.keys);
            signal=cos(2*pi*dtmf.colTones(ii,jj)*tt/fs)+cos(2*pi*dtmf.rowTones(ii,jj)*tt/fs);
            silence = zeros(1,fs*silence_duration);
            xx=[xx,silence , signal];
        
        else  
           disp("invalid key name");
        end
    end


soundsc(xx,fs);
%fs = 8000 ;
%write the following line in the command
% dtmfdial('123456789ABCD*#0',8000)