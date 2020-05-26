function [out] = distortion(in,gain,tone,fs)
% DISTORTION simulates a distorted guitar
% IN - guitar input sound vector (Nx1)
% FS - sampling rate of IN
% GAIN - distortion level
% TONE - 0 -> bass , 1 -> treble

B=in;
%B=B/max(abs(B));
B=gain*B;
B=erf(B);

%Lowpass at 1.2kHz and highpass at 265Hz
[ZL,PL,KL]=butter(1,1200/(fs/2),'low');
[ZH,PH,KH]=butter(1,265/(fs/2),'high');
[BL,AL]=zp2tf(ZL,PL,KL);
[BH,AH]=zp2tf(ZH,PH,KH);

% OUTPUT - filter based on position/value of tone control
out=(1-tone)*filter(BL,AL,B)+tone*filter(BH,AH,B);

end
