TriOsc t => dac;

fun void playNotes(Osc osc, int notes[], dur durs[], float gain, dur tail) {
    for(0 => int i; i < notes.cap(); i++){
        notes[i] => Std.mtof => osc.freq;
        gain => osc.gain;
        durs[i] - tail => now;// play duration -tail
        0.0 => osc.gain;
        tail => now; // play tail
    }
}

[60, 62, 63, 65, 67, 69, 70, 72] @=> int scale[]; // Dorian minor scale
0.5::second => dur beat;
[beat, beat, beat, beat, beat, beat, beat, beat] @=> dur volume[];

playNotes(t, scale, volume, 0.5, beat * 0.2);