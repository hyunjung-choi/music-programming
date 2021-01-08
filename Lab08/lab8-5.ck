fun void playNote(StkInstrument instrument, int note, dur duration){
    note => Std.mtof => instrument.freq;
    if(note != -1)
        1.0 => instrument.noteOn;
    duration => now;
}

fun void play(StkInstrument instrument, int notes[], dur durations[]){
    for(0 => int i; i < notes.cap(); i++){
        playNote(instrument, notes[i], durations[i]);
    }
}

fun void playBackward(StkInstrument instrument, int notes[], dur durations[]){
    for(notes.cap() -1 => int i; i >= 0; i--){
        playNote(instrument, notes[i], durations[i]);
    }
}

0.2::second => dur en; // eighth note (1/8)
en * 2 => dur qn; // quarter note (1/4)
en * 4 => dur hn; // half note (1/2)

// Bach Canon Score
[
60, 63, 67, 68, 59, -1, 
67, 66, 65, 64, 63, 62, 61, 60,
59, 55, 62, 65, 63, 62, 60, 63,
67, 65, 67, 72, 67, 63, 62, 63, 65, 67, 69, 71, 
72, 63, 65, 67, 68, 62, 63, 65, 67, 65, 63, 62,
63, 65, 67, 68, 70, 68, 67, 65, 67, 68, 70, 72,
73, 70, 68, 67, 69, 71, 72, 74, 75, 72, 71, 69, 
71, 72, 74, 75, 77, 74, 67, 74, 72, 74, 75, 77,
75, 74, 72, 71, 72, 67, 63, 60
]
@=> int notes[];

[
hn, hn, hn, hn, hn, qn, 
hn, hn, hn, hn, hn, qn, qn, qn, 
qn, qn, qn, qn, hn, hn, hn, hn,
en, en, en, en, en, en, en, en, en, en, en, en,
en, en, en, en, en, en, en, en, en, en, en, en,
en, en, en, en, en, en, en, en, en, en, en, en,
en, en, en, en, en, en, en, en, en, en, en, en,
en, en, en, en, en, en, en, en, en, en, en, en,
en, en, en, en, qn, qn, qn, qn //30
]
@=> dur durs[];

Mandolin f[2];

f[0] => dac.left; 
f[1] => dac;

spork ~ play(f[0], notes, durs);
spork ~ playBackward(f[1], notes, durs);
30 * hn => now;
