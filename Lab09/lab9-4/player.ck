public class Player{
    
    fun void play(StkInstrument instrument, int notes[], dur durations[]){
        for(0 => int i; i < notes.cap(); i++){
            playNote(instrument, notes[i], durations[i]);
        }
    }
    
   fun void playNote(StkInstrument instrument, int note, dur duration){
    note => Std.mtof => instrument.freq;
    if(note != -1)
        1.0 => instrument.noteOn;
    duration => now;
    1.0 => instrument.noteOff;
    }
}