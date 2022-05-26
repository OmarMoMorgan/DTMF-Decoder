function hh = dtmfdesign(fb, L, fs)
%DTMFDESIGN
% hh = dtmfdesign(fb, L, fs)
% returns a matrix (L by length(fb)) where each column contains
% the impulse response of a BPF, one for each frequency in fb
% fb = vector of center frequencies
% L = length of FIR bandpass filters
% fs = sampling freq
%
% Each BPF must be scaled so that its frequency response has a
% maximum magnitude equal to one.
omega = 0:(pi/fs):pi;
%L = 80;
hh = zeros(L,8);

for i = 1:length(fb)
DesiredFreq = fb(i)/8000;

bb = cos(2*DesiredFreq*pi.*[0:L-1]).*ones(1,L);
ll  = max(freekz(bb,1,omega));
%NFinal = (1/ll).*freqz(bb,1,omega);
Final  = (1/ll).*bb;
hh(1:L,i) = Final;

%plot(omega/pi , abs(NFinal))

%%hold on
end