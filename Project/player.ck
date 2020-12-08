public class Player{
    (0.2 / 5.0) :: second => static dur tail;
    Repeat r;
    
    fun void play(StkInstrument instrument, int notes[], dur durations[], string mode){
        for(0 => int i; i < notes.cap(); i++){
            if(r.repeatition(notes, i)){
                playNote(instrument, notes[i], durations[i] - tail, mode);
                1.0 => instrument.noteOff;
                tail => now;
            }
            else{
                playNote(instrument, notes[i], durations[i], mode);
            }
        }
    }
    
   fun void playNote(StkInstrument instrument, int note, dur duration, string mode){
       note - 12 => Std.mtof => instrument.freq;
       
       if(note != -1){
           if(mode == "intro"){
               0.5 => instrument.noteOn;
           }
           else if(mode == "outro"){
               note => Std.mtof => instrument.freq;
               0.5 => instrument.noteOn;
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
}