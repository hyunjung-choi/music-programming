fun void playNote(StkInstrument instrument, int note, dur duration){
    note => Std.mtof => instrument.freq;
    if(note != -1)
        1.0 => instrument.noteOn;
    duration => now;
}