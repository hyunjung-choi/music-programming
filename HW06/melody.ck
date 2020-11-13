fun void playNote(StkInstrument instrument, int note, dur duration){
    note => Std.mtof => instrument.freq;
    if(note != -1){
        if(instrument == Clarinet){
            //1.0 => instrument.noiseGain;
            0.4 => instrument.noteOn;
        }
        else{
            0.3 => instrument.noteOn;
        }
        
    }
        
    else{
        1.0 => instrument.noteOff;
    }
    
    duration => now;
}

fun void play(StkInstrument instrument, int notes[], dur durations[]){
    (0.2 / 5.0) :: second => dur tail;
    for(0 => int i; i < notes.cap(); i++){
        if(repeatition(notes, i)){
            playNote(instrument, notes[i], durations[i] - tail);
            1.0 => instrument.noteOff;
            tail => now;
        }
        else{
            playNote(instrument, notes[i], durations[i]);
        }  
    }
}

fun int repeatition(int notes[], int i){
    if (i < notes.cap() - 1 && notes[i] == notes[i + 1])
        return 1;
    else
        return 0;
}

0.2::second => dur en; // eighth notes (1/8)
en * 2 => dur qn; // quarter notes (1/4)
qn * 2 => dur hn; // half notes (1/2)
en * 3 => dur dqn; // dotted quarter notes(3/8)
en * 8 => dur whole;
en / 5.0 => dur tail;

[
76, 76, 76, 76, 77, -1, 79,
-1, 79, 77, -1, 76, -1, 77,
74, 74, 74, 74, 76, -1, 77,
-1,
76, 76, 76, 76, 77, -1, 79,
-1, 79, 77, -1, 76, -1, 77,
74, 74, 74, 74, 76, -1, 70,
-1, 70, 72, 74, 70, -1, 72
]
@=> int melody[];

[
qn, en, en, en, en, en, en,
en, en, en, en, qn, en, en,
qn, en, en, en, en, en, en,
whole,
qn, en, en, en, en, en, en,
en, en, en, en, qn, en, en,
qn, en, en, en, en, en, en,
en, en, qn, en, en, en, en
]
@=> dur melodyDur[];

[
72, 72, 69, 67, 69, -1, 72, 
-1, 72, 69, 67, 67, -1, 69,
70, 70, 67, 64, 67, -1, 70, 
-1, 70, -1, 72,

72, 72, 69, 67, 69, -1, 72, 
-1, 72, 69, 67, 67, -1, 69,
70, 70, 67, 64, 67, -1, 70,
-1, 70, 72, 74, -1
]
@=> int intro[];

[
qn, en, en, en, en, en, en, 
en, en, en, en, qn, en, en, 
qn, en, en, en, en, en, en, 
qn, qn, en, dqn,

qn, en, en, en, en, en, en, 
en, en, en, en, qn, en, en, 
qn, en, en, en, en, en, en, 
en, en, qn, qn, qn
]
@=> dur introDur[];

//Blowhole
Clarinet b => dac;
PercFlut f => dac;

spork ~ play(b, melody, melodyDur);
spork ~ play(f, intro, introDur);

whole * 8 + qn => now;
