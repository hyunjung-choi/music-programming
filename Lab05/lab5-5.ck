TriOsc t => dac;

0.5 => float on;
0.0 => float off;
on => t.gain;

// note length
0.3::second => dur sn; // sixteenth (1/16)
0.6::second => dur en; // eighth (1/8)

[76, 75, 76, 75, 76, 71, 74, 72, 69, -1,
 60, 64, 69, 71, -1, 64, 68, 71, 72, -1, 64,
 76, 75, 76, 75, 76, 71, 74, 72, 69, -1,
60, 64, 69, 71, -1, 64, 72, 71, 69, -1] @=> int forEliseNotes[];

[sn, sn, sn, sn, sn, sn, sn, sn, en, sn,
 sn, sn, sn, en, sn, sn, sn, sn, en, sn, sn,
 sn, sn, sn, sn, sn, sn, sn, sn, en, sn,
 sn, sn, sn, en, sn, sn, sn, sn, en, en] @=> dur forEliseDurs[];


for(0 => int j; j < 2; j++){
    playNotes(t, forEliseNotes, forEliseDurs, on, 0::second);
}

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





