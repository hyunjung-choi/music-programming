Clarinet s => dac;

// volume
0.6 => float on;
0.0 => float off;

// note length
0.5::second => dur beat; // quarter (1/4) note duration
beat / 5 => dur rest; // duration of no sound after each note
beat - rest => dur qn; // quarter (1/4) note sound
qn * 2 => dur hn; // half (1/2) note sound
rest * 2 => dur hn_rest;
qn * 3 => dur q3n; //dotted half (3/4) note sound
rest * 3 => dur q3n_rest;

// MIDI notes
[67, 67, 69, 69, 67, 67, 64,
 67, 67, 64, 64, 62, -1,
 67, 67, 69, 69, 67, 67, 64,
 67, 64, 62, 64, 60, -1 ] @=> int melody[];
 
[qn, qn, qn, qn, qn, qn, hn, 
 qn, qn, qn, qn, q3n, qn,
 qn, qn, qn, qn, qn, qn, hn, 
 qn, qn, qn, qn, q3n, qn] @=> dur durNotes[];
 
[rest, rest, rest, rest, rest, rest, hn_rest, 
 rest, rest, rest, rest, q3n_rest, rest,
 rest, rest, rest, rest, rest, rest, hn_rest, 
 rest, rest, rest, rest, q3n_rest, rest] @=> dur durRests[];

// play
for (0 => int i; i < melody.cap(); i++) {
    if (melody[i] == -1){
        off => s.gain;
    }
    else{
        Std.mtof(melody[i]) => s.freq;
        on => s.gain;
    }
    durNotes[i] => now;
    off => s.gain;
    durRests[i] => now;
}