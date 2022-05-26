function sc = dtmfscore(xx, hh)
%DTMFSCORE
% usage: sc = dtmfscore(xx, hh)
% returns a score based on the max amplitude of the filtered output
% xx = input DTMF tone
% hh = impulse response of ONE bandpass filter
%
% The signal detection is done by filtering xx with a length-L
% BPF, hh, and then finding the maximum amplitude of the output.
% The score is either 1 or 0.
% sc = 1 if max(|y[n]|) is greater than, or equal to, 0.59
% sc = 0 if max(|y[n]|) is less than 0.59
%
xx = xx*(2/max(abs(xx))); %--Scale the input x[n] to the range [-2,+2]
sc = zeros(1,8);
for i = 1:8
     dummy = conv(xx,hh(1:end,i));
     find(max(dummy))
     plot(1:length(dummy),dummy);
     if find(max(dummy)) > 0.59
         sc(i) = 1;
     else
         sc(i) = 0;
     end
end