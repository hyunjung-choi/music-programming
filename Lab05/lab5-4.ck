TriOsc t => dac;

0.5 => float on;
0.0 => float off;

fun void playNotes(Osc osc, int notes[], dur durs[], float gain, dur tail) {
    for(0 => int i; i < notes.cap(); i++){
        if(notes[i] == -1){
            0.0 => osc.gain;
        }
        else{
            notes[i] => Std.mtof => osc.freq;
            gain => osc.gain;
        }
        durs[i] - tail => now;// play duration -tail
        0.0 => osc.gain;
        tail => now; // play tail
    }
}

[65, -1, 68, -1, 65, 65, 70, 65, 63,
 65, -1, 72, -1, 65, 65, 73, 72, 68,
 65, 72, 77, 65, 63, 63, 60, 67, 65] @=> int bhcopNotes[];

// note length
0.25 :: second => dur beat; // basic duration
beat / 5.0 => dur rest; // duration of no sound after each note
beat => dur qn; // quarter (1/4) note sound
beat * 2 => dur hn; // half (1/2) note sound
beat / 2 => dur en; // eighth (1/8) note sound

[qn, qn, qn, en, qn, en, qn, qn, qn,
 qn, qn, qn, en, qn, en, qn, qn, qn,
 qn, qn, qn, en, qn, en, qn, qn, hn] @=> dur bhcopDurs[];

// play
playNotes(t, bhcopNotes, bhcopDurs, on, rest);
