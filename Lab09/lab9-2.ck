class BPM{
    dur quarterNote, eighthNote, sixteenthNote, thirtysecondNote, halfNote;
    fun void tempo(float beat) {
        60.0/(beat) => float SPB;
        SPB :: second => quarterNote;
        quarterNote * 2.0 => halfNote;
        quarterNote*0.5 => eighthNote;
        eighthNote*0.5 => sixteenthNote;
        sixteenthNote*0.5 => thirtysecondNote;
    }
}

class Player{
   fun void playNote(StkInstrument instrument, int note, dur duration){
    note => Std.mtof => instrument.freq;
    if(note != -1){
        0.1 => instrument.noteOn;
    }
    duration => now;
    1.0 => instrument.noteOff;
    }

    fun void play(StkInstrument instrument, int notes[], dur durations[]){
        for(0 => int i; i < notes.cap(); i++){
            playNote(instrument, notes[i], durations[i]);
        }
    }
}

BPM bpm;
bpm.tempo(150); // 0.4 * 150 = 60

bpm.eighthNote => dur en; // eighth notes (1/8)
bpm.quarterNote => dur qn; // quarter notes (1/4)
bpm.halfNote => dur hn; // half notes (1/2)

[
65, 67, 69, 65,  65, 67, 69, 65,  69, 70, 72,  69, 70, 72,
72, 74, 72, 70, 69, 65, 72, 74, 72, 70, 69, 65, 65, 60, 65, 65, 60, 65
]
@=> int melody[];

[
65, 67, 69, 65,  65, 67, 69, 65,  69, 70, 72,  69, 70, 72, 
72, 74, 72, 70, 69, 65, 72, 74, 72, 70, 69, 65, 69, 64, 69, 69, 64, 69
]
@=> int high[];

[
qn, qn, qn, qn,  qn, qn, qn, qn, qn, qn, hn,  qn, qn, hn,
en, en, en, en, qn, qn, en, en, en, en, qn, qn, qn, qn, hn, qn, qn, hn
]
@=> dur melodyDur[];

[
53, 60, 53,  53, 60, 53,  53, 60, 53,  53, 60, 53,
53, 60, 53,  53, 60, 53,  53, 60, 53,  53, 60, 53
]
@=> int low[];

[
qn, qn, hn,  qn, qn, hn,  qn, qn, hn,  qn, qn, hn,
qn, qn, hn,  qn, qn, hn,  qn, qn, hn,  qn, qn, hn
]
@=> dur lowDur[];

Mandolin f[3];
Player p;

f[0] => Gain hand => dac; 
f[1] => hand => dac;
f[2] => hand => dac;

spork ~ p.play(f[0], melody, melodyDur);
spork ~ p.play(f[1], high, melodyDur);
spork ~ p.play(f[2], low, lowDur);

16 * hn => now;