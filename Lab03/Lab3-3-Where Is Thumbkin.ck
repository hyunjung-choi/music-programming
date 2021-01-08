SinOsc s => dac;

// volume
0.6 => float on;
0.0 => float off;

// note length
0.3::second => dur beat; // quarter (1/4) note duration
beat / 5 => dur rest; // duration of no sound after each note
beat - rest => dur qn; // quarter (1/4) note sound
qn * 2 => dur hn; // half (1/2) note sound
rest * 2 => dur hn_rest;
qn / 2 => dur en; // eighth (1/8) note sound
rest / 2 => dur en_rest;

// MIDI notes
[65, 67, 69, 65, 
 65, 67, 69, 65,
 69, 70, 72,
 69, 70, 72,
 72, 74, 72, 70, 69, 65, 
 72, 74, 72, 70, 69, 65,
 65, 60, 65, -1,
 65, 60, 65, -1] @=> int melody[];
 
[qn, qn, qn, qn, 
 qn, qn, qn, qn,
 qn, qn, hn,
 qn, qn, hn,
 en, en, en, en, qn, qn,
 en, en, en, en, qn, qn,
 qn, qn, qn, qn,
 qn, qn, qn, qn] @=> dur durNotes[];
 
[rest, rest, rest, rest, 
 rest, rest, rest, rest,
 rest, rest, hn_rest,
 rest, rest, hn_rest,
 en_rest, en_rest, en_rest, en_rest, rest, rest,
 en_rest, en_rest, en_rest, en_rest, rest, rest,
 rest, rest, rest, rest, 
 rest, rest, rest, rest] @=> dur durRests[];

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