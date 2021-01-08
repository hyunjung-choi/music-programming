SinOsc s => dac;
SinOsc t => dac;

// volume
0.5 => float on;
0.0 => float off;

// note length
0.4 :: second => dur beat; // basic duration
beat / 5.0 => dur rest; // duration of no sound after each note
beat => dur qn; // quarter (1/4) note sound
beat * (3.0/2.0) => dur dqn; // dotted quarter (1.5/4) note sound
beat * 2 => dur hn; // half (1/2) note sound
beat * 3 => dur q3n; //dotted half (3/4) note sound
beat / 2 => dur en; // eighth (1/8) note sound
beat / 4 => dur sn; // sixteenth (1/16) note sound

// MIDI notes
[67, 69, 71, 72,
 76, 76, 76, 
 76, 81, 76,
 74, -1, -1, -1,
 72, 72, 72,
 72, 71, 69, 
 71, -1, -1, -1] @=> int melody[];
 
[-1, -1, -1, -1,
 41, 41, 41, 
 41, 45, 45,
 40, 40, 40, 40,
 38, 38, 38,
 38, 45, 45, 
 36, 36, 36, 36] @=> int harmony[];
 
[en, en, en, en, 
 q3n, q3n, q3n, 
 qn, dqn, en,
 q3n, q3n, q3n, q3n,
 q3n, q3n, q3n,
 qn, dqn, en,
 q3n, q3n, q3n, q3n]@=> dur durNotes[];
 
// play
for (0 => int i; i < melody.cap(); i++) {
    if (melody[i] == -1)
        off => s.gain;
    else{
        Std.mtof(melody[i]) => s.freq;
        on => s.gain;
    }
    
    if (harmony[i] == -1)
        off => t.gain;
    else{
        Std.mtof(harmony[i]) => t.freq;
        on => t.gain;
    }
    durNotes[i] => now;
    off => s.gain;
    off => t.gain;
    rest => now;
}