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

0.2::second => dur en; // eighth notes (1/8)
en * 2 => dur qn; // quarter notes (1/4)
qn * 2 => dur hn; // half notes (1/2)

[
65, 67, 69, 65,  65, 67, 69, 65,  69, 70, 72,  69, 70, 72,
72, 74, 72, 70, 69, 65, 72, 74, 72, 70, 69, 65, 65, 60, 65, 65, 60, 65
]
@=> int melody[];

[
qn, qn, qn, qn,  qn, qn, qn, qn, qn, qn, hn,  qn, qn, hn,
en, en, en, en, qn, qn, en, en, en, en, qn, qn, qn, qn, hn, qn, qn, hn
]
@=> dur melodyDur[];

Mandolin f => dac;

play(f, melody, melodyDur);