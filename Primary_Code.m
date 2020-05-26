go = true;
Fs = 44100;
eff = 0;
while go
    a = webread('http://192.168.43.77/');
    b = webread('http://192.168.43.248/');
    j = a.variables.jerk;
    c = b.variables.chord;
    e = b.variables.effect;
    if e ~= 0
        eff = eff + 1;
        disp("Changing effect...")
        if eff == 5
            eff = 0;
        end
    end
    if c ~= 0
        if j == 1
            disp("Create Sound...")
            y = create_sound(c);
            if eff ~=0
                disp("Adding effects...")
                y = add_effect(y, Fs, eff);
            end
            disp("Playing Music...")
            sound (y,Fs);
            disp("Done!")
        end
    end
end
        
