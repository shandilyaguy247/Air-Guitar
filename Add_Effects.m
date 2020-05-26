function y = add_effect(in, Fs, effect)
Fs = 44100;
distortion_gain = 11;
distortion_tone = 0.4;
flanger_mix = 0.8;
flanger_delay = 5;
flanger_width = 5;
flanger_rate = 0.4;
tremblo_rate = 4;
tremblo_depth = 0.7;
tremblo_lag = 100;
tremblo_osc = 'tri';
digdelay_depth = 0.8;
digdelay_delay = 1/3;
digdelay_feedback = 0.25;
switch effect
    case 1
        y = distortion(in,distortion_gain,distortion_tone,Fs);
    case 2
        y = flanger(in,flanger_mix,flanger_delay,flanger_width,flanger_rate,Fs);
    case 3
        y = tremblo(in,Fs,tremblo_rate,tremblo_depth,tremblo_lag,tremblo_osc);
    case 4
        y = digdelay(in,digdelay_depth,digdelay_delay,digdelay_feedback,Fs);
    otherwise
        y = in
end
