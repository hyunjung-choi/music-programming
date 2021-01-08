TriOsc t => dac;

// volume level
0.1 => float on;
0.0 => float off;

// note length
0.25 :: second => dur beat; // basic duration
beat / 5.0 => dur rest; // duration of no sound after each note
beat => dur qn; // quarter (1/4) note sound
beat * 2 => dur hn; // half (1/2) note sound
beat / 2 => dur en; // eighth (1/8) note sound

// Harold Faltermeyer's Theme from the film Beverly Hills Cop (1984)
[65, -1, 68, -1, 65, 65, 70, 65, 63,
 65, -1, 72, -1, 65, 65, 73, 72, 68,
 65, 72, 77, 65, 63, 63, 60, 67, 65] @=> int bhcopNotes[];

[qn, qn, qn, en, qn, en, qn, qn, qn,
 qn, qn, qn, en, qn, en, qn, qn, qn,
 qn, qn, qn, en, qn, en, qn, qn, hn] @=> dur bhcopDurs[];

// play
for(0 => int i; i < bhcopNotes.cap(); i++){
    // <<< i, bhcopNotes[i], bhcopDurs[i]>>>;
    
    if (bhcopNotes[i] == -1){
        off => t.gain;
        bhcopDurs[i] => now;
    }
    else {
        Std.mtof(bhcopNotes[i]) => t.freq;
        on => t.gain;
        if (i < bhcopNotes.cap() - 1 && bhcopNotes[i] == bhcopNotes[i + 1]){
            bhcopDurs[i] - rest => now;
            off => t.gain;
            rest => now;
        }
        else
            bhcopDurs[i] => now;
    }
    //bhcopDurs[i] => now;
    //off => t.gain;
    //rest => now;
}