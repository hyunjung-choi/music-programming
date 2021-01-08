Bowed viol => dac;
SndBuf snare => dac;
Impulse imp => ResonZ rez => DelayA str => dac;
str => OneZero lowPass => str;

// volume
0.4 => float on;
0.0 => float off;
1 => int count;
0 => int n;

// Check the repetition of note
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

fun int setStart(int count){
    if(count == 1)
        return 0;
    else
        return 4;
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

for(0 => int j; j < 2; j++){
    setStart(count) => n;
    
    for(n => int i; i < melody.cap(); i++){
        if((i >= 4 && i <= 6) || (i >= 10 && i <= 16) || (i >= 20 && i <= 23)){
            playSnare(snare);
        }
        
        if(harmony[i] != -1){
            harmony[i] + 12 => Std.mtof => rez.freq;
            110.0 :: samp => str.delay;
            100 => rez.Q;
            250 => rez.gain;
            1.0 => imp.next;
        }
        
        if(melody[i] == -1){
            on => viol.noteOn;
            0.05 => viol.vibratoGain;
            durNotes[i] - rest => now;
        }
        else{
            0.0 => viol.vibratoGain;
            if(repeatition(melody, i)){
                melody[i] => Std.mtof => viol.freq;
                on => viol.noteOn;
                durNotes[i] - rest => now;
                1.0 => viol.noteOff;
            }

            else{
                melody[i] => Std.mtof => viol.freq;
                on => viol.noteOn;
                durNotes[i] - rest => now;
            }
        }
        rest => now;
        
        if(i == melody.cap() -1)
            count++;
    }   
}
