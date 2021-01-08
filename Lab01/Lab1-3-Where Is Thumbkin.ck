TriOsc s => dac;

0.3::second => dur beat;

349.2 => float F4;
392.0 => float G4;
440.0 => float A4;
261.6 => float C4;
466.2 => float Bb4;
523.6 => float C5;
587.3 => float D5;

for(0 => int j; j < 2; j++){
    /* 1st, 2nd bar F4 G4 A4 F4 */
    for(0 => int i; i< 2; i++){
        F4 => s.freq;
        1 => s.gain;
        beat => now;
        0 => s.gain;
        beat => now;
        
        G4 => s.freq;
        1 => s.gain;
        beat => now;
        0 => s.gain;
        beat => now;
        
        A4 => s.freq;
        1 => s.gain;
        beat => now;
        0 => s.gain;
        beat => now;
        
        F4 => s.freq;
        1 => s.gain;
        beat => now;
        0 => s.gain;
        beat => now;
    }

    /* 3rd, 4th bar A4 Bb4 C5 */
    for(0 => int i; i< 2; i++){
        A4 => s.freq;
        1 => s.gain;
        beat => now;
        0 => s.gain;
        beat => now;
        
        Bb4 => s.freq;
        1 => s.gain;
        beat => now;
        0 => s.gain;
        beat => now;
        
        C5 => s.freq;
        1 => s.gain;
        2*beat => now;
        0 => s.gain;
        2*beat => now;
    }

    /* 5th, 6th bar C5 D5 C5 Bb4 A4 F4 */
    for(0 => int i; i< 2; i++){
        C5 => s.freq;
        1 => s.gain;
        0.5*beat => now;
        0 => s.gain;
        0.5*beat => now;
        
        D5 => s.freq;
        1 => s.gain;
        0.5*beat => now;
        0 => s.gain;
        0.5*beat => now;
        
        C5 => s.freq;
        1 => s.gain;
        0.5*beat => now;
        0 => s.gain;
        0.5*beat => now;
        
        Bb4 => s.freq;
        1 => s.gain;
        0.5*beat => now;
        0 => s.gain;
        0.5*beat => now;
        
        A4 => s.freq;
        1 => s.gain;
        beat => now;
        0 => s.gain;
        beat => now;
        
        F4 => s.freq;
        1 => s.gain;
        beat => now;
        0 => s.gain;
        beat => now;
    }

    /* 7th, 8th bar F4 C4 F4 */
    for(0 => int i; i< 2; i++){
        F4 => s.freq;
        1 => s.gain;
        beat => now;
        0 => s.gain;
        beat => now;
        
        C4 => s.freq;
        1 => s.gain;
        beat => now;
        0 => s.gain;
        beat => now;
        
        F4 => s.freq;
        1 => s.gain;
        beat => now;
        0 => s.gain;
        beat => now;
        
        0 => s.gain;
        2*beat => now;
        /* Why 3*beat????? */
    }
 }
