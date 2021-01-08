SinOsc s => dac;
TriOsc t => dac;
SndBuf snare => dac;

// volume
0.3 => float on;
0.0 => float off;

fun void playNotes(Osc osc, Osc osc2, int notes[], int harmony[], dur durs[], float gain, dur tail) {
    for(0 => int i; i < notes.cap(); i++){
        if((i >= 4 && i <= 6) || (i >= 10 && i <= 16) || (i >= 20 && i <= 23)){
            playSnare(snare);
        }
        
        if(harmony[i] == -1){
            0.0 => osc2.gain;
        }
        else{
            harmony[i] => Std.mtof => osc2.freq;
            gain => osc2.gain;
        }
        
        if(notes[i] == -1){
            0.0 => osc.gain;
            durs[i] - tail => now;
        }
        else{
            if(repeatition(notes, i)){
                notes[i] => Std.mtof => osc.freq;
                gain => osc.gain;
                durs[i] - tail => now;
                0.0 => osc.gain;
            }

            else{
                notes[i] => Std.mtof => osc.freq;
                gain => osc.gain;
                durs[i] - tail=> now;
            }
        }
        0.0 => osc2.gain;
        tail => now;
    }
}

/* Check the repetition of note */
fun int repeatition(int notes[], int i){
    if (i < notes.cap() - 1 && notes[i] == notes[i + 1])
        return 1;
    else
        return 0;
}

fun void playSnare(SndBuf snare){
    "C:/Users/hyunjung/Desktop/audio/snare_02.wav" => snare.read;
    snare.pos;
}

// note length
0.4 :: second => dur beat; // basic duration
beat / 5.0 => dur rest; // duration of no sound after each note
beat => dur qn; // quarter (1/4) note sound
beat * (3.0/2.0) => dur dqn; // dotted quarter (1.5/4) note sound
beat * 2 => dur hn; // half (1/2) note sound
beat * 3 => dur q3n; //dotted half (3/4) note sound
beat / 2 => dur en; // eighth (1/8) note sound
beat / 4 => dur sn; // sixteenth (1/16) note sound

// MIDI notes
[67, 69, 71, 72,
 76, 76, 76, 
 76, 81, 76,
 74, -1, -1, -1,
 72, 72, 72,
 72, 71, 69, 
 71, -1, -1, -1] @=> int melody[];
 
[-1, -1, -1, -1,
 41, 41, 41, 
 41, 45, 45,
 40, 40, 40, 40,
 38, 38, 38,
 38, 45, 45, 
 36, 36, 36, 36] @=> int harmony[];
 
[en, en, en, en, 
 q3n, q3n, q3n, 
 qn, dqn, en,
 q3n, q3n, q3n, q3n,
 q3n, q3n, q3n,
 qn, dqn, en,
 q3n, q3n, q3n, q3n]@=> dur durNotes[];

playNotes(s, t, melody, harmony, durNotes, on, rest);
