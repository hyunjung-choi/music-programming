SinOsc s1 => dac;
TriOsc t1 => dac;

0.3 => float onGain;
0 => int offGain;

0.3::second => dur beat;

349.2 => float F4;
392.0 => float G4;
440.0 => float A4;
261.6 => float C4;
466.2 => float Bb4;
523.6 => float C5;
587.3 => float D5;
174.6 => float F3;
329.6 => float E4;


/* 1st, 2nd bar F4 G4 A4 F4 */
for(0 => int i; i< 2; i++){
    F4 => s1.freq;
    F3 => t1.freq;
    onGain => s1.gain;
    onGain => t1.gain;
    beat => now;
    offGain => s1.gain;
    offGain => t1.gain;
    beat => now;
    
    G4 => s1.freq;
    C4 => t1.freq;
    onGain => s1.gain;
    onGain => t1.gain;
    beat => now;
    offGain => s1.gain;
    offGain => t1.gain;
    beat => now;
    
    A4 => s1.freq;
    F3 => t1.freq;
    onGain => s1.gain;
    onGain => t1.gain;
    beat => now;
    offGain => s1.gain;
    offGain => t1.gain;
    beat => now;
    
    F4 => s1.freq;
    onGain => s1.gain;
    beat => now;
    offGain => s1.gain;
    beat => now;
}

/* 3rd, 4th bar A4 Bb4 C5 */
for(0 => int i; i< 2; i++){
    A4 => s1.freq;
    F3 => t1.freq;
    onGain => s1.gain;
    onGain => t1.gain;
    beat => now;
    offGain => s1.gain;
    offGain => t1.gain;
    beat => now;
    
    Bb4 => s1.freq;
    C4 => t1.freq;
    onGain => s1.gain;
    onGain => t1.gain;
    beat => now;
    offGain => s1.gain;
    offGain => t1.gain;
    beat => now;
    
    C5 => s1.freq;
    F3 => t1.freq;
    onGain => s1.gain;
    onGain => t1.gain;
    2 * beat => now;
    offGain => s1.gain;
    offGain => t1.gain;
    2 * beat => now;
}

/* 5th, 6th bar C5 D5 C5 Bb4 A4 F4 */
for(0 => int i; i< 2; i++){
    C5 => s1.freq;
    F3 => t1.freq;
    onGain => s1.gain;
    onGain => t1.gain;
    0.5 * beat => now;
    offGain => s1.gain;
    offGain => t1.gain;
    0.5 * beat => now;
    
    D5 => s1.freq;
    onGain => s1.gain;
    0.5 * beat => now;
    offGain => s1.gain;
    0.5 * beat => now;
    
    C5 => s1.freq;
    C4 => t1.freq;
    onGain => s1.gain;
    onGain => t1.gain;
    0.5 * beat => now;
    offGain => s1.gain;
    offGain => t1.gain;
    0.5 * beat => now;
    
    Bb4 => s1.freq;
    onGain => s1.gain;
    0.5 * beat => now;
    offGain => s1.gain;
    0.5 * beat => now;
    
    A4 => s1.freq;
    F3 => t1.freq;
    onGain => s1.gain;
    onGain => t1.gain;
    beat => now;
    offGain => s1.gain;
    offGain => t1.gain;
    beat => now;
    
    F4 => s1.freq;
    onGain => s1.gain;
    beat => now;
    offGain => s1.gain;
    beat => now;
}

SinOsc s2 => dac;

/* 7th, 8th bar F4 C4 F4 */
for(0 => int i; i< 2; i++){
    F4 => s1.freq;
    A4 => s2.freq;
    F3 => t1.freq;
    onGain => s1.gain;
    onGain => s2.gain;
    onGain => t1.gain;
    beat => now;
    offGain => s1.gain;
    offGain => s2.gain;
    offGain => t1.gain;
    beat => now;
    
    C4 => s1.freq;
    E4 => s2.freq;
    C4 => t1.freq;
    onGain => s1.gain;
    onGain => s2.gain;
    onGain => t1.gain;
    beat => now;
    offGain => s1.gain;
    offGain => s2.gain;
    offGain => t1.gain;
    beat => now;
    
    F4 => s1.freq;
    A4 => s2.freq;
    F3 => t1.freq;
    onGain => s1.gain;
    onGain => s2.gain;
    onGain => t1.gain;
    2 * beat => now;
    offGain => s1.gain;
    offGain => s2.gain;
    offGain => t1.gain;
    2 * beat => now;
}