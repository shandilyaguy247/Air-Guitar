function y = create_music(c)
    Fs = 44100;
    A = 110; % The A string of a guitar is tuned to 110 Hz
    Eoffset = -5;
    Doffset = 5;
    Goffset = 10;
    Boffset = 14;
    E2offset = 19;

    F = linspace(1/Fs, 1000, 2^12);
    x = zeros(Fs*2, 1);

    %For barre chords
    if c == 1
    % A major
        fret = [5 7 7 6 5 5];
    elseif c == 2 % F major
        fret = [1 3 3 2 1 1];
    elseif c == 3 % B major
        fret = [7 9 9 8 7 7];
    elseif c == 4 % E minor
        fret = [0 2 2 0 0 0];
    elseif c == 5 % A minor
        fret = [5 7 7 5 5 5];
    elseif c == 6 % C major
        fret = [8 10 10 9 8 8];
    elseif c == 7 % D major
        fret = [10 12 12 11 10 10];
    elseif c == 8 % G major
        fret = [3 5 5 4 3 3];
    end

    delay = [round(Fs/(A*2^((fret(1)+Eoffset)/12))), ...
        round(Fs/(A*2^(fret(2)/12))), ...
        round(Fs/(A*2^((fret(3)+Doffset)/12))), ...
        round(Fs/(A*2^((fret(4)+Goffset)/12))), ...
        round(Fs/(A*2^((fret(5)+Boffset)/12))), ...
        round(Fs/(A*2^((fret(6)+E2offset)/12)))];

    b = cell(length(delay),1);
    a = cell(length(delay),1);
    H = zeros(length(delay),4096);
    note = zeros(length(x),length(delay));
    for indx = 1:length(delay)

    % Build a cell array of numerator and denominator coefficients.
        b{indx} = firls(42, [0 1/delay(indx) 2/delay(indx) 1], [0 0 1 1]).';
        a{indx} = [1 zeros(1, delay(indx)) -0.5 -0.5].';
    % Populate the states with random numbers and filter the input zeros.
        zi = rand(max(length(b{indx}),length(a{indx}))-1,1);
        note(:, indx) = filter(b{indx}, a{indx}, x, zi);
        % Make sure that each note is centered on zero.
        note(:, indx) = note(:, indx)-mean(note(:, indx));
        [H(indx,:),W] = freqz(b{indx}, a{indx}, F, Fs);
    end

    offset = 35;
    offset = ceil(offset*Fs/1000); 
    for indx = 1:size(note, 2)
        note(:, indx) = [zeros(offset*(indx-1),1); ...
            note((1:end-offset*(indx-1)), indx)];
    end
    combinedNote = sum(note,2);
    combinedNote = combinedNote/max(abs(combinedNote));
    y = combinedNote;
end
