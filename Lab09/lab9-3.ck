class Player{
   fun void playNote(StkInstrument instrument, int note, dur duration){
    note => Std.mtof => instrument.freq;
    if(note != -1){
        0.2 => instrument.noteOn;
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

class BPM{
    dur wholeNote, halfNote;
    dur quarterNote, eighthNote, sixteenthNote, thirtysecondNote;
    dur sixthNote, thirdNote;
    fun void tempo(float beat) {
        60.0/(beat) => float SPB;
        SPB :: second => quarterNote;
        quarterNote * 2.0 => halfNote;
        halfNote * 2.0 => wholeNote;
        quarterNote*0.5 => eighthNote;
        eighthNote*0.5 => sixteenthNote;
        sixteenthNote*0.5 => thirtysecondNote;
        wholeNote / 3.0 => thirdNote;
        wholeNote / 6.0 => sixthNote;

    }
}

BPM bpm;
bpm.tempo(300); 

bpm.sixthNote => dur sn; // sixth note (1/6)
bpm.thirdNote => dur tn; // third note (1/3)
bpm.halfNote => dur hn; // half note (1/2)
bpm.wholeNote => dur wn; // whole note (1)

[
60, 60, 60, 62, 64,
64, 62, 64, 65, 67,
72, 72, 72, 67, 67, 67, 64, 64, 64, 60, 60, 60,
67, 65, 64, 62, 60
]
@=> int melody[];

[
hn, hn, tn, sn, hn, 
tn, sn, tn, sn, wn,
sn, sn, sn, sn, sn, sn, sn, sn, sn, sn, sn, sn,
tn, sn, tn, sn, wn
]
@=> dur melodyDur[];

Wurley f[4];
f[0] => Gain quartet => dac;
f[1] => quartet => dac;
f[2] => quartet => dac;
f[3] => quartet => dac;

Player p;
spork ~ p.play(f[0], melody, melodyDur);
2 * wn => now;
spork ~ p.play(f[1], melody, melodyDur);
2 * wn => now;
spork ~ p.play(f[2], melody, melodyDur);
2 * wn => now;
spork ~ p.play(f[3], melody, melodyDur);
8 * wn => now;