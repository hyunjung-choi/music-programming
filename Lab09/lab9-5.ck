public class MyClarinet extends Clarinet
{
    // Set frequency using MIDI Number
    fun float noteOn(int noteNum, float volume) {
        Std.mtof(noteNum) => this.freq;
        volume => this.noteOn; 
    }
    
    // Set frequency
    fun float noteOn(float freq, float volume){
        freq => this.freq;
        volume => this.noteOn;
    }
    
    // Set frequency using noteName
    fun float noteOn(string noteName, float volume){
        volume => this.noteOn;
                [21,23,12,14,16,17,19] @=> int notes[];
        noteName.charAt(0) - 65 => int base;
        notes[base] => int note;
        0.0 => float freq;
        if (base > -1 && base < 7) {
            if (noteName.charAt(1) == '#') // either '#' symbol
                notes[base] + 1 => note;
            if (noteName.charAt(1) == 's') // or 's' counts for sharp
                notes[base] + 1 => note;
            if (noteName.charAt(1) == 'b') // either 'b' or
                notes[base] - 1 => note;
            if (noteName.charAt(1) == 'f') // 'f' counts for flat
                notes[base] - 1 => note;
        }
        else {
            <<< "Illegal Note Name!!" >>>;
            return 0.0;
        }
        noteName.charAt(noteName.length()-1) - 48 => int oct;
        if (oct > -1 && oct < 10) {
            note + 12*oct => note;
            Std.mtof(note) => this.freq;
            volume => this.noteOn; 
        }
        else {
            <<< "Illegal Octave!!" >>>;
            return 0.0;
        }
    }
}


// make a new instance of our special clarinet
MyClarinet myclar => dac;

// test MIDI Number
myclar.noteOn(60, 1.0);
second => now;
1 => myclar.noteOff;
second => now;

// test our old noteOn function
myclar.noteOn(1.0);
second => now;
1 => myclar.noteOff;
second => now;

//test frequency
myclar.noteOn(440.5, 1.0);
second => now;
1 => myclar.noteOff;
second => now;

// test noteName
myclar.noteOn("G#5", 1.0);
second => now;
1 => myclar.noteOff;
second => now;
